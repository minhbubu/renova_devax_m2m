+++
title = "Sử dụng AWS Step Function để tạo một Calculator Microservice"
date = 2021
weight = 6
chapter = false
pre = "<b>6. </b>"
+++

Trong bài tập này, bạn sẽ sử dụng AWS Step Function để tạo một model tính toán đơn giản. Đầu tiên, chúng ta sẽ tạo model ở dạng *"debug"* mode trong đó, máy tính chỉ xác thực tính toán một cách đơn giản đường dẫn thực thi chứ không thực hiện bất kỳ phép tính nào. Sau đó chúng ta sẽ thêm các quy trình xử lý tính toán bằng cách sử dụng hàm Lambda.