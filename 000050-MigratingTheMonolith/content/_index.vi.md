+++
title = "Quản lý Truy cập EC2 với IAM Tagging"
date = 2021
weight = 1
chapter = true
+++

# CẤP ĐỘ 300: QUẢN LÝ TRUY CẬP DỊCH VỤ EC2 VỚI RESOURCE TAGS THÔNG QUA DỊCH VỤ IAM

Bài thực hành này sẽ mang chúng ta đến với quá trình quản lý truy cập dịch vụ EC2 bằng Resource Tags thông qua cấu hình chi tiết các IAM policies và roles với những permissions cụ thể. Việc sử dụng Resource Tags sẽ vô cùng hữu ích khi chúng ta dần dần mở rộng trong việc quản trị phân quyền, tuy nhiên cũng cần phải đặc biệt chú ý một số vấn đề nhất định (sẽ đề cập ở các phần tiếp theo). Ở bài thực hành này, chúng ta sẽ liên tiếp tạo ra các policies cùng với role mà có thể sử dụng được cho các cá thể nhất định, ví dụ như là EC2 Administrator. Các policies này sẽ chỉ cho phép EC2 Administrator tạo ra các tài nguyên liên quan khi và chỉ khi thoả mãn các yêu cầu được đề ra dựa trên những Resource Tags thông qua việc quản lý truy cập.

#### Mục tiêu
1. Đặc quyền IAM tối thiểu (IAM least privilege)
2. Đặc tả chính sách IAM cùng với các điều kiện (IAM policy conditions)

#### Điều kiện cần
1. Một tài khoản AWS được dùng cho mục đích TESTING.
2. Một IAM user (đã cấu hình MFA) có thể thực hiện tác vụ ```assume role```.

{{% notice info %}}
Khi hoàn thành bài thực hành này, bạn sẽ bị tính phí đối với những tài nguyên không nằm trong hạng mục AWS Free Tier.
{{% /notice %}}

#### Nội dung chính

Trong bài thực hành này, chúng ta sẽ có nội dung như sau:

1. [Tạo IAM Policy](1-create-iam-policies/)
2. [Tạo IAM Role](2-create-iam-role/)
3. [Kiểm tra hoạt động của Role](3-test-role/)
4. [Dọn dẹp tài nguyên](4-tear-down/)
