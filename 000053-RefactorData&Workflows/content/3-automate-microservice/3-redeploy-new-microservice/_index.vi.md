+++
title = "Triển khai lại microservice"
weight = 3
chapter = false
pre = "<b>3.3. </b>"
+++

#### Triển khai lại microservice

Trong phần này, chúng ta sẽ thay thế đoạn code microservice và triển khai lại thông qua pipeline.
1. Mở terminal và sử dụng dòng lệnh sau để tạo nhánh mới
```bash
git checkout -b "new-implementation"
```
2. Tải project **TripSearchFromCity.zip** và giải nén
{{%attachments /%}}
3. Sao chép nội dung của **TripSearchFromCity** vào nội dung của project EclipseIDE.
Bạn có thể sử dụng tập tin **copy_files.sh** để sao chép.
4. Trong Eclipse IDE, nhấp chuột phải vào root project và chọn **Maven | Update Project** và chon **OK**.
![Redeploy](../../../images/3/5.png?width=90pc)
5. Nhấp chuột phải vào project, chọn **Run As | Run Configurations**
![Redeploy](../../../images/3/6.png?width=90pc)
6. Nhấp chuột phải vào JUnit trong danh sách và chọn **New Configuration**. Chọn **JUnit4**
![Redeploy](../../../images/3/7.png?width=90pc)
![Redeploy](../../../images/3/8.png?width=90pc)
7. Chọn tab **Environment**, chọn **New** để thêm các biến môi trường.
8. Tại mục **Name**, nhập **DDB_TABLENAME_TRIPSECTOR**, với **Value** nhập **TravelBuddyTripSectors**
![Redeploy](../../../images/3/9.png?width=90pc)
9.  Chọn **Run** để thực thi Unit Test cho microservice.
![Redeploy](../../../images/3/10.png?width=90pc)
Ta sẽ nhận được kết quả đầu ra như sau
![Redeploy](../../../images/3/11.png?width=90pc)
Nếu có lỗi xuất hiện, có thể do các nguyên nhân sau đây:
- Tên của DynamoDB table được tạo không khớp với định nghĩa trong mã nguồn. Kiểm tra tên của table có phải là **TravelBuddyTripSectors** và là giá trị mà bạn đã đặt cho biến môi trường **DDB_TABLENAME_TRIPSECTOR** hay không
- Region của mã nguồn không trùng với mã nguồn mà bạn tạo DynamoDB table. Kiểm tra mã nguồn tại DynamoDBManager class:
```java
private DynamoDBManager() {

    ...

    //
    // Construct our DynamoDB client - note the REGION must match your lab region
    //
    AmazonDynamoDB client = AmazonDynamoDBClientBuilder.standard()
        .withRegion(Regions.AP_SOUTHEAST_2)
        .withCredentials(credentialsProvider)
        .build();

    ...
}
```