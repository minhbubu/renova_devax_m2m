+++
title = "Tạo workflow cho caculator state machine "
weight = 2
chapter = false
pre = "<b>6.2. </b>"
+++

Trong phần này, chúng ta sẽ tạo một AWS Lambda Function chứa toán tử cộng (add). Chúng ta sẽ tạo hàm Lambda này bằng các sử dụng console. Sau đó, chúng ta sẽ sử dụng CI/CD pipeline để triển khai hàm Lambda để cung cấp đầy đủ các tính toán.

1. Tải và giải nén tập tin **CalculatorLambda.zip**.
{{%attachments /%}}
2. Trong Eclip IDE, chọn **Import...**  và import project dưới dạng **Existing Maven project**
3. Trong đường dẫn root của project, chọn **Run As | JUnit Test**.\
![CreateLambdaFunction](../../../images/6/10.png?width=90pc)
Kết quả đầu ra của bài test sẽ tương tự như sau:
![CreateLambdaFunction](../../../images/6/11.png?width=90pc)
4. Mở command line, truy cập vào thư mục project và nhập **mvn package**
![CreateJarFile](../../../images/6/12.png?width=90pc)
5. Sau khi tập tin JAR đã được build, chúng ta đã sẵn sàng để tạo một AWS Lambda function.
6. Mở AWS Lambda, chọn **Create function**
7. Trong mục **Select blueprint**, chọn **Author from scratch**
8. Trong mục **Name**, nhập **idevelop_basic_calculator**
9.  Trong mục **Runtime**, chọn **Java 8 (Corretto)**
![CreateLambdaFunction](../../../images/6/13.png?width=90pc)
10. Trong mục **Existing Role**, chọn **lambda-step-role**
11. Chọn **Create function**.
![CreateLambdaFunction](../../../images/6/14.png?width=90pc)
12. Để cung cấp function package, cuộn xuống phần **Function Code** và chọn **Action**, sau đó chọn **Upload a .zip or .jar file**
![UploadCode](../../../images/6/15.png?width=90pc)
13. Trỏ tới tập tin JAR đã build ở bước trước và chọn **Save**
![UploadCode](../../../images/6/16.png?width=50pc)
14. Tại mục **Runtime settings**, chọn **Edit**
![UpdateRuntimeSetting](../../../images/6/17.png?width=90pc)
15. Tại mục **Handler**, nhập **idevelop.lambda.CalculatorHandler** và chọn **Save**
![UpdateRuntimeSetting](../../../images/6/18.png?width=90pc)
16. Chọn **Test**
17. Trong hộp thoại xuất hiện, tại mục **Event name** nhập **CalculatorTest**
18. Nhập đoạn JSON sau:
```JSON
{
  "operator": "add",
  "operands": [1, 2]
}
```
![Test](../../../images/6/19.png?width=90pc)
19. Chọn **Create**.\
20. Chọn lại **Test**.\
21. Bạn sẽ nhận được thông báo thành công tương tự như sau
![Test](../../../images/6/20.png?width=90pc)
22. Bây giờ chúng ta biết rằng hàm Lambda đã xử lý như mong đợi, đã đến lúc chuyển hàm này thành một *task* trong Calculator Step Function.
23. Trở lại AWS Step Function console, chọn **State machines** và đánh dấu chọn **BasicCalculator** state machine. Chọn **Copy to New**
![StepFunction](../../../images/6/21.png?width=90pc)
24. Chọn **Next**.\
25. Trong mục **Name**, nhập **BasicCalculatorWithAddition**.\
26. Tại mục **IAM Role**, chọn existing IAM role có tên **idevelop-step-functions-execution-role**
![StepFunction](../../../images/6/22.png?width=90pc)
27. Chọn **Create state machine**.\
28. Chọn **Edit**
![StepFunction](../../../images/6/23.png?width=90pc)
29. Cuộn xuống mục **State machine definition**. Địng nghĩa từ lần triển khai trước đó sẽ được điền trong cửa sổ này. Tìm vị trí của trạng thái **state.process.operator.add** và thay đổi mục Type thành **Task**.\
30. Thêm thuộc tính **Resource** vào **state.process.operator.add** và cho nó giá trị là hàm Lambda **idevelop_basic_calculator** đã tạo trước đó. Danh sách các hàm Lambda sẽ tự động xuất hiện khi bạn nhập dấu ngoặc kép, do đó bạn chỉ cần chọn hàm Lambda có tên **idevelop_basic_calculator**.
![StepFunction](../../../images/6/24.png?width=90pc)
31. Chọn **Save**.\
32. Khi state machine được tạo, hãy chọn **Start excution**.\
33. Nếu có cảnh báo về IAM Role, chọn **Save anyway**.\
![Warning](../../../images/6/25.png?width=50pc)
34. Chọn **Start Execution** và dán đoạn code sau vào:
```JSON
{
  "operator" : "add",
  "operands" : [
      1,
      2
  ]
}
```
![StepFunction](../../../images/6/26.png?width=50pc)
35. Nếu thành công, bạn sẽ nhận được kết quả như sau:
![Output](../../../images/6/27.png?width=90pc)
![Output](../../../images/6/28.png?width=90pc)