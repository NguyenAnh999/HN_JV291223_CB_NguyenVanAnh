
create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;
create table if not exists STUDENT
(
    studentID   varchar(4) primary key not null,
    studentName varchar(100)           not null,
    birthday    date                   not null,
    gender      bit(1)                 not null,
    address     text                   not null,
    phone       varchar(45)
);
create table if not exists SUBJECT
(
    subjectID   varchar(4) primary key not null,
    subjectName varchar(45)            not null,
    priority    int(11)                not null
);
create table if not exists MARK
(
    studentID varchar(4) not null,
    subjectID varchar(4) not null,
    point     double,
    foreign key (studentID) references student (studentID),
    foreign key (subjectID) references subject (subjectID)
);


INSERT INTO STUDENT (studentId, studentName, birthday, gender, address, phone)
VALUES ('S001', 'Nguyen Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
       ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
       ('S003', 'Tran Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
       ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
       ('S005', 'Pham Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
       ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Dinh', '982654268'),
       ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Tho', '982364753'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
       ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274673'),
       ('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');



insert into SUBJECT(subjectID, subjectName, priority)
values ('MH01', 'Toán', 2),
       ('MH02', 'Vật lý', 2),
       ('MH03', 'Hóa', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);

insert into MARK(studentID, subjectId, point)
values ('S001', 'MH01', 8.5),
       ('S001', 'MH02', 7),
       ('S001', 'MH03', 9),
       ('S001', 'MH04', 9),
       ('S001', 'MH05', 5),
       ('S002', 'MH01', 9),
       ('S002', 'MH02', 8),
       ('S002', 'MH03', 6.5),
       ('S002', 'MH04', 8),
       ('S002', 'MH05', 6),
       ('S003', 'MH01', 7.5),
       ('S003', 'MH02', 6.5),
       ('S003', 'MH03', 8),
       ('S003', 'MH04', 7),
       ('S003', 'MH05', 7),
       ('S004', 'MH01', 6),
       ('S004', 'MH02', 7),
       ('S004', 'MH03', 5),
       ('S004', 'MH04', 6.5),
       ('S004', 'MH05', 8),
       ('S005', 'MH01', 5.5),
       ('S005', 'MH02', 8),
       ('S005', 'MH03', 7.5),
       ('S005', 'MH04', 8.5),
       ('S005', 'MH05', 9),
       ('S006', 'MH01', 8),
       ('S006', 'MH02', 10),
       ('S006', 'MH03', 9),
       ('S006', 'MH04', 7.5),
       ('S006', 'MH05', 6.5),
       ('S007', 'MH01', 9.5),
       ('S007', 'MH02', 9),
       ('S007', 'MH03', 6),
       ('S007', 'MH04', 9),
       ('S007', 'MH05', 4),
       ('S008', 'MH01', 10),
       ('S008', 'MH02', 8.5),
       ('S008', 'MH03', 8.5),
       ('S008', 'MH04', 6),
       ('S008', 'MH05', 9.5),
       ('S009', 'MH01', 7.5),
       ('S009', 'MH02', 7),
       ('S009', 'MH03', 9),
       ('S009', 'MH04', 5),
       ('S009', 'MH05', 10),
       ('S010', 'MH01', 6.5),
       ('S010', 'MH02', 8),
       ('S010', 'MH03', 5.5),
       ('S010', 'MH04', 4),
       ('S010', 'MH05', 7);
-- cập nhật dữ liệu
update student
set studentName = 'Đỗ Đức Mạnh'
where studentID = 'S004';
update subject
set subjectName = 'Ngoại Ngữ',
    priority=1
where subjectID = 'MH05';
update mark
set point = 8.5
where subjectID = 'MH01'
  and studentID = 'S009';
update mark
set point = 7
where subjectID = 'MH02'
  and studentID = 'S009';
update mark
set point = 5.5
where subjectID = 'MH03'
  and studentID = 'S009';
update mark
set point = 6
where subjectID = 'MH04'
  and studentID = 'S009';
update mark
set point = 9
where subjectID = 'MH05'
  and studentID = 'S009';

select *
from mark
where studentID = 's009';
-- xóa dữ liệu
delete
from MARK
where studentID = 'S010';

delete
from STUDENT
where studentID = 'S010';

-- Bai3
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
select *
from STUDENT;
# 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
select s.subjectID, s.subjectName
from subject s
where priority = 1;
# 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
# năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
select s.studentID,
       s.studentName,
       year(curdate()) - year(s.birthday) as 'tuổi',
       if(s.gender = 1, 'nam', 'nữ')      as 'giới tính',
       s.address
from student s;
# 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
# Toán và sắp xếp theo điểm giảm dần. [4 điểm]

select s.studentName, s2.subjectName, m.point
from student s
         join MARK M on s.studentID = M.studentID
         join subject s2 on M.subjectID = s2.subjectID
where s2.subjectName like '%toán%'
order by m.point desc;
# 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
# [4 điểm]
select if(gender = 1, 'nam', 'nữ') as 'giới tính', count(gender) as 'số lượng'
from student
group by gender;
# 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
# để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
select s.studentID, s.studentName, sum(point) 'tổng điểm', avg(point) 'điểm trung bình'
from MARK m
         join student s on m.studentID = s.studentID
group by s.studentID;
# Bài 4:  Tạo View, Index, Procedure [20 điểm]:
# 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
# sinh, giới tính , quê quán . [3 điểm]
create view STUDENT_VIEW
as
select s.studentID, s.studentName, s.gender, s.address
from student s;

select *
from STUDENT_VIEW;

# 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
# điểm trung bình các môn học . [3 điểm]

create view AVERAGE_MARK_VIEW as
select s.studentID, s.studentName, avg(point) 'điểm trung bình'
from MARK m
         join student s on m.studentID = s.studentID
group by s.studentID;
select *
from AVERAGE_MARK_VIEW;

# 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create index index_phoneNumber on STUDENT (phone);
# 4. Tạo các PROCEDURE sau: -
# Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
# thông tin học sinh đó. [3 điểm] - -
delimiter //
create procedure PROC_INSERTSTUDENT(studentIDIn varchar(4),
                                    studentNameIn varchar(100),
                                    birthdayIn date,
                                    genderIn bit(1),
                                    addressIn text,
                                    phoneIn varchar(45))
begin
    INSERT INTO STUDENT (studentId, studentName, birthday, gender, address, phone)
    VALUES (studentIDIn,
            studentNameIn,
            birthdayIn,
            genderIn,
            addressIn,
            phoneIn);
end//
delimiter ;

call PROC_INSERTSTUDENT('S010', 'Nguyen Thế Anh', '1999-01-11', 1, 'Hà Nội', '984670082');
# Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
# [3 điểm]
delimiter //
create procedure PROC_UPDATESUBJECT(newSubjectName varchar(45),updateId varchar(4))
begin
update subject set subjectName = newSubjectName where subjectID=updateId;
end//
delimiter ;
# Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
# sinh. [3 điểm]

delimiter //
create procedure PROC_DELETEMARK(studentIDIn varchar(4))
begin
    DELETE FROM MARK WHERE studentID = studentIDIn;
end//
delimiter ;

