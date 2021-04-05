+++
title = "Thử thách - Nâng cấp tripsearch microservice"
date = 2021
weight = 5
chapter = false
pre = "<b>5. </b>"
+++

Thử thách này sẽ xây dựng dựa trên ví dụ mấu đã cung cấp ở phần trước và thêm các method để mở rộng các chức năng.
Microservice đã có, cho phép bạn xem tất cả các chuyến đi trong cơ sở dữ liệu và lọc các chuyên đi theo điểm xuất phát. 
Trong thử thách này, bạn cần mở rộng service để cho phép lọc theo **điểm đến**. Bạn cần thêm đường dẫn **/tripstocity/{city}**, ví dụ như */tripstocity/Sydney* để xem các chuyến đi có điểm đến là Sydney.
1. Trước tiên, bạn cần thêm GSI khác vào DynamoDB table.
2. Truy cập DynamoDB và vào table **TravelByddyTripSector** đã tạo. Chọn tab **Indexes** và chọn **Create index**
![AddGSI](../../../images/5/1.png?width=90pc)
3. Nhập Partion key là **destinationCity** và chọn **Create Index**
![AddGSI](../../../images/5/2.png?width=90pc)
4. Mở rộng các định nghĩa tại các tập tin swagger.yml và template.yml để mở rộng service.
5. Ở đây chúng tôi đã chỉnh sửa những tập tin cho phù hợp với yêu cầu, bạn có thể tải xuống và tham khảo.
{{%attachments /%}}
6. Sau khi triển khai microservice đã mở rộng các chức năng, ta truy cập vào đường dẫn tới API vừa thêm để kiểm tra.
Kết quả nhận được tương tự như sau
![Output](../../../images/5/3.png?width=90pc)