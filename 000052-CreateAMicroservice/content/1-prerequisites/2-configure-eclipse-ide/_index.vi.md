+++
title = "Cấu hình Eclipse IDE"
weight = 2
chapter = false
pre = "<b>1.2. </b>"
+++

#### Truy cập vào EC2
1. Truy cập AWS EC2, và mở EC2 instance DevAxWindowsHost
2. Chọn **Connect** và chọn tab RDP client.
![RemoteInstances](../../../images/1/6.png?width=90pc)
3. Chọn **Download remote desktop file** để tải tập tin RDP để truy cập từ xa.
4. Chọn keypair **KPforDevAxInstances** để giải mã mật khẩu cho máy ảo Windows.
5. Mở tập tin RDP vùa tải xuống và sử dụng mật khẩu để đăng nhập vào máy ảo.
![RemoteInstances](../../../images/1/7.png?width=90pc)

#### Cấu hình Eclipse IDE
6. Mở command line và cấu hình profile cho bài thực hành
```bash
aws configure set profile.aws-lab-env.region <your-region>
aws configure set profile.aws-lab-env.aws_access_key_id <your_access_key_id>
aws configure set profile.aws-lab-env.aws_secret_access_key <your_secret_access_key>
```
![EclipseIDE](../../../images/1/8.png?width=90pc)
7. Mở **Eclipse IDE**, tìm biểu tượng **AWS** và chọn dấu mũi tên.\
8. Chọn **Preferences...**.\
9.  Đặt **Default Profile** là **aws-lab-env**.
![EclipseIDE](../../../images/1/9.png?width=90pc)
10. Chọn **Apply and Close**.

#### Cài đặt S3 buckets
Bạn cần cài đặt 2 buckets. Một bucket sẽ chứa hàm lambda được tải lên và một bucket được sử dụng để lưu trữ hình ảnh.

11. Tạo S3 bucket để lưu hàm Lambda. Bạn có thể sử dụng AWS Console hoặc dùng command line:
```bash
aws s3 mb s3://idevelop-sourcecode-<yourinitials> --region <region> --profile aws-lab-env
```
trong đó **<bucket-name>** là tên duy nhất cho bucket của bạn . Thay thế **<region>** với region phù hợp với bài thực hành của bạn.
{{% notice warning %}}
Nếu có lỗi **Access Denied**,truy cập vào **IAM User** awsstudent, chọn **Permissions**, **Add permissions**|**Attach existing policíe directly** và chọn **AdministratorAccess**
{{% /notice %}}
12.  Tạo một bucket khác để chứa hình ảnh tải lên. Tương tự như bước trên, ta đặt tên cho S3 bucket là **idevelop-imagemanager-<yourinitials>**. Câu lệnh sẽ như sau:
```bash
aws s3 mb s3://idevelop-imagemanager-<yourinitials> --region <region> --profile aws-lab-env
```
![CreateS3bucket](../../../images/1/10.png?width=90pc)
Sau khi hoàn tất hai bước trên, bạn sẽ có 2 S3 bucket tương tự như hình dưới đây.![CreateS3bucket](../../../images/1/11.png?width=90pc)