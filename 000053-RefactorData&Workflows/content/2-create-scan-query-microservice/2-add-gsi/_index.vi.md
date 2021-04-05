+++
title = "Thêm một Global secondary index (GSI) "
weight = 2
chapter = false
pre = "<b>2.2. </b>"
+++

#### Thêm một Global secondary index (GSI)
Trong bài tập này, chúng ta sẽ tạo một global secondary index 
1. Chọn tab **Indexes**. Chọn **Create Index**
![CreateIndex](../../../images/2/3.png?width=90pc)
2. Tại mục **Partition Key** nhập **originCity**. Các mục khác sẽ được tự động cập nhật. Chọn **Create Index**
![CreateIndex](../../../images/2/4.png?width=90pc)
3. Chọn tab **Items** và chọn tiếp **Create Item**
![AddItems](../../../images/2/5.png?width=90pc)
4. Đối với thuộc tính **date** , hãy nhập thời gian tính bằng mili giây, đại diện cho một ngày trong tương lai. Ví dụ: 1609459200000là ngày 1 tháng 1 năm 2021. Bạn có thể sử dụng https://www.epochconverter.com để chuyển đổi thời gian dễ dàng hơn.
5. Đối với thuộc tính **originCity**, nhập **Melbourne**
6. Chọn vào biểu tượng **+** ở bên trái tên thuộc tính originCity. Trong danh sách vừa xuất hiện, chọn **Append** và chọn **String**
![AddItems](../../../images/2/6.png?width=90pc)
7. Trong trường vừa xuất hiện, nhập tên là **destinationCity** và giá trị là **Sydney**
![AddItems](../../../images/2/7.png?width=90pc)
8. Chọn **Save**
9.  Tiếp tục thêm các mục origin/destination city như bảng dưới đây
Bạn có thể sử dụng tập tin scipt dưới đây để thêm dữ liệu vào một cách tự động.
{{%attachments /%}}
Để sử dụng được script trong tập tin trên, IAM user mà bạn sử dụng cần có quyền thao tác với DynamoDB. Do vậy, truy cập vào IAM user mà bạn sử dụng, tại tab **Permissions**, chọn **Add Permission** và chọn **Attach existing policies directly** và chọn **Administrator Access**. Lưu lại cấu hình.

