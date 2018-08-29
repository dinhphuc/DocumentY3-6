/*
	create database [database_name]
	go
	use [database_name]
	go
*/

/*
	Tạo bảng dữ liệu
*/

--Group 1 tables

/****** Object:  Table [dbo].[class]    Script Date: 5/7/2018 10:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[educationlevel]    Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[educationlevel](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[codeview] [varchar](10) NULL,
 CONSTRAINT [PK_educationlevel] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[educationtype]    Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[educationtype](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[codeview] [varchar](10) NULL,
 CONSTRAINT [PK_educationtype] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[faculty]    Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[faculty](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[deancode] [varchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_faculty] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[grade]    Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[student]    Script Date: 5/7/2018 10:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[dateofbirth] [datetime] NULL,
	[sex] [int] NULL,
	[email] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[folk] [nvarchar](50) NULL,
	[classcode] [varchar](10) NULL,
	[educationspecializecode] [varchar](10) NULL,
	[gradecode] [varchar](10) NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/**********************************************************************/

--Group 2 tables

/****** Object:  Table [dbo].[Academic]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Academic](
	[Code] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Codeview] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Degree]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Degree](
	[Code] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Codeview] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Document]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Document](
	[Code] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DayRelease] [date] NULL,
	[Link] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Graduating]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Graduating](
	[Code] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Position](
	[Code] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Codeview] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ResearchProject]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResearchProject](
	[Code] [varchar](10) NOT NULL,
	[Staffcode] [varchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[Level] [nvarchar](20) NULL,
	[Leader] [char](10) NULL,
	[Members] [nvarchar](200) NULL,
	[Time] [datetime] NULL,
	[State] [nvarchar](50) NULL,
	[Rank] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Staff]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[Code] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Degreecode] [varchar](10) NULL,
	[Academicode] [varchar](10) NULL,
	[Researchinterests] [char](300) NULL,
	[Positioncode] [varchar](10) NULL,
	[EducationFieldCode] [varchar](10) NULL,
	[Phonenumber] [char](20) NULL,
	[Email] [char](200) NULL,
	[Image] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Staff_ProjectResearch]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff_ProjectResearch](
	[StaffCode] [varchar](10) NOT NULL,
	[ProjectReaseachCode] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffCode] ASC,
	[ProjectReaseachCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[StaffDocument]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffDocument](
	[StaffCode] [varchar](10) NOT NULL,
	[DocCode] [varchar](10) NOT NULL,
	[PagesWrite] [varchar](50) NULL,
	[Thread] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffCode] ASC,
	[DocCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[StaffGraduated]    Script Date: 4/6/2018 9:02:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffGraduated](
	[StaffCode] [varchar](10) NOT NULL,
	[Descript] [nvarchar](500) NULL,
	[GraduatingCode] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffCode] ASC,
	[GraduatingCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/**********************************************************************/

--Group 3 tables

create table defendperiod(
	code varchar(10) primary key,
	[year] int,
	name nvarchar(50),
	startdate date,
	enddate date
)
go

create table project(
	code varchar(10) primary key,
	name nvarchar(200),
	detail nvarchar(MAX),
	studentamount int,
	educationspecializecode varchar(10),
	defendperiodcode varchar(10),
	supervisor varchar(10)
)
go

create table defendperiodstudent(
	studentcode varchar(10),
	defendperiodcode varchar(10),
	valid bit,
	constraint defendperiodstudent_PK primary key (studentcode, defendperiodcode)
)
go

create table defendcouncil(
	code varchar(10) primary key,
	codeview varchar(10),
	name nvarchar(100),
	educationspecializecode varchar(10),
	defendperiodcode varchar(10),
	hallcode varchar(10),
	defendtime datetime
)
go

create table defendcouncilduty(
	code varchar(10) primary key,
	name nvarchar(20)
)
go

create table defendcouncilstaff(
	defendcouncilcode varchar(10),
	staffcode varchar(10),
	defendcouncildutycode varchar(10),
	constraint defendcouncilstaff_PK primary key (defendcouncilcode, staffcode)
)
go

create table thesis(
	studentcode varchar(10),
	projectcode varchar(10),
	supervisormark float,
	constraint thesis_PK primary key (studentcode, projectcode)
)
go

create table thesisreview(
	studentcode varchar(10),
	defendperiodcode varchar(10),
	reviewer varchar(10),
	reviewermark float,
	constraint thesisreview_PK primary key (studentcode, defendperiodcode)
)
go

