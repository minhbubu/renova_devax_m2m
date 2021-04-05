+++
title = "Cấu hình Eclipse IDE"
weight = 2
chapter = false
pre = "<b>1.2. </b>"
+++

#### Kết nối từ xa tới EC2.
1. Truy cập EC2, mở EC2 instance có tên **DevAxWindowsHost**. Chọn Connect.
![CloudFormation](../../../images/1/4.png?width=90pc)
2. Chọn Keypair **KPforDevAxInstances** để giải mã mật khẩu của máy ảo Windows
3. Tải xuống tập tin RDP và sử dụng mật khẩu đã giải mã ở trên để truy cập máy ảo.
![CloudFormation](../../../images/1/5.png?width=90pc)
#### Cấu hình Eclipse IDE
1. Mở commandline và cấu hình profile cho Eclipse
2. Sử dụng các câu lệnh dưới đây: 
```bash
aws configure set profile.aws-lab-env.region <YOUR_REGION>
aws configure set profile.aws-lab-env.aws_access_key_id <YOUR_ACCESS_KEY_ID>
aws configure set profile.aws-lab-env.aws_secret_access_key <YOUR_SECRET_ACCESS_KEY>
```
![CloudFormation](../../../images/1/6.png?width=90pc)
3. Cấu hình git
```bash
git config --global user.email <YOUR_EMAIL>
git config --global user.name awsstudent
```
![CloudFormation](../../../images/1/7.png?width=90pc)