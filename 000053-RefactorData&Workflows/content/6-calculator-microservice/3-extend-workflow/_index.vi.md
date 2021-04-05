+++
title = "Mở rộng Calculattion workflow"
weight = 3
chapter = false
pre = "<b>6.3. </b>"
+++

Trong bước trước, chúng ta đã triển khai thủ công một trình xử lý hàm Lambda mà chỉ cần thêm các toán tử lại với nhau. Trong bước này, chúng ta sẽ thêm một hàm Lambda mới điều hành toán tử dựa trên tên của nó, đồng thời tạo ra một CI/CD pipeline để quản lý việc triển khai hàm Lambda. Đoạn code được cung cấp sẽ chỉ chứa toán tử cộng (add), bạn sẽ phải thực hiện các toán tử còn lại ở phần Thử thách phía sau. 
1. Truy cập AWS CodeStar và chọn **Create project**
2. Chọn **Java Sping** template và chọn **Next**
![Creatproject](../../../images/6/29.png?width=90pc)
3. Nhập tên project là **dev-calculator**
![Creatproject](../../../images/6/30.png?width=90pc)
4. Bây giờ chúng ta sẽ import CodeStar project vào Eclipse IDE. . Chọn biểu tượng **AWS** và chọn **Import CodeStar Project**
5. Nhập thông tin Git credentials và chọn project **dev-calculator**. Chọn **Next**.
![ImportProject](../../../images/6/31.png?width=90pc)
6. Tải tập tin **CalculatorStepAddition.zip** và giải nén
{{%attachments /%}}
7. Tạo một nhánh mới trong git cho triển khai mới.
8. Sao chép nội dung của tập tin **CalculatorStepAddition.zip** vào project. Xóa hai thư mục **src\main\java\com** và **test\main\java\com** chứ nội dung của ví dụ *hello world*
9.  Cập nhật project bằng tính năng **Maven | Update Project**.
10. Chạy Unit test ta nhận được kết quả như sau
![Test](../../../images/6/32.png?width=90pc)
11. Commit nhứng thay đổi và hợp nhất nhánh **new-implementation** vào **master**

#### Cấp quyền cho CloudFormation để tạo IAM role.
12. Mở AWS IAM console và chọn **Roles**
13. Mở IAM Role **CodeStarWorker-dev-calculator-CloudFormation**, chọn **Attach Policy**.
![AttachPolicy](../../../images/6/33.png?width=90pc)
14. Chọn policy **XXXX-idevelopCodeStarCloudFormationPolicyXXXX**. Chọn **Attach policy**.
15. Push thay đổi lên origin. Một pipeline sẽ được build và triển khai mới. AWS COdePipeline sẽ sử dụng CloudFormation để triển khai các tài nguyên sau:
- Một Step Function state machine mới gọi hàm Lambda để thực hiện toán tử Add
- Hàm Lambda được triển khai mới Java code mà bạn đã kiểm tra trong CodeCommit
- IAM Role cho hàm Lambda và Step Funtion.
15. Để kiểm tra việc triển khai, truy cập vào AWS Step Function, chọn State machines có tên bắt đầu bằng **CalculatorStateMachine-**.
![StepFunction](../../../images/6/34.png?width=90pc)
16. Chọn **Start execution**.
![StepFunction](../../../images/6/35.png?width=90pc)
17. Trong mục **Start Execution** nhập đoạn JSON sau:
```JSON
{
  "operator" : "add",
  "operands" : [
      1,
      2
  ]
}
```
![StepFunction](../../../images/6/36.png?width=90pc)
18. Chọn **Start execution**.\
19. Sau khi thực hiện, ta nhận được kết quả như sau.
![StepFunction](../../../images/6/37.png?width=90pc)