create table thesisdefend(
	studentcode varchar(10),
	defendcouncilcode varchar(10),
	result varchar(20) unique,
	constraint thesisdefend_PK primary key (studentcode, defendcouncilcode)
)
go

create table defendresult(
	resultcode varchar(20),
	staffcode varchar(20),
	defendmark float,
	constraint defendresult_PK primary key (resultcode, staffcode)
)
go

/**********************************************************************/

--Group 4 tables

--môn học

CREATE TABLE subject(
	code VARCHAR(10) PRIMARY KEY,
	codeview VARCHAR(20),
	name NVARCHAR(80),
	numberofcredit INT,
	numberoflesson INT,
	numberoftheory INT,
	numberofexercise INT,
	numberofdiscussion INT,
	numberofpractive INT,
	examform NVARCHAR(20),
);
GO

--bảng nghành

CREATE TABLE educationfield(
	code VARCHAR(10) PRIMARY KEY,
	name NVARCHAR(80),
	facultycode VARCHAR(10)
);
GO

--Bảng các chuyên ngành

CREATE TABLE educationspecialize(
	code VARCHAR(10) PRIMARY KEY,
	codeview VARCHAR(20),
	name NVARCHAR(80),
	educationfieldcode VARCHAR(10),
);
GO

--chi tiết đào tạo

CREATE TABLE  trainingdetails(
	subjectcode VARCHAR(10),
	educationspecializecode VARCHAR(10) ,
	fomality NVARCHAR(20) 
);
GO

/**********************************************************************/

--Group 5 tables

--lớp học phần
CREATE TABLE Course(
	Code VARCHAR(10) PRIMARY KEY,
	Numberofstudent INT ,
	Lectureroom NVARCHAR(20) NULL,
	Time NVARCHAR(20) NULL,
	Staffcode varchar(10) FOREIGN KEY(Staffcode) REFERENCES dbo.Staff(Code),
	Subjectcode varchar(10) FOREIGN KEY(Subjectcode) REFERENCES dbo.Subject(Code),
	Semestercode VARCHAR(10) FOREIGN KEY(Semestercode) REFERENCES dbo.Semester(Code)
)
GO

--hoc ky
CREATE TABLE Semester(
	Code VARCHAR(10) PRIMARY KEY,
	Name NVARCHAR(10) ,
	Schoolyear VARCHAR(20)
)

/**********************************************************************/

--Group 6 tables

CREATE TABLE Examinations(
code VARCHAR(10) PRIMARY KEY,
name NVARCHAR(50),
dateofexam DATE 
)
GO

CREATE TABLE ExaminationsRoom (
code VARCHAR(10) PRIMARY KEY,
name NVARCHAR(50),
shiftcode VARCHAR(10),
amphitheatercode varCHAR(10),
CONSTRAINT room_class_fk FOREIGN KEY(amphitheatercode) REFERENCES dbo.Class(code)
)
GO

CREATE TABLE Exam_Room(
examcode VARCHAR(10),
roomcode VARCHAR(10),
PRIMARY KEY (examcode,roomcode),
CONSTRAINT examroom_exam_fk FOREIGN KEY(examcode) REFERENCES dbo.Examinations(code),
CONSTRAINT examroom_room_fk FOREIGN KEY(roomcode) REFERENCES dbo.ExaminationsRoom(code)
)
GO

CREATE TABLE Study(
stucode VARCHAR(10),
subjclasscode VARCHAR(10),
dilipoint NVARCHAR(50),
frepoint NVARCHAR(50),
PRIMARY KEY(stucode,subjclasscode),
CONSTRAINT study_student_fk FOREIGN KEY (stucode) REFERENCES dbo.Student(code),
CONSTRAINT study_cource_fk FOREIGN KEY(subjclasscode) REFERENCES dbo.Course(code)
)
GO

CREATE TABLE Testscore (
code VARCHAR(10) PRIMARY KEY,
studentcode VARCHAR(10),
subjectclasscode VARCHAR(10),
wordscore NVARCHAR(50),
numberscore float ,
CONSTRAINT score_student_fk FOREIGN KEY (studentcode) REFERENCES dbo.Student(code),
CONSTRAINT score_subject_fk FOREIGN KEY (subjectclasscode) REFERENCES dbo.Course(code)
)
GO

CREATE TABLE DivideExamRoom(
code VARCHAR(10) PRIMARY KEY,
numrecode NVARCHAR(10),
idnumber INT,
titlecode NVARCHAR(10),
roomcode VARCHAR(10),
scorecode VARCHAR(10),
CONSTRAINT div_room_fk FOREIGN KEY (roomcode) REFERENCES dbo.ExaminationsRoom (code),
CONSTRAINT div_score_fk FOREIGN KEY (scorecode) REFERENCES dbo.Testscore(code)
)
GO

