+++
title = "Tạo IAM Role"
date = 2021
weight = 2
chapter = false
pre = "<b>2. </b>"
+++

**Nội dung**
- [2.1. Tạo IAM Role](#21-tạo-iam-role)

#### 2.1. Tạo IAM Role

Chúng ta sẽ tiến hành tạo một IAM role cho người dùng `EC2 Administrator` cùng với những chính sách đã được tạo ra ở phần trước.

Sau đây là quá trình tạo ra một **IAM Role**:
1. Đăng nhập vào **AWS Management Console** và truy cập đến [IAM Management Console](https://console.aws.amazon.com/iam/).

![iam-roles](../../../images/2/2-1-iam-roles.png?width=90pc)

2. Ở thanh điều hướng bên tay trái, chọn `Roles` và nhấn nút `Create role`.
3. Ở màn hình tạo mới, chúng ta chọn `Another AWS account` và điền `account ID` của mình vào, bên cạnh đó `Require MFA` như là một sự lựa chọn bắt buộc (best practice).

![iam-roles-create-role-another-account](../../../images/2/2-2-iam-roles-create-role-another-account.png?width=90pc)

4. Ở khu vực `Attach permissions policies`, chúng ta sẽ lần lượt chọn các chính sách dưới đây:
   1. **ec2-list-read**
   2. **ec2-create-tags**
   3. **ec2-create-tags-existing**
   4. **ec2-run-instances**
   5. **ec2-manage-instances**

![iam-roles-attach-policies](../../../images/2/2-3-iam-roles-attach-policies.png?width=90pc)

5. Chọn lần lượt `Next: Tags` và `Next: Review` để tiến hành xem xét.
6. Điền tên (ví dụ: `ec2-admin-team-alpha`) cùng với miêu tả cụ thể.

![iam-roles-review-role](../../../images/2/2-4-iam-roles-review-role.png?width=90pc)

7. Tiến hành tạo bằng cách nhấn `Create role`.
8. Sau khi tạo thành công, trong danh sách các IAM roles, chúng ta chọn `ec2-admin-team-alpha` và cần lưu lại 2 thứ:
   1. **Role ARN**
   2. **Switch Role URL**

![iam-roles-get-role-arn-and-switch-role-url](../../../images/2/2-5-iam-roles-get-role-arn-and-switch-role-url.png?width=90pc)
