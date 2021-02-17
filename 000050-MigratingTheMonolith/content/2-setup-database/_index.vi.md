+++
title = "Kiểm tra IAM Role"
date = 2021
weight = 3
chapter = false
pre = "<b>3. </b>"
+++

Để có thể bảo đảm các IAM policies sẽ hoạt động tốt, chúng ta sẽ thực hiện lần lượt các bài kiểm tra tương ứng với bảng sau:
| Thứ tự | Đặc tả | Mục |
| :----: | :----: | :-: |
| 1 | Truy cập vào AWS Region không được cho phép | [3.2](#32-tiến-hành-tạo-ec2-instance-khi-có-hoặc-không-có-tags) |
| 2 | Truy cập vào AWS Region được cho phép, dịch vụ EC2 | [3.2](#32-tiến-hành-tạo-ec2-instance-khi-có-hoặc-không-có-tags) |
| 3 | Sử dụng Resource Tag với giá trị không nằm trong điều kiện thoả | [3.2](#32-tiến-hành-tạo-ec2-instance-khi-có-hoặc-không-có-tags) |
| 4 | Chỉnh sửa Resource Tag sang giá trị không nằm trong điều kiện thoả | [3.3](#33-chỉnh-sửa-resource-tag-trên-ec2-instance) |
| 5 | Thực hiện thao tác quản lý EC2 instance | [3.4](#34-quản-lý-ec2-instance) |

**Nội dung**
- [3.1. Tiến hành cơ chế Assume-Role - **ec2-admin-team-alpha**](#31-tiến-hành-cơ-chế-assume-role---ec2-admin-team-alpha)
- [3.2. Tiến hành tạo EC2 instance khi có hoặc không có Tags](#32-tiến-hành-tạo-ec2-instance-khi-có-hoặc-không-có-tags)
- [3.3. Chỉnh sửa Resource Tag trên EC2 Instance](#33-chỉnh-sửa-resource-tag-trên-ec2-instance)
- [3.4. Quản lý EC2 Instance](#34-quản-lý-ec2-instance)

#### 3.1. Tiến hành cơ chế Assume-Role - **ec2-admin-team-alpha**

Chúng ta sẽ sử dụng IAM user hiện tại (đã được bật MFA) để tiến hành cơ chế `Assume-Role` đối với IAM role - **ec2-admin-team-alpha**.
1. Đăng nhập vào [AWS Management Console](https://console.aws.amazon.com).
2. Sau khi đăng nhập thành công, nhấn vào `Username` hiển thị ở góc trên bên phải, Console sẽ hiển thị tương ứng như sau `<USERNAME>@<ACCOUNT_ID_NUMBER_or_ACCOUNT_ID_ALIAS>`, sau đó tiến hành nhấn nút `Switch Role`. Một cách khác, chúng ta có thể copy/paste đường dẫn mà đã lưu lại ở Bước 8 phần [Tạo IAM Role](../2-create-iam-role/#21-tạo-iam-role).

![iam-user-sign-in](../../../images/3/3-1-iam-user-sign-in.png?width=90pc)

3. Ở trang `Switch Role`, chúng ta sẽ nhập như sau:
   - Ở ô `Account`: `<ACCOUNT_ID_NUMBER>`.
   - Ở ô `Role`: `ec2-admin-team-alpha`.
   - Ở ô `Display Name` (Optional): Tuỳ ý nhập tên gợi nhớ cho các lần sử dụng kế tiếp.

![iam-user-switch-role](../../../images/3/3-2-iam-user-switch-role.png?width=90pc)

4. Tiến hành nhấn nút `Switch Role`, đối với lần đầu tiên sẽ có một số thông tin thêm.
5. Trình duyệt Web của chúng ta sẽ được điều hướng sang một trang mới, chúng ta có thể dễ dàng nhận biết ở góc trên bên phải tương đương với bước số 2.

![iam-user-switched-role](../../../images/3/3-3-iam-user-switched-role.png?width=90pc)

{{% notice tip %}}
Để có thể dễ dàng sử dụng nhanh chóng các roles từng được dùng gần đây, chúng sẽ được hiển thị như là các lựa chọn khi chúng ta nhấn `Username` ở góc trên bên phải. 
{{% /notice %}}

#### 3.2. Tiến hành tạo EC2 instance khi có hoặc không có Tags

**Sau đây là quá trình truy cập AWS Console:**

---

1. Đăng nhập vào [AWS Management Console](https://ap-northeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-northeast-1) và truy cập dịch vụ EC2 ở `ap-northeast-1` (Tokyo).
   - Khi truy cập vào Dashboard, chúng ta sẽ nhận thấy một loạt các lỗi chứa cụm sau `API Error`.
   - Nếu yếu tố ở trên thoả, **bài kiểm tra đầu tiên** đã được thông qua bởi `ap-northeast-1` không nằm trong `AWS Regions` được cho phép.

![ec2-access-api-error](../../../images/3/3-4-ec2-access-api-error.png?width=90pc)

2. Đăng nhập vào AWS Console và truy cập dịch vụ EC2 ở `us-east-1` (North Virginia) theo đường dẫn - https://us-east-2.console.aws.amazon.com/ec2/v2/home?region=us-east-1.
   - Khi truy cập vào Dashboard, chúng ta sẽ chỉ nhận thấy một lỗi chứa cụm sau `API Error` ở phần `Load Balancing`.
   - Nếu yếu tố ở trên thoả, **bài kiểm tra thứ 2** đã được thông qua.
   - Nếu yếu tố ở trên không thoả, chúng ta sẽ phải xem xét lại phần [1.2. Chính sách - **ec2-list-read**](../1-create-iam-policies/#12-chính-sách---ec2-list-read)

![ec2-lb-api-error](../../../images/3/3-5-ec2-lb-api-error.png?width=90pc)

1. Chúng ta tiến hành tạo EC2 instance bằng cách nhấn chọn `Launch Instance`.

![ec2-launch-instance](../../../images/3/3-6-ec2-launch-instance.png?width=90pc)

**Sau đây là quá trình tạo EC2 instance:**

---

1. Đối với **Step 1**, chúng ta chọn `Amazon Linux 2 AMI` bằng việc nhấn nút `Select`.

![ec2-launch-step-1](../../../images/3/3-7-ec2-launch-step-1.png?width=90pc)

2. Đối với **Step 2**, chúng ta sẽ sử dụng cấu hình mặc định và nhấn nút `Next: Configure Instance Details`.

![ec2-launch-step-2](../../../images/3/3-8-ec2-launch-step-2.png?width=90pc)

3. Đối với **Step 3**, chúng ta sẽ sử dụng cấu hình mặc định và nhấn nút `Next: Add Storage`.

![ec2-launch-step-3](../../../images/3/3-9-ec2-launch-step-3.png?width=90pc)

4. Đối với **Step 4**, chúng ta sẽ sử dụng cấu hình mặc định và nhấn nút `Next: Add Tags`.

![ec2-launch-step-4](../../../images/3/3-10-ec2-launch-step-4.png?width=90pc)

5. Đối với **Step 5**, chúng ta sẽ thử sử dụng sai `Resource Tag` để kiểm thử, sau đó nhấn nút `Next: Configure Security Group`:
   - `Key=Name` và `Value=Example`
   - `Key=Team` và `Value=Beta`

![ec2-launch-step-5](../../../images/3/3-11-ec2-launch-step-5.png?width=90pc)

6. Đối với **Step 6**, chúng ta sẽ chọn `Select an existing security group` và chọn `default`, và nhấn nút `Review and Launch`.

![ec2-launch-step-6](../../../images/3/3-12-ec2-launch-step-6.png?width=90pc)

7. Đối với **Step 7**, chúng ta sẽ chọn `Proceed without a key pair` và `I acknowledge...`, sau đó nhấn nút `Launch Instances`.

![ec2-launch-step-7](../../../images/3/3-13-ec2-launch-step-7.png?width=90pc)

8. Ở trang `Launch Status`, chúng ta sẽ nhận được lỗi là `Launch Failed`.
   - Nếu yếu tố ở trên thoả, **bài kiểm tra thứ 3** đã được thông qua.
   - Nếu yếu tố ở trên không thoả, chúng ta sẽ phải xem xét lại phần [1.4. Chính sách - **ec2-create-tags-existing**](../1-create-iam-policies/#14-chính-sách---ec2-create-tags-existing).

![ec2-launch-status-failed](../../../images/3/3-14-ec2-launch-status-failed.png?width=90pc)

**Giả sử yếu tố ở trên thoả:**

---

1. Chúng ta sẽ nhấn nút `Back` để quay lại **Step 5** và sử dụng đúng `Resource Tag` để kiểm thử:
   - `Key=Name` và `Value=Example`
   - `Key=Team` và `Value=Alpha`

![ec2-launch-status-ok](../../../images/3/3-15.png?width=90pc)

2. Ở trang `Launch Status`, chúng ta sẽ nhận được thông tin là `Your instances are now launching`.

![ec2-launch-status-ok](../../../images/3/3-15-ec2-launch-status-ok.png?width=90pc)

3. Chúng ta tiến hành `View instance` và tiếp tục bài thực hành.

#### 3.3. Chỉnh sửa Resource Tag trên EC2 Instance

1. Đăng nhập vào [AWS Management Console](https://us-east-2.console.aws.amazon.com/ec2/v2/home?region=us-east-1) và truy cập dịch vụ EC2 ở `us-east-1` (North Virginia).
2. Chúng ta truy cập vào mục `Running Instances` và kiếm EC2 instance với tên là `Example`.

![ec2-find-instance](../../../images/3/3-16-ec2-find-instance.png?width=90pc)

3. Ở mục `Tags`, chúng ta nhấn chọn nút `Manage tags`.

![ec2-manage-tags](../../../images/3/3-17-ec2-manage-tags.png?width=90pc)

4. Ở ô `Key=Team`, để tiến hành kiểm thử, chúng ta sẽ sửa `Value=Alpha` thành `Value=Test`, sau đó nhấn `Save`.

   {{% notice info %}}
   Bạn sẽ nhận được thông báo lỗi ở bước này.  
   -Nếu yếu tố ở trên thoả, **bài kiểm tra thứ 4** đã được thông qua.  
   -Nếu yếu tố ở trên không thoả, chúng ta sẽ phải xem xét lại phần [1.4. Chính sách - **ec2-create-tags-existing**](../1-create-iam-policies/#14-chính-sách---ec2-create-tags-existing).
   {{% /notice %}}

![ec2-edit-tag](../../../images/3/3-18-ec2-edit-tag.png?width=90pc)

5. Quay lại trang `Add/Edit Tags`, ở ô `Key=Team`, chúng ta sẽ sửa `Value=Test` thành `Value=Alpha`, sau đó nhấn `Save`.

#### 3.4. Quản lý EC2 Instance

1. Đăng nhập vào [AWS Management Console](https://us-east-2.console.aws.amazon.com/ec2/v2/home?region=us-east-1) và truy cập dịch vụ EC2 ở `us-east-1` (North Virginia).
2. Chúng ta truy cập vào mục `Running Instances` và kiếm EC2 instance với tên là `Example`.
3. Ở góc trên bên tay phải, chúng ta sẽ nhấn nút `Instance State`.

![ec2-instance-state](../../../images/3/3-19-ec2-instance-state.png?width=90pc)

4. Chúng ta sẽ tiến hành nhấn chọn `Terminate`.
   {{% notice info %}}
   Bạn sẽ nhận được thông báo thành công.  
   -Nếu yếu tố ở trên thoả, **bài kiểm tra thứ 5** đã được thông qua. 
   -Nếu yếu tố ở trên không thoả, chúng ta sẽ phải xem xét lại phần [1.5. Chính sách - **ec2-run-instances**](../1-create-iam-policies/#15-chính-sách---ec2-run-instances).
   {{% /notice %}}

![ec2-terminate-instance](../../../images/3/3-20-ec2-terminate-instance.png?width=90pc)