CREATE TABLE Exambag(
divcode VARCHAR(10),
examcode VARCHAR(10),
testcount INT,
PRIMARY KEY(divcode,examcode),
CONSTRAINT exambag_div_fk FOREIGN KEY(divcode) REFERENCES dbo.DivideExamRoom(code),
CONSTRAINT exambag_ex_fk FOREIGN KEY(examcode) REFERENCES dbo.Examinations(code)
)
GO

/**********************************************************************/

--Group 7 tables

--- Tao bang Dayoff

CREATE TABLE Dayoff
(
   Code VARCHAR(10),
   CodeView NVARCHAR(50),
   DayOffRepeat NVARCHAR(Max),
   Name NVARCHAR(100)
   PRIMARY KEY(Code)
)
GO

--- Tao bang Area---

CREATE TABLE Area
(
    Code VARCHAR(10) PRIMARY KEY,
    Name NVARCHAR(50),
    Location NVARCHAR(100)
)
GO

--- Tao bang Building

CREATE TABLE Building
(
   Code VARCHAR(10) PRIMARY KEY,
   Name NVARCHAR(50),
   AreaCode VARCHAR(10) FOREIGN KEY REFERENCES dbo.Area(Code)
)
go

--- Tao bang Hall--

CREATE TABLE Hall
(
   Code VARCHAR(10),
   CodeView NVARCHAR(20),
   Name NVARCHAR(50),
   BuildingCode VARCHAR(10)FOREIGN KEY REFERENCES dbo.Building(code),
   StudentCapacity INT ,
   StudentSpaceCompetition INT ,
   StaffCode VARCHAR(10) FOREIGN KEY REFERENCES dbo.Staff(Code),
   PRIMARY KEY(Code)
)
GO

--- Tao bang TeachingSchedule--

CREATE TABLE TeachingSchedule
(
   Code VARCHAR(10) PRIMARY KEY,
   CodeView NVARCHAR(20),
   CourseCode VARCHAR(10)FOREIGN KEY REFERENCES dbo.Course(code),
   Note NVARCHAR(MAX),
   DayOfWeek int,
   Week int,
   HallCode VARCHAR(10) FOREIGN KEY REFERENCES dbo.Hall(Code),
   StudentAmount INT ,
   LessonBegin INT ,
   LessonFinish INT ,
   DayOffcode varchar(10) Foreign key References dbo.Dayoff(code)
)
GO

--- Tao bang TeachingScheduledetail--

CREATE TABLE TeachingScheduledetail
(
   Code VARCHAR(10) PRIMARY KEY,
   CodeView NVARCHAR(20),
   CourseCode VARCHAR(10) FOREIGN KEY REFERENCES dbo.Course(Code),
   ClassCode VARCHAR(10) FOREIGN KEY REFERENCES dbo.Class(Code),
   Note NVARCHAR(MAX),
   DayOfWeek int,
   Week int,
   HallCode VARCHAR(10) FOREIGN KEY REFERENCES dbo.Hall(Code),
   StudentAmount INT ,
   LessonBegin INT ,
   LessonFinish INT
)
GO

/**********************************************************************/

--Group 8 tables

/*Nhóm 8 không có bảng quản lý riêng*/

/**********************************************************************/

--Group 9 tables

CREATE TABLE finalscores
(
	studentcode varchar(10) references Student(code), -- sinh viên nào
	subjectcode varchar(10) references Subjects(code), -- môn học nào
	numberscore float,
	wordscore varchar(10),
	fourscore float,
	constraint Stu_sub primary key (studentcode,subjectcode)
)

/**********************************************************************/

--Group 10 tables

--dot tot nghiep
create table graduationperiod
(
	code varchar(10) primary key,
	name nvarchar(30)
)
go

-- sinhvien_ dottotnghiep
create table graduatestudent
(
	studentcode varchar(10) references student,--masv
	graduationperiodcode varchar(10) references graduationperiod,--dot xet tn
	result nvarchar(250),--kq
	primary key (studentcode, graduationperiodcode)
)
go

