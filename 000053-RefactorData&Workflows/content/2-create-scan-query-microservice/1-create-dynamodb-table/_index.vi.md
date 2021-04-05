+++
title = "Tạo DynamoDB Table"
weight = 1
chapter = false
pre = "<b>2.1. </b>"
+++

#### Tạo DynamoDB Table

Trong phần này, bạn sẽ tạo một DynamoDB table sẽ được sử dụng cho một micrioservice mới mà chúng ta sẽ tạo.

1. Truy cập vào **Dynamo DB**. Chọn **Create table**.
![CreateDynamoDB](../../../images/2/1.png?width=90pc)
2. Trong mục **Table Name** nhập **TravelBuddyTripSectors**.
3. Trong mục **Partition Key** nhập **date** và chọn **Number** trong danh sách.
4. Chọn **Add sort key** để hiển thị trường sort key input
5. Tại mục **Sort Key**. Nhập **originCity**
6. Đặt các mục khác như mặc định và chọn **Create**.
![CreateDynamoDB](../../../images/2/2.png?width=90pc)
7. Chúng ta sẽ phải chờ một khoảng thời gian để table được tạo.

