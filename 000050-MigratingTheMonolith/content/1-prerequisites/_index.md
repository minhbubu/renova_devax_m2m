+++
title = "Create IAM Policy"
date = 2021
weight = 1
chapter = false
pre = "<b>1. </b>"
+++

Ở phần 1, các policies sẽ được phân thành 5 chức năng khác nhau, nếu muốn, bạn có thể tuỳ ý chỉnh sửa và kết hợp chúng để phù hợp với các yêu cầu thực tiễn mà mình đang hướng tới hoặc muốn áp dụng.

Ngoài ra, trong bài thực hành này, các **AWS Regions** sau đây sẽ được mặc định sử dụng nhằm tăng cường giới hạn hơn nữa đối với Resource Tags.
- **us-east-1** (North Virginia)
- **us-west-1** (North California)

**Contents**
- [1.1. Create IAM Policy Steps](#11-create-iam-policy-steps)
- [1.2. Policy - **ec2-list-read**](#12-policy---ec2-list-read)
- [1.3. Policy - **ec2-create-tags**](#13-policy---ec2-create-tags)
- [1.4. Policy - **ec2-create-tags-existing**](#14-policy---ec2-create-tags-existing)
- [1.5. Policy - **ec2-run-instances**](#15-policy---ec2-run-instances)
- [1.6. Policy - **ec2-manage-instances**](#16-policy---ec2-manage-instances)

#### 1.1. Create IAM Policy Steps

Sau đây là quá trình tạo ra một **IAM Policy**:
1. Đăng nhập vào **AWS Management Console** và truy cập đến [IAM Management Console](https://console.aws.amazon.com/iam/).

![iam-policies](../../../images/1/1-1-iam-policies.png?width=90pc)

2. Ở thanh điều hướng bên tay trái, chọn `Policies` và nhấn nút `Create policy`.
3. Ở màn hình tạo mới, chúng ta chọn `JSON` và điền đặc tả chính sách của mình vào.

![iam-policies-create-policy](../../../images/1/1-2-iam-policies-create-policy.png?width=90pc)

4. Chọn `Review policy` để tiến hành kiểm tra.
5. Điền tên (ví dụ: `ec2-list-read`) cùng với miêu tả cụ thể.

![iam-policies-review-policy](../../../images/1/1-3-iam-policies-review-policy.png?width=90pc)

6. Tiến hành tạo bằng cách nhấn `Create Policy`.

#### 1.2. Policy - **ec2-list-read**

Chính sách này sẽ chỉ cho phép quyền hạn `read-only` đối với dịch vụ `EC2`.

{{% notice note %}}
Sau bài thực hành này, tuỳ thuộc vào các yêu cầu cụ thể, bạn có thể sẽ cân nhắc cho phép thêm đối với Elastic Load Balacing.
{{% /notice %}}

![iam-policies](../../../images/1/3.png?width=90pc)

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ec2listread",
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "ec2:Get*"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": [
                        "us-east-1",
                        "us-west-1"
                    ]
                }
            }
        }
    ]
}
```

![iam-policies](../../../images/1/5.png?width=90pc)

{{% notice tip %}}
Tương tự, bạn lặp lại các bước trên để tạo thêm các chính sách tiếp theo.
{{% /notice %}}

#### 1.3. Policy - **ec2-create-tags**

Chính sách này sẽ cho phép tạo ra các nhãn dán dành cho dịch vụ EC2, kèm với điều kiện thực thi là khi chúng ta tiến hành tạo một EC2 instance.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ec2createtags",
            "Effect": "Allow",
            "Action": "ec2:CreateTags",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "ec2:CreateAction": "RunInstances"
                }
            }
        }
    ]
}
```

#### 1.4. Policy - **ec2-create-tags-existing**

Chính sách này sẽ cho phép tạo ra các nhãn dán dành cho dịch vụ EC2, kèm với điện kiện là khi và chỉ khi những tài nguyên (đã sẵn có hoặc sẽ tạo mới) được thực thi, chúng đã được dán nhãn như sau:
- Key: `Team`
- Value: `Alpha`

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ec2createtagsexisting",
            "Effect": "Allow",
            "Action": "ec2:CreateTags",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "ec2:ResourceTag/Team": "Alpha"
                },
                "ForAllValues:StringEquals": {
                    "aws:TagKeys": [
                        "Team",
                        "Name"
                    ]
                },
                "StringEqualsIfExists": {
                    "aws:RequestTag/Team": "Alpha"
                }
            }
        }
    ]
}
```

#### 1.5. Policy - **ec2-run-instances**

Chính sách này sẽ được chia làm 2 phần:
1. Phần đầu tiên: Cho phép tạo ra EC2 instance khi và chỉ khi các điều kiện về `AWS Regions` và `Resource Tags` được thoả mãn.
2. Phần còn lại: Cho phép tạo ra các tài nguyên liên quan tại thời điểm chúng ta tiến hành tạo EC2 instance, kèm với điều kiện về `AWS Regions`.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ec2runinstances",
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": "arn:aws:ec2:*:*:instance/*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": [
                        "us-east-1",
                        "us-west-1"
                    ],
                    "aws:RequestTag/Team": "Alpha"
                },
                "ForAllValues:StringEquals": {
                    "aws:TagKeys": [
                        "Name",
                        "Team"
                    ]
                }
            }
        },
        {
            "Sid": "ec2runinstancesother",
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": [
                "arn:aws:ec2:*:*:subnet/*",
                "arn:aws:ec2:*:*:key-pair/*",
                "arn:aws:ec2:*::snapshot/*",
                "arn:aws:ec2:*:*:launch-template/*",
                "arn:aws:ec2:*:*:volume/*",
                "arn:aws:ec2:*:*:security-group/*",
                "arn:aws:ec2:*:*:placement-group/*",
                "arn:aws:ec2:*:*:network-interface/*",

                "arn:aws:ec2:*::image/*"
            ],
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": [
                        "us-east-1",
                        "us-west-1"
                    ]
                }
            }
        }
    ]
}
```

#### 1.6. Policy - **ec2-manage-instances**

Chính sách này cho phép thực hiện những thao tác cơ bản (reboot, terminate, start, stop) đối với EC2 instances, kèm với điều kiện `AWS Regions` và `Resource Tags` phải được thoả mãn.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ec2manageinstances",
            "Effect": "Allow",
            "Action": [
                "ec2:RebootInstances",
                "ec2:TerminateInstances",
                "ec2:StartInstances",
                "ec2:StopInstances"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "ec2:ResourceTag/Team": "Alpha",
                    "aws:RequestedRegion": [
                        "us-east-1",
                        "us-west-1"
                    ]
                }
            }
        }
    ]
}
```

Sau khi hoàn tất, bạn sẽ có 5 EC2 policy như dưới đây.

![iam-policies](../../../images/1/6.png?width=90pc)
