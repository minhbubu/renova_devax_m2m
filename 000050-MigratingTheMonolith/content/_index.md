+++
title = "EC2 Access Control with IAM Tagging"
date = 2021
weight = 1
chapter = true
+++

# CẤP ĐỘ 300: QUẢN LÝ TRUY CẬP DỊCH VỤ EC2 VỚI RESOURCE TAGS THÔNG QUA DỊCH VỤ IAM

This hands-on lab will guide you through the steps to configure example AWS Identity and Access Management (IAM) policies, and a AWS IAM role with associated permissions to use EC2 resource tags for access control. Using tags is powerful as it helps you scale your permission management, however you need to be careful about the management of the tags which you will learn in this lab. In this lab you will create a series of policies attached to a role that can be assumed by an individual such as an EC2 administrator. This allows the EC2 administrator to create tags when creating resources only if they match the requirements, and control which existing resources and values they can tag.

#### Aims
1. Đặc quyền IAM tối thiểu (IAM least privilege)
2. Đặc tả chính sách IAM cùng với các điều kiện (IAM policy conditions)

#### Prerequistes
1. Một tài khoản AWS được dùng cho mục đích TESTING.
2. Một IAM user (đã cấu hình MFA) có thể thực hiện tác vụ ```assume role```.

{{% notice info %}}
Khi hoàn thành bài thực hành này, bạn sẽ bị tính phí đối với những tài nguyên không nằm trong hạng mục AWS Free Tier.
{{% /notice %}}

#### Contents

Trong bài thực hành này, chúng ta sẽ có nội dung như sau:

1. [Create IAM Policy](1-create-iam-policies/)
2. [Create IAM Role](2-create-iam-role/)
3. [Testing Role](3-test-role/)
4. [Clean Up Resources](4-tear-down/)
