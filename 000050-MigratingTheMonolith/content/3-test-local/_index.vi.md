+++
title = "Dọn dẹp tài nguyên"
date = 2021
weight = 4
chapter = false
pre = "<b>4. </b>"
+++

**Nội dung:**
- [Dọn dẹp tài nguyên](#dọn-dẹp-tài-nguyên)

#### Dọn dẹp tài nguyên

Chúng ta sẽ tiến hành dọn dẹp những tài nguyên đã được tạo ra từ bài thực hành này:
1. Đăng nhập vào AWS Console và truy cập đến dịch vụ IAM theo đường dẫn - https://console.aws.amazon.com/iam/.
2. Ở thanh điều hướng bên tay trái, chọn `Roles` và tìm `ec2-admin-team-alpha`.
3. Chọn `ec2-admin-team-alpha` và nhấn nút `Delete role`.
4. Ở thanh điều hướng bên tay trái, chọn `Policies` và tìm lần lượt các chính sách dưới đây, sau đó nhất nút `Delete policy`.
   1. **ec2-list-read**
   2. **ec2-create-tags**
   3. **ec2-create-tags-existing**
   4. **ec2-run-instances**
   5. **ec2-manage-instances**

{{% notice info %}}
Đối với những thay đổi dành cho IAM policies và roles sẽ không phát sinh bất kỳ chi phí nào.
{{% /notice %}}
