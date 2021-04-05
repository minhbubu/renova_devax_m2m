+++
title = "Triển khai thông qua pipeline"
weight = 3
chapter = false
pre = "<b>4.3. </b>"
+++

Bây giờ bạn sẽ hoàn tất việc thay đổi đoạn code và kiểm tra chúng, bạn cần thêm các thay đổi và xác nhận thay đổi vào nhánh **new-implementation**.
1. Truy cập vào đường dẫn chứa project **dev-tripsearch**
2. Nhập **git status** để xem lại thay đổi trong code
3. Nhập **git add .** để thêm những tập tin thay đổi
4. Nhập **git commit -m "Baseline implementation"** để xác nhận thay đổi 
5. Nhập **git checkout master** để chuyển tới nhánh master
6. Dùng lệnh **git merge new-implementation** để merge thay đổi từ nhánh new implementation vào nhánh master
7. Để push thay đổi lên CodeCommit, nhấp chuột phải vào Eclipse project, chọn **Team | Push to origin…**
