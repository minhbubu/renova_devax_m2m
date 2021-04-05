+++
title = "Tạo workflow cho caculator state machine "
weight = 1
chapter = false
pre = "<b>6.1. </b>"
+++

1. Truy cập AWS Step Function, chọn **Get started**
![Createworkflows](../../../images/6/1.png?width=90pc)
2. Trong trang Review Hello World, chọn **Next**
![Createworkflows](../../../images/6/2.png?width=90pc)
3. Trong mục **Name**, nhập **BasicCalculator**
4. Với **IAM Role**, chọn **I will use an existing role** và chọn **idevelop-step-functions-execution-roles**
![Createworkflows](../../../images/6/3.png?width=90pc)
5. Chọn **Create state machine**
6. Một hộp thoại **New execution** sẽ xuất hiện, chọn **Cancel**
![Createworkflows](../../../images/6/4.png?width=90pc)
7. Chọn **Edit**

8. Sao chép nội dung của tập tin **Basic Calculator State Machine** dưới đây vào mục **Defintion**.
{{%attachments /%}}
![Createworkflows](../../../images/6/5.png?width=90pc)
9.  Chọn biểu tượng *refresh* bên cạnh **Visual Workflow** để buộc state machine hiển thị dưới dạng đồ họa. Nó sẽ trông giống thế này:
![Createworkflows](../../../images/6/7.png?width=90pc)
Hãy dành một chút thời gian để xem lại định nghĩa state machine và biểu diễn đồ họa. Việc triển khai đưa ra quyết định dựa trên dữ liệu đầu vào, nhưng không thực hiện bất kỳ tính toán nào - tất cả các trạng thái đều là “Pass” là NOOP trong thuật ngữ State Language.
10.  Chọn **Save**.
11.  Bạn sẽ thấy cảnh báo liên quan tới IAM role. Chọn **Save anyway**
![Createworkflows](../../../images/6/6.png?width=50pc)
12.  Để kiểm tra state machine, chọn **Start Excution**
13.  Trong hộp thoại vừa xuất hiện, cung cấp JSON payload sau
```JSON
{
  "operator" : "add",
  "operands" : [
      1,
      2
  ]
}
```
![Createworkflows](../../../images/6/8.png?width=90pc)
14.   Chọn **Start Execution**. Sau một khoảng thời gian, bạn sẽ nhận được kết quả thực thi như sau:
![Createworkflows](../../../images/6/9.png?width=90pc)
15.   Hãy thử các toán tử khác như *divide, multiply, subtract*. Qua quan sát, ta có thể thấy rằng mặc dù đường dẫn là chính xác nhưng không có thao tác nào diễn ra. Vì vậy, hãy cùng tạo một microservice để làm điều này.