--bang tot nghiep
create table graduation
(
	code varchar(10) primary key,
	studentcode varchar(10) references student,--masv
	registernumber int,--so vao so
	classification varchar(20),--xep loai(gioi, kha,..)
	yearofgraduation int ,-- nam tot nghiep
	reciever nvarchar(50),--ng nhan
	recieveridnumber varchar(12), --chung minh thu ng nhan
	recieveddate date,-- ngay nhan
	receiptcode varchar(10)--so trong so ki nhan bang
)
go

/**********************************************************************/

--Group 11 tables

create table conduct(
	studentcode varchar(10) references student(code),
	score1 int,
	score2 int,
	score3 int,
	score4 int,
	markconduct int,
	classify varchar(50),
	primary key (studentcode),
)
go

create table studyaward(
	studentcode varchar(10),
	averagemark float,
	awardlevel varchar(100),
	formaward varchar(100),
	semester varchar(50),
	primary key(studentcode),
)
go

create table fortuityaward(
	studentcode varchar(10) references conduct(studentcode),
	reason varchar(100),
	formaward varchar(100),
	note varchar(100),
	primary key (studentcode),
)
go

create table classaward(
	classcode varchar(10) references class(code),
	appellation varchar(100),
	formaward varchar(100),
	note varchar(100),
	primary key (classcode),
)
go

create table discipinaryinformation(
	studentcode varchar(10) primary key,
	studywarninglevel int,
	discipinarywarninglevel int,
	discipinaryform varchar(100),
	constraint student_study_PK foreign key (studentcode) references mark(studentcode),
	constraint student_discipinary_PK foreign key (studentcode) references conduct(studentcode),
)
go

/**********************************************************************/

/*
	Khóa ngoại
*/

--Group 1

ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_educationlevel] FOREIGN KEY([educationlevelcode])
REFERENCES [dbo].[educationlevel] ([code])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_educationlevel]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_educationtype] FOREIGN KEY([educationtypecode])
REFERENCES [dbo].[educationtype] ([code])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_educationtype]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_faculty] FOREIGN KEY([facultycode])
REFERENCES [dbo].[faculty] ([code])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_faculty]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_class] FOREIGN KEY([classcode])
REFERENCES [dbo].[class] ([code])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_class]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_grade] FOREIGN KEY([gradecode])
REFERENCES [dbo].[grade] ([code])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_grade]
GO

/**********************************************************************/

--Group2

ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Academic] FOREIGN KEY([Academicode])
REFERENCES [dbo].[Academic] ([Code])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Academic]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Degree] FOREIGN KEY([Degreecode])
REFERENCES [dbo].[Degree] ([Code])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Degree]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_EducationField] FOREIGN KEY([EducationFieldCode])
REFERENCES [dbo].[EducationField] ([Code])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_EducationField]
GO
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Position] FOREIGN KEY([Positioncode])
REFERENCES [dbo].[Position] ([Code])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Position]
GO
ALTER TABLE [dbo].[Staff_ProjectResearch]  WITH CHECK ADD  CONSTRAINT [FK_Staff_ProjectResearch_ResearchProject] FOREIGN KEY([ProjectReaseachCode])
REFERENCES [dbo].[ResearchProject] ([Code])
GO
ALTER TABLE [dbo].[Staff_ProjectResearch] CHECK CONSTRAINT [FK_Staff_ProjectResearch_ResearchProject]
GO
ALTER TABLE [dbo].[Staff_ProjectResearch]  WITH CHECK ADD  CONSTRAINT [FK_Staff_ProjectResearch_Staff] FOREIGN KEY([StaffCode])
REFERENCES [dbo].[Staff] ([Code])
GO
ALTER TABLE [dbo].[Staff_ProjectResearch] CHECK CONSTRAINT [FK_Staff_ProjectResearch_Staff]
GO
ALTER TABLE [dbo].[StaffDocument]  WITH CHECK ADD  CONSTRAINT [FK_StaffDocument_Document] FOREIGN KEY([DocCode])
REFERENCES [dbo].[Document] ([Code])
GO
ALTER TABLE [dbo].[StaffDocument] CHECK CONSTRAINT [FK_StaffDocument_Document]
GO
ALTER TABLE [dbo].[StaffDocument]  WITH CHECK ADD  CONSTRAINT [FK_StaffDocument_Staff] FOREIGN KEY([StaffCode])
REFERENCES [dbo].[Staff] ([Code])
GO
ALTER TABLE [dbo].[StaffDocument] CHECK CONSTRAINT [FK_StaffDocument_Staff]
GO
ALTER TABLE [dbo].[StaffGraduated]  WITH CHECK ADD  CONSTRAINT [FK_StaffGraduated_Graduating] FOREIGN KEY([GraduatingCode])
REFERENCES [dbo].[Graduating] ([Code])
GO
ALTER TABLE [dbo].[StaffGraduated] CHECK CONSTRAINT [FK_StaffGraduated_Graduating]
GO
ALTER TABLE [dbo].[StaffGraduated]  WITH CHECK ADD  CONSTRAINT [FK_StaffGraduated_Staff] FOREIGN KEY([StaffCode])
REFERENCES [dbo].[Staff] ([Code])
GO
ALTER TABLE [dbo].[StaffGraduated] CHECK CONSTRAINT [FK_StaffGraduated_Staff]
GO

