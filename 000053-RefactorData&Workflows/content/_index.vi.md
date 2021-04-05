+++
title = "Cơ cấu lại dữ liệu và quy trình làm việc của bạn"
date = 2021
weight = 1
chapter = false
+++
# Cơ cấu lại dữ liệu và quy trình làm việc của bạn

#### Tổng quan
Trong ứng dụng web TravelBuddy giả tưởng của chúng ta , chúng ta đã lưu trữ tất cả dữ liệu ứng dụng của mình trong cơ sở dữ liệu MySQL được lưu trữ trong Amazon RDS. Nhưng khi chuyển sang kiến ​​trúc microservices, chúng ta cần xem xét việc chia nhỏ cơ sở dữ liệu nguyên khối này thành nhiều phần nhỏ hơn. Điều này cũng mang lại cho chúng ta cơ hội chọn kho dữ liệu phù hợp với cách truy cập dữ liệu - và nắm bắt Polyglot Persistence.
Chúng ta sẽ tạo một microservice mới hiểu thị thông tin *trip* sector để khách hàng có thể truy vấn *all trips* hoặc *trips from city*. Kịch bản này có thể sử dụng khi khách hàng muốn biết từ thành phố này có thể tới được những thành phố nào khác. Với thử thách tùy chọn, bạn phải mở rộng chức năng để có thể cung cấp khả năng tìm kiếm các chuyến bay dành cho một thành phố cụ thể..
Thay vì lưu trữ thông tin tại cơ sở dữ liệu quan hệ, chúng ta sẽ sử dụng Amazon DynamoDB. Trong bài tập này, chúng ta sẽ tìm hiểu cách truy cập Amazon DynamoDB từ Java sử dụng AWS SDK dành cho Java được tổ chức trên AWS Lambda.
Sau đó, chúng ta sẽ cùng tìm hiểu và trải nghiệm AWS Step Functions  bằng cách tạo các state machines để tạo quy trình làm việc (workflow) được quản lý. State machine sẽ gọi hàm  Lambda để thực hiện các tác vụ.
#### Amazon DynamoDB
Amazon DynamoDB Amazon DynamoDB là một dịch vụ cơ sở dữ liệu NoSQL được quản lý hoàn toàn, cung cấp hiệu suất nhanh và có thể dự đoán được với khả năng mở rộng liền mạch. DynamoDB cho phép bạn giảm bớt gánh nặng quản trị của việc vận hành và mở rộng cơ sở dữ liệu phân tán, do đó bạn không phải lo lắng về việc cung cấp phần cứng, thiết lập và cấu hình, sao chép, vá lỗi phần mềm hoặc mở rộng cụm.

Với DynamoDB, bạn có thể tạo các bảng cơ sở dữ liệu có thể lưu trữ và truy xuất bất kỳ lượng dữ liệu nào cũng như phục vụ bất kỳ mức lưu lượng yêu cầu nào. Bạn có thể tăng hoặc giảm quy mô công suất thông qua bảng của mình mà không có thời gian chết hoặc giảm hiệu suất và sử dụng AWS Management Console để theo dõi việc sử dụng tài nguyên và các chỉ số hiệu suất.

#### AWS Step Functions
Chúng ta cũng sẽ khám phá cách sử dụng AWS Step Functions để tạo workflow. AWS Step Functions giúp bạn dễ dàng điều phối các thành phần của ứng dụng phân tán và microservice bằng workflow trực quan. Việc xây dựng các ứng dụng từ các thành phần riêng lẻ thực hiện một chức năng riêng biệt cho phép bạn mở rộng và thay đổi các ứng dụng một cách nhanh chóng. Step Functions là một cách đáng tin cậy để phối hợp các thành phần và thực hiện từng bước các chức năng của ứng dụng của bạn. Step Functions cung cấp một bảng điều khiển đồ họa để sắp xếp và hình dung các thành phần của ứng dụng của bạn dưới dạng một loạt các bước. Điều này làm cho việc xây dựng và chạy các ứng dụng nhiều bước trở nên đơn giản. Step Functions tự động kích hoạt và theo dõi từng bước, đồng thời thử lại khi có lỗi, để ứng dụng của bạn thực thi theo thứ tự và như mong đợi. Step Functions ghi lại trạng thái của từng bước, vì vậy khi mọi thứ xảy ra sai, bạn có thể chẩn đoán và gỡ lỗi các sự cố một cách nhanh chóng. Bạn có thể thay đổi và thêm các bước mà không cần viết mã, vì vậy bạn có thể dễ dàng phát triển ứng dụng của mình và đổi mới nhanh hơn.

#### Nội dung
 Sau khi hoàn thành bài thực hành, bạn sẽ
- Sử dụng AWS SDK cho Java để quét Bảng Amazon DynamoDB để trả về kết quả
- Sử dụng AWS SDK cho Java để truy vấn Amazon DynamoDB Table để trả về kết quả phù hợp với tiêu chí
- Hiểu cách bạn có thể sử dụng Chỉ mục trong bảng DynamoDB để thực hiện tra cứu các thuộc tính khác với khóa phân vùng
- Tạo bảng DynamoDB theo cách thủ công bằng bảng điều khiển và điền dữ liệu theo cách thủ công
- Tạo workflow bằng các AWS Step Functions
- Tạo các hàm AWS Lambda cung cấp các hành động Tác vụ cho các Step Functions
#### Yêu cầu kiến thức kỹ thuật
Để hoàn thành bài thực hành, bạn cần quen thuộc với AWS Management Console và, Eclipse IDE và ngôn ngữ Java 

#### Môi trường
Sơ đồ sau miêu tả các tài nguyên được triển khai trong bài thực hành này.

![Diagram](../../../images/1/0.png?width=50pc)
