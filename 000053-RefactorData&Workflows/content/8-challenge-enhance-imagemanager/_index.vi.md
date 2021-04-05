+++
title = "Thử thách- Triển khai một Image Manager Workflow"
date = 2021
weight = 8
chapter = false
pre = "<b>8. </b>"
+++

Trong thử thách này, bạn có nhiệm vụ tạo quy trình làm việc hoàn toàn mới bằng cách sử dụng AWS Lambda và AWS Step Function. Bạn sẽ sao chép một hệ thống tương tự Image Manager ở Module 3, theo dó, hình ảnh sẽ được tải lên S3 bucket để xử lý và lưu trữ trong một thư mục con. Việc triển khai của bạn phải xử lý các loại tệp khác nhau và thực thi các hàm Lambda khác nhau tùy thuộc vào phân loại, không thực hiện xử lý nếu loại tập tin không được hỗ trợ. 

Nâng cao: Việc triển khai của bạn cũng nên xử lý các trường hợp ngoại lệ. Để kiểm tra, nếu tệp được tải lên có một tên nhất định, bạn nên ném một ngoại lệ khỏi hàm Lambda để state machine bắt và xử lý.

Bạn nên triển khai hệ thống này với CI/CD pipeline, được tạo bằng CodeStar.

Để biết thông tin về cách loại bỏ các ngoại lệ khỏi các hàm Lambda và bắt chúng trong state machine Step Function, hãy xem http://docs.aws.amazon.com/step-functions/latest/dg/tutorial-handling-error-conditions.html#using-state-machine-error-conditions-step-4