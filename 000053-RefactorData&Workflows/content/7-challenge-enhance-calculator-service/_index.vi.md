+++
title = "Thử thách-Nâng cấp Calculator service"
date = 2021
weight = 7
chapter = false
pre = "<b>7. </b>"
+++

Trong thử thách này, bạn có nhiệm vụ mở rộng quá trình triển khai mà bạn vừa tạo, cho phép nó xử lý các phép trừ, nhân, chia cũng như phép cộng đã được triển khai. Điều này sẽ yêu cầu bạn:
- Cập nhật state machine definition để địa nghĩa lại workflow của toán tử mới
- Cập nhật mã nguồn để triển khai các toán tử mới
- Cập nhật CloudFormation template.yml để thêm các thay đổi của state machine và thiết lập hàm Lambda dưới dạng task cho state mới.
Bạn có thể tham khảo tài liệu sau để thực hiện.
{{%attachments /%}}
1. Tải và giải nén tập tin **CalculatorStepFull.zip**
2. Import project dưới dạng **Existing Maven Project**
3. Thực hiện JUnit test bằng tính năng **Run As | JUnit Test**
![JUnitTest](../../../images/7/1.png?width=90pc)
4. Ta được kết quả như sau
![JUnitTest](../../../images/7/2.png?width=90pc)
5. Thực hiện package project thành tập tin JAR.
6. Truy cập AWS Lambda Function **idevelop_basic_calculator**. Tại mục Function code, tải tập tin JAR vừa tạo lên và chọn **Save**.
![UploadFunctionCode](../../../images/7/3.png?width=90pc)
7. Chọn **CalculatorTest** bên cạnh mục **Test** để mở bảng **Saved Test Events**. Chọn **Configure test events**
![EditTest](../../../images/7/4.png?width=90pc)
8. Sửa đoạn JSON để kiểm tra các toán tử. Ở hình dưới, chúng tôi đang kiểm tra toán tử trừ (subtract)
![JUnitTest](../../../images/7/5.png?width=90pc)
9.  Kết quả nhận được như sau
![JUnitTest](../../../images/7/6.png?width=90pc)
10. Kiểm tra thử với toán tử nhân (multiply) ta nhận được kết quả như sau:
![JUnitTest](../../../images/7/7.png?width=90pc)
![JUnitTest](../../../images/7/8.png?width=90pc)