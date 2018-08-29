CREATE DATABASE ProjectManage
GO

USE ProjectManage

CREATE TABLE project
    (
      code VARCHAR(10) ,
      name NVARCHAR(200) ,
      detail NVARCHAR(500) ,
      departmentcode VARCHAR(10) ,
      defendperiodcode VARCHAR(10) ,
      supervisor VARCHAR(10) CONSTRAINT PK_project PRIMARY KEY ( code )
    )
GO
CREATE TABLE defendperiod
    (
      code VARCHAR(10) ,
      year INT ,
      name NVARCHAR(50) ,
      startdate DATE ,
      enddate DATE ,
      CONSTRAINT PK_defendperiod PRIMARY KEY ( code )
    )
GO
CREATE TABLE defendperiodstudent
    (
      studentcode VARCHAR(10) ,
      defendperiodcode VARCHAR(10) ,
      valid BIT ,
      CONSTRAINT PK_defendperiodstudent PRIMARY KEY
        ( studentcode, defendperiodcode )
    )
GO
CREATE TABLE defendcouncil
    (
      code VARCHAR(10) ,
      codeview VARCHAR(10) ,
      name NVARCHAR(50) ,
      departmentcode VARCHAR(10) ,
      defendperiodcode VARCHAR(10) ,
      hallcode VARCHAR(10) ,
      defendtime DATETIME ,
      CONSTRAINT PK_defendcouncil PRIMARY KEY ( code )
    )
GO
CREATE TABLE defendcouncilduty
    (
      code VARCHAR(10) ,
      name NVARCHAR(20) ,
      CONSTRAINT PK_defendcouncilduty PRIMARY KEY ( code )
    )
GO
CREATE TABLE defendcouncilstaff
    (
      defendcouncilcode VARCHAR(10) ,
      staffcode VARCHAR(10) ,
      defendcouncildutycode VARCHAR(10)
        CONSTRAINT PK_defendcouncilstaff
        PRIMARY KEY ( defendcouncilcode, staffcode )
    )
GO
CREATE TABLE thesis
    (
      studentcode VARCHAR(10) ,
      projectcode VARCHAR(10) ,
      supervisormark FLOAT ,
      CONSTRAINT PK_thesis PRIMARY KEY ( studentcode, projectcode )
    )
GO
CREATE TABLE thesisreview
    (
      studentcode VARCHAR(10) ,
      reviewer VARCHAR(10) ,
      defendperiodcode VARCHAR(10) ,
      reviewermark FLOAT ,
      CONSTRAINT PK_thesisreview PRIMARY KEY
        ( studentcode, reviewer, defendperiodcode )
    )
GO
CREATE TABLE thesisdefend
    (
      studentcode VARCHAR(10) ,
      defendcouncilcode VARCHAR(10) ,
      defendmark1 FLOAT ,
      defendmark2 FLOAT ,
      defendmark3 FLOAT ,
      defendmark4 FLOAT ,
      defendmark5 FLOAT ,
      CONSTRAINT PK_thesisdefend PRIMARY KEY
        ( studentcode, defendcouncilcode )
    )
GO
ALTER TABLE project
ADD CONSTRAINT FK_project
FOREIGN KEY(defendperiodcode) REFERENCES defendperiod(code)
GO
ALTER TABLE defendperiodstudent
ADD CONSTRAINT FK_defendperiodstudent
FOREIGN KEY(defendperiodcode) REFERENCES defendperiod(code)
GO
ALTER TABLE defendcouncil
ADD CONSTRAINT FK_defendcouncil
FOREIGN KEY(defendperiodcode) REFERENCES defendperiod(code)
GO

ALTER TABLE defendcouncilstaff
ADD CONSTRAINT FK_defendcouncilstaff FOREIGN KEY(defendcouncilcode) REFERENCES defendcouncil(code),
FOREIGN KEY(defendcouncildutycode) REFERENCES defendcouncilduty(code)
GO
ALTER TABLE thesis
ADD CONSTRAINT FK_thesis
FOREIGN KEY(projectcode) REFERENCES project(code)
GO
ALTER TABLE thesisreview
ADD CONSTRAINT FK_thesisreview
FOREIGN KEY(defendperiodcode) REFERENCES defendperiod(code)
GO
GO
ALTER TABLE thesisdefend
ADD CONSTRAINT FK_thesisdefend
FOREIGN KEY(defendcouncilcode) REFERENCES defendcouncil(code)
