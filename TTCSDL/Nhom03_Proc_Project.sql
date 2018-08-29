-- =============================================
-- Author		: Đình Phúc
-- Create date	: 2018-04-13 14:56:25.307 -- SELECT GETDATE()
-- Description	: Creat Proceduce For '1.4	Đăng kí đề tài'
-- =============================================
USE ProjectManage
GO
-- Lọc Danh Sách sinh viên từ bảng defendperiodstudent theo Mã chuyên ngành,mã đợt và mã khóa học
-- =============================================
-- Author		: Đình Phúc
-- Create date	: 2018-04-13 14:56:25.307 -- SELECT GETDATE()
-- @educationspecializecode - Mã chuyên ngành
-- @defendperiodcode - Mã đợt bảo vệ
-- 
-- =============================================
GO
CREATE TABLE [dbo].[grade](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[codeview] [varchar](10) NULL,
 CONSTRAINT [PK_grade] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-- Tạo View
CREATE VIEW listDefendperiodstudent 
	AS
	SELECT studentcode,name,classcode,educationspecializecode,gradecode,defendperiodcode FROM dbo.defendperiodstudent 
			INNER JOIN dbo.student ON student.code = defendperiodstudent.studentcode
			
go
--1.1 Lọc Danh Sách sinh viên theo Mã chuyên ngành,mã đợt và mã khóa học
ALTER PROC filterStudentcode(@educationspecializecode varchar(10),@defendperiodcode VARCHAR(10),@gradecode VARCHAR(10),@state INT)
AS
BEGIN
	IF(@state =1)-- 1.1 Lọc Danh Sách sinh viên theo Mã chuyên ngành,mã đợt và mã khóa học
		SELECT * FROM listDefendperiodstudent
			WHERE defendperiodcode = @defendperiodcode AND educationspecializecode=@educationspecializecode AND gradecode=@gradecode
	ELSE IF (@state =2)--1.2 Lọc Danh Sách sinh viên theo Mã chuyên ngành,mã đợt
		SELECT * FROM listDefendperiodstudent
		  WHERE defendperiodcode = @defendperiodcode AND educationspecializecode=@educationspecializecode
	ELSE IF (@state =3)--1.3 Lọc Danh Sách sinh viên theo Mã chuyên ngành và mã khóa học
		SELECT * FROM listDefendperiodstudent
		  WHERE educationspecializecode = @educationspecializecode AND gradecode =@gradecode
	ELSE IF (@state = 4)--1.4 Lọc Danh Sách sinh viên theo mã đợt và mã khóa học
		SELECT * FROM listDefendperiodstudent
		  WHERE  defendperiodcode=@defendperiodcode AND gradecode =@gradecode
	ELSE IF (@state =5) --1.5 Lọc Danh Sách sinh viên theo Mã chuyên ngành
		SELECT * FROM listDefendperiodstudent
		  WHERE  educationspecializecode=@educationspecializecode
	ELSE IF (@state =6) -- 1.6 Lọc Danh Sách sinh viên theo mã khóa học
		SELECT * FROM listDefendperiodstudent
		  WHERE gradecode =@gradecode
	ELSE IF (@state =7) --1.7 Lọc Danh Sách sinh viên theo mã đợt
		SELECT * FROM listDefendperiodstudent
		  WHERE  defendperiodcode=@defendperiodcode
	ELSE IF (@state =8) --1.7 Không điều kiện
		SELECT  * FROM  listDefendperiodstudent 

END

GO
EXEC dbo.filterStudentcode @educationspecializecode = '', -- varchar(10)
    @defendperiodcode = '101', -- varchar(10)
    @gradecode = '', -- varchar(10)
    @state = 7-- int



Go

--  Lọc Danh Sách đề tài theo Mã chuyên ngành và mã khóa học
-- =============================================
-- Author		: Đình Phúc
-- Create date	: 2018-04-13 14:56:25.307 -- SELECT GETDATE()
-- @educationspecializecode - Mã chuyên ngành
-- @defendperiodcode - Mã đợt bảo vệ
-- 
-- =============================================
go
-- Lọc Danh Sách đề tài theo Mã chuyên ngành và mã khóa học
CREATE VIEW LisProject 
	AS
		SELECT dbo.project.code,dbo.project.name,studentamount,educationspecializecode,defendperiodcode,supervisor,dbo.staff.name AS nameStaff
			 FROM dbo.project INNER JOIN dbo.staff ON staff.code = project.supervisor

go
ALTER PROC filterProjectcode(
@educationspecializecode varchar(10),
@defendperiodcode varchar(10),
@staffcode varchar(10),
@state INT)
AS
BEGIN
	IF(@state =1)-- Xem dữ liệu theo chuyên ngành va đợt bảo về
			SELECT * FROM LisProject 
				WHERE educationspecializecode = @educationspecializecode AND defendperiodcode=@defendperiodcode
	ELSE IF (@state =2)-- Xem dữ liệu theo  chuyên ngành
		SELECT * FROM LisProject
			 WHERE educationspecializecode = @educationspecializecode
	ELSE IF (@state =3)--Mã giáo viên
		SELECT * FROM LisProject 
			WHERE supervisor=@staffCode
	ELSE IF (@state =4)--Mã đợt đăng kí
		SELECT * FROM LisProject WHERE  defendperiodcode=@defendperiodcode
	ELSE IF (@state = 5)--Mã đợt đăng kí
		SELECT * FROM LisProject
	ELSE IF (@state = 6)--Mã đợt đăng kí ma giáo viên
		SELECT * FROM LisProject WHERE supervisor=@staffCode AND defendperiodcode=@defendperiodcode
END 
GO
EXEC dbo.filterProjectcode @educationspecializecode = '', -- varchar(10)
    @defendperiodcode = '103', -- varchar(10)
    @staffcode = '106', -- varchar(10)
    @state = 6 -- int

go


-- Xem dữ liệu theo Thesis chuyên ngành theo mã đợt,mã giáo viên
-- =============================================
-- Author		: Đình Phúc
-- Create date	: 2018-04-13 14:56:25.307 -- SELECT GETDATE()
-- @educationspecializecode - Mã chuyên ngành
-- @defendperiodcode - Mã đợt bảo vệ
-- @staffcode - Mã giáo viên
-- 
-- ============================================='
CREATE TABLE [dbo].[class](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[teachercode] [varchar](20) NULL,
	[facultycode] [varchar](10) NULL,
	[educationlevelcode] [varchar](10) NULL,
	[educationtypecode] [varchar](10) NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER VIEW list_Thesis 
	AS
		SELECT 	 thesis.studentcode,student.name AS studenName,dateofbirth,sex,dbo.class.name AS className,dbo.project.code AS projectCode ,project.name AS projectName,staff.code AS staffCode,
		staff.name AS staffName,educationtypecode,defendperiodcode,student.educationspecializecode,educationspecialize.name AS educationspecializeName,supervisormark
		 FROM dbo.thesis INNER JOIN dbo.project ON project.code = thesis.projectcode
							 INNER JOIN dbo.student ON student.code = thesis.studentcode
							 INNER JOIN dbo.staff ON staff.code = project.supervisor
							 INNER JOIN dbo.class ON class.code = student.classcode
							 INNER JOIN dbo.educationspecialize ON educationspecialize.code = project.educationspecializecode
GO
CREATE PROC list_filterby_Thesis(
@educationspecializecode varchar(10),
@defendperiodcode varchar(10),
@staffcode varchar(10),
@state INT)
AS
	IF(@state =1)-- Xem dữ liệu theo Thesis đợt bảo về
		SELECT * FROM list_Thesis
			WHERE defendperiodcode = ''@defendperiodcode
	ELSE IF (@state =2)-- Xem dữ liệu theo Thesis chuyên ngành
		SELECT * FROM list_Thesis
			WHERE educationspecializecode = @educationspecializecode
	ELSE IF (@state =3)--Mã giáo viên
		SELECT * FROM list_Thesis
			WHERE staffCode = @staffcode
	ELSE IF (@state =4)--Mã đợt mã Chuyên ngành
		SELECT * FROM list_Thesis
			WHERE educationspecializecode = @educationspecializecode AND defendperiodcode =@defendperiodcode
	ELSE IF (@state =5) --Mã đợt mã giáo viên
		SELECT * FROM list_Thesis
			WHERE defendperiodcode = @defendperiodcode AND staffcode =@staffcode
	ELSE IF (@state =6) -- giáo viên mã Chuyên ngành
		SELECT * FROM list_Thesis
			WHERE educationspecializecode = @educationspecializecode AND staffcode =@staffcode
	ELSE IF (@state =7) --chuyên ngành và mã giáo viên mã đợt
		SELECT * FROM list_Thesis
			WHERE educationspecializecode = @educationspecializecode AND defendperiodcode =@defendperiodcode AND staffcode=@staffcode
	ELSE IF (@state =8) --Không điều kiện
		SELECT  * FROM  list_Thesis 

GO
--get Thessis theo IDproject va IDSV
GO
CREATE PROC list_Thesis_filterbyID(
@studentcode varchar(10),
@projectCode varchar(10))
AS
	SELECT * FROM list_Thesis
		WHERE studentcode = @studentcode AND  projectCode=@projectCode
        
GO
EXEC dbo.list_Thesis_filterbyID @studentcode = '', @projectCode = ''



GO
--	Sinh viên chỉ được đăng ký đề tài theo đúng chuyên ngành học
CREATE FUNCTION ValidProject(@studentcode VARCHAR(10),@projectcode varchar(10))
RETURNS BIT
AS
	BEGIN
	DECLARE @CheckVal INT
	SELECT @CheckVal=COUNT(*) FROM dbo.project WHERE code=@projectcode AND educationspecializecode IN (SELECT educationspecializecode FROM dbo.student WHERE code=@studentcode)
	IF(@CheckVal=1)
		RETURN 1
	RETURN 0
	END
GO
--	Trong mỗi đợt bảo vệ, 1 sinh viên chỉ được đăng ký tối đa 1 đề tài
ALTER FUNCTION ValidCountProjectInDefen(@maSV VARCHAR(10))
RETURNS INT
AS
	BEGIN
		DECLARE @MaDotTrongProject INT
		SELECT @MaDotTrongProject = (SELECT TOP 1 tb.defendperiodcode FROM (
		SELECT * FROM dbo.project 
		WHERE dbo.project.code IN (SELECT projectcode  FROM dbo.thesis WHERE studentcode=@maSV)) AS tb)
		--PRINT(@MaDotTrongProject)

		DECLARE @Check INT
		SELECT @Check=COUNT(*) FROM  dbo.project 
		WHERE dbo.project.code IN (SELECT projectcode  FROM dbo.thesis WHERE studentcode=@maSV)
		IF(@Check>1)
			RETURN 1
		RETURN 0
	END
	
GO
SELECT dbo.ValidProject('101','101')

SELECT * FROM list_Thesis
			WHERE educationspecializecode = '103' AND staffcode ='102'
Go
ALTER PROC AddThesis(@studentcode VARCHAR(10),@projectcode varchar(10),@supervisormark FLOAT)
AS
BEGIN
	IF((SELECT dbo.ValidProject(@studentcode,@projectcode))=1
		AND (SELECT dbo.ValidCountProjectInDefen(@studentcode))=1)
	BEGIN
	DECLARE @Check INT
	SELECT  @Check = COUNT(*) FROM dbo.thesis WHERE studentcode = @studentcode AND projectcode=@projectcode
	IF(@Check=0)
	INSERT INTO dbo.thesis
	        ( studentcode ,
	          projectcode ,
	          supervisormark
	        )
	VALUES  ( @studentcode , -- studentcode - varchar(10)
	          @projectcode , -- projectcode - varchar(10)
	          @supervisormark  -- supervisormark - float
	        )
	ELSE
	BEGIN
		RAISERROR('lỗi - đã tồn tại thesis',14,4);
	END
    END   
END
GO
CREATE PROC EditThesis(@studentcode VARCHAR(10),@projectcode varchar(10),@supervisormark FLOAT)
AS
BEGIN
	
	DECLARE @CheckStudentcode INT
	DECLARE @CheckProjectcode INT
	SELECT  @CheckStudentcode = COUNT(*) FROM dbo.student WHERE code = @studentcode
	SELECT  @CheckProjectcode = COUNT(*) FROM dbo.project WHERE dbo.project.code = @projectcode
	IF(@CheckStudentcode=1 AND @CheckProjectcode=1)
	UPDATE dbo.thesis SET studentcode =@studentcode ,projectcode =@projectcode,supervisormark=@supervisormark
	WHERE studentcode =@studentcode AND projectcode =@projectcode
	ELSE
	BEGIN
		DECLARE @ROW INT
		RAISERROR('Mã đề án hoặc mã sinh viên không tồn tại',11,5);
	END
        
END
GO
CREATE PROC DelThesis(@studentcode VARCHAR(10),@projectcode varchar(10))
AS
BEGIN
	DECLARE @CheckStudentcode INT
	DECLARE @CheckProjectcode INT
	SELECT  @CheckStudentcode = COUNT(*) FROM dbo.student WHERE code = @studentcode
	SELECT  @CheckProjectcode = COUNT(*) FROM dbo.project WHERE dbo.project.code = @projectcode
	IF(@CheckStudentcode=1 AND @CheckProjectcode=1)
	DELETE dbo.thesis
	WHERE studentcode =@studentcode AND projectcode =@projectcode
	ELSE
	BEGIN
		DECLARE @ROW INT
		RAISERROR('Mã đề án hoặc mã sinh viên không tồn tại',14,5);
	END
        
END


GO
INSERT INTO dbo.thesis
        ( studentcode ,
          projectcode ,
          supervisormark
        )
VALUES  ( '' , -- studentcode - varchar(10)
          '' , -- projectcode - varchar(10)
          0.0  -- supervisormark - float
        )
GO
SELECT * FROM dbo.project
SELECT * FROM dbo.student
-------------------------------------
---------------------------------
-- Xem dữ liệu theo Thesis chuyên ngành
CREATE PROC list_filterby_ThesisEduSpecialize(@educationspecializecode varchar(10))
AS
	SELECT * FROM list_Thesis
			WHERE educationspecializecode = @educationspecializecode
GO
-- Xem dữ liệu theo Thesis đợt bảo về
CREATE PROC list_filterby_ThesisDefendperiod(@defendperiodcode varchar(10))
AS
	SELECT * FROM list_Thesis
			WHERE defendperiodcode = @defendperiodcode
GO

-- Xem dữ liệu theo Thesis đợt Mã giáo viên
CREATE PROC list_filterby_ThesisStaffCode(@staffcode varchar(10))
AS
	SELECT * FROM list_Thesis
			WHERE staffCode = @staffcode
GO
-- Xem dữ liệu theo Thesis chuyên ngành và đợt bảo về
CREATE PROC list_filterby_ThesisEduSpecialize_Defendperiod(@educationspecializecode varchar(10),@defendperiodcode varchar(10))
AS
	SELECT * FROM list_Thesis
			WHERE educationspecializecode = @educationspecializecode AND defendperiodcode =@defendperiodcode
GO
-- Xem dữ liệu theo Thesis chuyên ngành và mã giáo viên
CREATE PROC list_filterby_ThesisEduSpecialize_StaffCode(@educationspecializecode varchar(10),@staffcode varchar(10))
AS
	SELECT * FROM list_Thesis
			WHERE educationspecializecode = @educationspecializecode AND staffcode =@staffcode
GO
-- Xem dữ liệu theo Thesis đợt và mã giáo viên
CREATE PROC list_filterby_ThesisDefendperiod_StaffCode(@defendperiodcode varchar(10),@staffcode varchar(10))
AS
-----------------

GO
--1.2 Lọc Danh Sách sinh viên theo Mã chuyên ngành,mã đợt
CREATE PROC filterStudentcode_educSpecialize_Defendperiod(@educationspecializecode varchar(10),@defendperiodcode VARCHAR(10))
AS
BEGIN
	SELECT * FROM listDefendperiodstudent
		  WHERE defendperiodcode = @defendperiodcode AND educationspecializecode=@educationspecializecode
END
GO
--1.3 Lọc Danh Sách sinh viên theo Mã chuyên ngành và mã khóa học
CREATE PROC filterStudentcode_educSpecialize_gradecode(@educationspecializecode varchar(10),@gradecode VARCHAR(10))
AS
BEGIN
	SELECT * FROM listDefendperiodstudent
		  WHERE educationspecializecode = @educationspecializecode AND gradecode =@gradecode
END
GO
--1.4 Lọc Danh Sách sinh viên theo mã đợt và mã khóa học
CREATE PROC filterStudentcode_Defendperiodcode_gradecode(@defendperiodcode VARCHAR(10),@gradecode VARCHAR(10))
AS
BEGIN
	SELECT * FROM listDefendperiodstudent
		  WHERE  defendperiodcode=@defendperiodcode AND gradecode =@gradecode
END
go
--1.5 Lọc Danh Sách sinh viên theo Mã chuyên ngành
CREATE PROC filterStudentcode_educSpecialize(@educationspecializecode varchar(10))
AS
BEGIN
	SELECT * FROM listDefendperiodstudent
		  WHERE  educationspecializecode=@educationspecializecode
END
GO
--1.6 Lọc Danh Sách sinh viên theo mã khóa học
CREATE PROC filterStudentcode_gradecode(@gradecode VARCHAR(10))
AS
BEGIN
	SELECT * FROM listDefendperiodstudent
		  WHERE gradecode =@gradecode
END
GO
--1.7 Lọc Danh Sách sinh viên theo mã đợt và mã khóa học
CREATE PROC filterStudentcode_Defendperiodcode(@defendperiodcode VARCHAR(10))
AS
BEGIN
	SELECT * FROM listDefendperiodstudent
		  WHERE  defendperiodcode=@defendperiodcode
END



select * from list_Thesis
CREATE PROC  filterProjectcode(@educationspecializecode varchar(10),@defendperiodcode VARCHAR(10))-- Lọc theo chuyên ngành
AS
	SELECT * FROM dbo.project WHERE educationspecializecode = @educationspecializecode AND defendperiodcode=@defendperiodcode
GO
-- Lọc Danh Sách đề tài theo Mã chuyên ngành
CREATE PROC  filterProjectcode_educationspecializecode(@educationspecializecode varchar(10))-- Lọc theo chuyên ngành
AS
	SELECT * FROM dbo.project WHERE educationspecializecode = @educationspecializecode
GO
-- Lọc Danh Sách đề tài theo mã đợt đăng kí
CREATE PROC  filterProjectcode_defendperiodcode(@defendperiodcode VARCHAR(10))-- Lọc theo chuyên ngành
AS
	SELECT * FROM dbo.project WHERE  defendperiodcode=@defendperiodcode
GO
-- Lọc Danh Sách đề tài theo giáo viên hướng dẫn làm đồ án
CREATE PROC FilterProjectStaffCode(@staffCode VARCHAR(10))
AS
BEGIN
	SELECT code,name FROM dbo.project WHERE supervisor=@staffCode
END