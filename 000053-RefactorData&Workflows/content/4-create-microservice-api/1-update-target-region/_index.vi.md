+++
title = "Cập nhật target region cho API"
weight = 1
chapter = false
pre = "<b>4.1. </b>"
+++

Tập tin swagger.yml được cung cấp định nghĩa cho API hiển thị microservice thông qua Amazon API Gateway. Nó cần được cập nhật thông tin chi tiết về AWS Account Id và AWS Region trước khi bạn có thể triển khai microservice của mình.
1. Trong Eclipse IDE, mở tập tin **swagger.yml**
2. Tìm và thay thế các cụm sau **REPLACE_AWS_REGION**, **REPLACE_AWS_ACCOUNTID** và thay thế bằng region và account ID của bạn.
3. Lưu tập tin lại.
![UpdateRegion](../../../images/4/1.png?width=90pc)
