Môn học: An toàn Bảo Mật - HTTT
Tên nhóm: Nhóm 07
18127022 - Phạm Ngọc Thùy Trang
18127257 - Trần Huy Vũ
18127215 - Quách Phú Thành

--------------- ĐỌC KỸ FILE NÀY TRƯỚC KHI SỬ DỤNG -------------
Để có thể giúp cho ứng dụng chạy đúng như yêu cầu, vui lòng làm kĩ từng bước theo file hướng dẫn này. 

Các file script DB & store cũng như mã nguồn ứng dụng đã được phân loại và sắp xếp theo từng thư mục khác nhau.

Trong đó, admin của ứng dụng có thể tự do cấp quyền trên tất cả các cột của tất cả các bảng

Link video demo có ở trong file BangPhanCong hoac o file LinkVideo.txt
----------------------------------------------------------------
Cấu trúc cây thư mục gồm có:
|_DBMSSec-18HTTT-07-PH1
|__MaNguonUngDung
|__ScriptDB
|____Step01
|____Step02
|____Step03
|__BangPhanCong (trong đó có link video demo của nhóm đã upload lên youtube)
--------------------HƯỚNG DẪN SỬ DỤNG ---------------
B1. Chạy tất cả các file trong folder "Step01" theo thứ tự ATBM_DOAN --> QLBVIEN_ROLE_USERS --> QLBVIEN_GRANT --> INIT

##LƯU Ý: Vui lòng chạy file "ATBM_DOAN" và "INIT" dưới quyền system 
B2. Chạy file "SYS_KTraTaiKhoan Admin" trong folder "Step02" theo thứ tự KIEMTRA_TKADMIN --> KIEMTRA_OBJECTS


B3. Chạy các file trong folder "Step03" (có thể chạy theo 1 thứ tự random bất kỳ
nhưng các file CAPQUYEN_SELECTUPDATE_ALL và file CAPQUYEN_INSERTDELETE_ALL phải được chạy sau các file CAPQUYEN_SELECTUPDATE và các file CAPQUYEN_INSERTDELETE khác)

B4. Mở ứng dụng "atbm" trong folder "MaNguonUngDung" để chạy. 

##LƯU Ý: nếu trong quá trình chạy bị lỗi, vui lòng mở Task Manager --> chọn Details --> 
tìm "atbm.exe" --> End task và tiến hành build lại và chạy ứng dụng. Ứng dụng cũ đôi khi sẽ chạy ngầm nên có thể sẽ dẫn đến việc build ứng dụng mới bị lỗi.
