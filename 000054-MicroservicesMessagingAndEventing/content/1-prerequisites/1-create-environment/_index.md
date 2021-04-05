+++
title = "Create Environment"
weight = 1
chapter = false
pre = "<b>1.1. </b>"
+++

All the resources required to begin this lab have already been provisioned and set up for you. 
If running in your own account, use this [**CloudFormation template**](https://workshops.devax.academy/monoliths-to-microservices/module5/files/Module5.template.yaml)

Or download below and deploy to CloudFormation:
{{%attachments title="CloudFormation Template" pattern=".*(yaml)"/%}}

The following diagram depicts the resources that were deployed in your AWS account.

![Diagram](/images/1/0.png?width=50pc)

**Contents**
- [Create a new Keypair](#create-a-new-keypair)
- [Deploy CloudFormation Template](#deploy-cloudformation-template)

#### Create a new Keypair
{{% notice tip %}}
If you already have a Keypair in your account, you can skip this step.
{{% /notice %}}

1. Trước tiên, cần tạo một Keypair cho các máy ảo trong bài thực hành. Truy cập EC2 console, chọn **Keypairs**
2. Chọn **Create key pair**
![Keypair](/images/1/1.png?width=90pc)
3. Nhập tên keypair **KPforDevAxInstances**, chọn định dạng tập tin **pem** và chọn **Create key pair**
![Keypair](/images/1/2.png?width=90pc)
4. Một cửa sổ xuất hiện để chọn nơi lưu trữ tập tin keypair. Bạn cần lưu trữ keypair này để truy cập vào máy ảo EC2 trong các bước sau

#### Deploy CloudFormation Template
Trong bài thực hành này, chúng ta sẽ sử dụng CloudFormation template đã cung cấp và cài đặt sẵn các tài nguyên cần thiết.

1. Truy cập **AWS CloudFormation**
![CloudFormation](/images/1/3.png?width=90pc)
2. Chọn **Create stack**, chọn **With new resources (standard)**
![CloudFormation](/images/1/4.png?width=90pc)
3. Tại mục **Prerequisite - Prepare template** chọn **Template is ready**
4. Tại mục **Template source**, chọn **Upload a template file**, nhấp chọn **Choose file** và trỏ tới file template đã tải xuống. Chọn **Next**
![CloudFormation](/images/1/5.png?width=90pc)
5. Nhập tên stack tại mục **Stack name** (VD: ```DevAx-M2M-M5```)
6. Chọn keypair **KPforDevAxInstances** cho mục **EEKeyPair** và chọn **Next**
![CloudFormation](/images/1/6.png?width=90pc)
7. Chọn **Next** tại trang **Configure stack options**
![CloudFormation](/images/1/7.png?width=90pc)
8.  Chọn **Create stack**
![CloudFormation](/images/1/8.png?width=90pc)
9. Chúng ta cần chờ một vài phút để các tài nguyên được khởi tạo và cấu hình.
