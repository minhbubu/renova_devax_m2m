+++
title = "Cập nhật IAM policy"
weight = 2
chapter = false
pre = "<b>4.2. </b>"
+++

1. Là một phần của cài đặt microservice, chúng ta sẽ gán một IAM Role mới vào hàm Lambda để cho phép nó thực thi một số tác vụ. Khi tạo một project CodeStar, nó tạo một IAM Role để cung cấp cho CloudFormation đủ các quyền để triển khai chương trình *Hello World*. Những quyền này không đủ cho những tác vụ cao hơn, do đó chúng ta cần điều chỉnh những chính sách của CloudFormation role.
2. Truy cập AWS IAM Console, chọn **Roles**
![UpdatePolices](../../../images/4/2.png?width=90pc)
3. Tìm và chọn IAM Role **CodeStarWorker-dev-tripsearch-CloudFormation**
4. Tìm và chọn IAM Role **CodeStarWorker-dev-tripsearch-CloudFormation**
5. Chọn **Attach Policy**, trong mục **Filter** nhập **idevelop** và chọn **XXXXX-idevelopCodeStarCloudFormationPolicyXXXXXXXXX**.
![UpdatePolices](../../../images/4/3.png?width=90pc)
6. Chọn **Attach Policy**