/**********************************************************************/

--Group3

alter table project add
	constraint project_FK_eduspec foreign key (educationspecializecode) references educationspecialize(code),
	constraint project_FK_defper foreign key (defendperiodcode) references defendperiod(code),
	constraint project_FK_staff foreign key (supervisor) references staff(code)
go
alter table defendperiodstudent add
	constraint defprdstd_FK_student foreign key (studentcode) references student(code),
	constraint defprdstd_FK_defendperiod foreign key (defendperiodcode) references defendperiod(code)
go
alter table defendcouncil add
	constraint defendcouncil_FK_eduspec foreign key (educationspecializecode) references educationspecialize(code),
	constraint defendcouncil_FK_defendperiod foreign key (defendperiodcode) references defendperiod(code),
	constraint defendcouncil_FK_hall foreign key (hallcode) references hall(code)
go
alter table defendcouncilstaff add
	constraint defcclstf_FK_defendcouncil foreign key (defendcouncilcode) references defendcouncil(code),
	constraint defcclstf_FK_staff foreign key (staffcode) references staff(code),
	constraint defcclstf_FK_duty foreign key (defendcouncildutycode) references defendcouncilduty(code)
go
alter table thesis add
	constraint thesis_FK_student foreign key (studentcode) references student(code),
	constraint thesis_FK_project foreign key (projectcode) references project(code)
go
alter table thesisreview add
	constraint thesisreview_FK_student foreign key (studentcode) references student(code),
	constraint thesisreview_FK_defendperiod foreign key (defendperiodcode) references defendperiod(code),
	constraint thesisreview_FK_staff foreign key (reviewer) references staff(code)
go
alter table thesisdefend add
	constraint thesisdefend_FK_student foreign key (studentcode) references student(code),
	constraint thesisdefend_FK_defendcouncil foreign key (defendcouncilcode) references defendcouncil(code)
go
alter table defendresult add
	constraint defendresult_FK_thesisdefend foreign key (resultcode) references thesisdefend(result),
	constraint defendresult_FK_staff foreign key (staffcode) references staff(code)
go

/**********************************************************************/

--Group4

ALTER TABLE dbo.course ADD CONSTRAINT FK_course_staffcode FOREIGN KEY (staffcode) REFERENCES dbo.Staff(Code)
ALTER TABLE dbo.course ADD	CONSTRAINT FK_course_subject FOREIGN KEY (subjectcode) REFERENCES dbo.subject(code)
GO
ALTER TABLE dbo.educationfield WITH CHECK ADD CONSTRAINT PK_educationfield_educationspecialize FOREIGN KEY (educationspecializecode) REFERENCES dbo.educationspecialize(code)
GO
ALTER TABLE dbo.educationspecialize WITH CHECK ADD CONSTRAINT FK_educationspecialize_educationfield FOREIGN KEY (educationfieldcode) REFERENCES dbo.educationfield(code)
GO
ALTER TABLE dbo.trainingdetails ADD	CONSTRAINT FK_trainingdetails_subject FOREIGN KEY (subjectcode) REFERENCES dbo.subject(code)
ALTER TABLE dbo.trainingdetails ADD	CONSTRAINT FK_trainingdetails_educationspecialize FOREIGN KEY (educationspecializecode) REFERENCES dbo.educationspecialize(code)
GO

/**********************************************************************/

--Group5

/**********************************************************************/

--Group6

/* Khóa ngoại ngay trong câu lệnh tạo bảng */

/**********************************************************************/

--Group7

/* Khóa ngoại ngay trong câu lệnh tạo bảng */

/**********************************************************************/

--Group8

/**********************************************************************/

--Group9

/* Chưa có khóa ngoại */

/**********************************************************************/

--Group10

/* Khóa ngoại ngay trong câu lệnh tạo bảng */

/**********************************************************************/

--Group11

/* Khóa ngoại ngay trong câu lệnh tạo bảng */
