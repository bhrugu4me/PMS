USE [master]
GO
/****** Object:  Database [PMS]    Script Date: 18/01/2018 11:53:17 AM ******/
CREATE DATABASE [PMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PMS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PMS_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PMS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PMS] SET  MULTI_USER 
GO
ALTER DATABASE [PMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PMS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PMS]
GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProject](
	[ProjectId] [uniqueidentifier] NOT NULL,
	[ProjectName] [nvarchar](100) NOT NULL,
	[ProjectTypeId] [uniqueidentifier] NOT NULL,
	[ClientName] [nvarchar](100) NOT NULL,
	[ClientEmail] [nvarchar](100) NOT NULL,
	[ClientContact] [nvarchar](50) NOT NULL,
	[ProjectDescription] [nvarchar](1000) NULL,
	[Technology] [nvarchar](100) NULL,
	[ProjectManagerId] [uniqueidentifier] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifiedBy] [uniqueidentifier] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tblProject] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProjectType]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectType](
	[ProjectTypeId] [uniqueidentifier] NOT NULL,
	[ProjectType] [nvarchar](100) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifiedBy] [uniqueidentifier] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tblProjectType] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [uniqueidentifier] NOT NULL,
	[EmailId] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[LastLogin] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifiedBy] [uniqueidentifier] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUserInfo]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserInfo](
	[UserInfoId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserTypeId] [uniqueidentifier] NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](200) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifiedBy] [uniqueidentifier] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tblUserInfo] PRIMARY KEY CLUSTERED 
(
	[UserInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserType](
	[UserTypeId] [uniqueidentifier] NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblProject] ([ProjectId], [ProjectName], [ProjectTypeId], [ClientName], [ClientEmail], [ClientContact], [ProjectDescription], [Technology], [ProjectManagerId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'99cc70ff-4da1-46ab-a320-a0fe2103c8c8', N'Project 2', N'bd519589-4b72-4e64-8392-21abcb52b536', N'client 2', N'client2@gmail.com', N'24346565', N'test desc', N'Java', N'89e3b9b4-c528-45e6-b050-a133da34392f', N'89e3b9b4-c528-45e6-b050-a133da34392f', CAST(N'2018-01-18 05:53:58.400' AS DateTime), NULL, NULL)
INSERT [dbo].[tblProject] ([ProjectId], [ProjectName], [ProjectTypeId], [ClientName], [ClientEmail], [ClientContact], [ProjectDescription], [Technology], [ProjectManagerId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'c4bf1958-70de-492a-a9ce-c8c48a06b874', N'Project 1', N'bd519589-4b72-4e64-8392-21abcb52b536', N'Client 1', N'client@gmail.com', N'9034343243', N'test descr', N'ASP.Net,Web Api, Sql, Dapper, Angular', N'258ea2cf-78b8-4ba8-885b-eb3a06c662c5', N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-17 16:51:15.903' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-17 17:50:36.133' AS DateTime))
INSERT [dbo].[tblProject] ([ProjectId], [ProjectName], [ProjectTypeId], [ClientName], [ClientEmail], [ClientContact], [ProjectDescription], [Technology], [ProjectManagerId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'ef100131-7f84-4cc6-8026-d6a48b01b49b', N'Project 4', N'bd519589-4b72-4e64-8392-21abcb52b536', N'client 4', N'cl4@gmail.com', N'354656765', N'test', N'asp.net, c#', N'258ea2cf-78b8-4ba8-885b-eb3a06c662c5', N'258ea2cf-78b8-4ba8-885b-eb3a06c662c5', CAST(N'2018-01-18 06:02:57.163' AS DateTime), NULL, NULL)
INSERT [dbo].[tblProject] ([ProjectId], [ProjectName], [ProjectTypeId], [ClientName], [ClientEmail], [ClientContact], [ProjectDescription], [Technology], [ProjectManagerId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'd83af1ff-cf35-4ac5-ab9e-dd2ff5923307', N'Project 3', N'a005ba3f-282c-43fd-ad6e-5e654b765cfd', N'client 3', N'cl3@gmail.com', N'2143445345', N'test', N'Node js', N'89e3b9b4-c528-45e6-b050-a133da34392f', N'89e3b9b4-c528-45e6-b050-a133da34392f', CAST(N'2018-01-18 06:01:14.427' AS DateTime), NULL, NULL)
INSERT [dbo].[tblProjectType] ([ProjectTypeId], [ProjectType], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'bd519589-4b72-4e64-8392-21abcb52b536', N'Fixed Price', N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblProjectType] ([ProjectTypeId], [ProjectType], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'a005ba3f-282c-43fd-ad6e-5e654b765cfd', N'Timely', N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUser] ([UserId], [EmailId], [Password], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'89e3b9b4-c528-45e6-b050-a133da34392f', N'ronk123@gmail.com', N'test123', CAST(N'1900-01-02 00:00:00.000' AS DateTime), NULL, N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-18 06:10:34.637' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-18 06:10:34.637' AS DateTime))
INSERT [dbo].[tblUser] ([UserId], [EmailId], [Password], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'b4f97ac1-2481-42f6-a132-aec26a653dde', N'bhrugu4me@gmail.com', N'test123', CAST(N'2018-01-18 06:08:06.253' AS DateTime), 1, N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUser] ([UserId], [EmailId], [Password], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'258ea2cf-78b8-4ba8-885b-eb3a06c662c5', N'raj123@gmail.com', N'test123', CAST(N'2018-01-18 06:18:31.253' AS DateTime), 1, N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUserInfo] ([UserInfoId], [UserId], [FirstName], [LastName], [UserTypeId], [ContactNo], [Location], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'fd576c39-6b76-4a25-8982-180e7ae1a9bb', N'b4f97ac1-2481-42f6-a132-aec26a653dde', N'Bhrugesh', N'Thakkar', N'c12a9643-c448-4018-8c0c-b371bc1792c4', N'9033449842', N'Ahmedabad', N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUserInfo] ([UserInfoId], [UserId], [FirstName], [LastName], [UserTypeId], [ContactNo], [Location], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'ce01c2cd-695f-4233-afc4-9e5ef5a2f09a', N'258ea2cf-78b8-4ba8-885b-eb3a06c662c5', N'Raj', N'Patel', N'bd512ea8-6e99-42b6-be61-69f9f90b26f4', N'9850424453', N'Ahmedabad', N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUserInfo] ([UserInfoId], [UserId], [FirstName], [LastName], [UserTypeId], [ContactNo], [Location], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'20ce7c36-01ad-4cb4-9d77-e11fc61c2ec5', N'89e3b9b4-c528-45e6-b050-a133da34392f', N'Ronak', N'Shah', N'bd512ea8-6e99-42b6-be61-69f9f90b26f4', N'9076688864', N'Ahmedabad', N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-18 06:12:52.890' AS DateTime), N'b4f97ac1-2481-42f6-a132-aec26a653dde', CAST(N'2018-01-18 06:12:52.890' AS DateTime))
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (N'2d7071a1-af0e-4f40-9216-1620553e2710', N'Senior Developer', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'ea5fee66-9b37-4db3-bed2-d9bc514772e4', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'ea5fee66-9b37-4db3-bed2-d9bc514772e4')
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (N'bd512ea8-6e99-42b6-be61-69f9f90b26f4', N'Project Manager', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'ea5fee66-9b37-4db3-bed2-d9bc514772e4', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'ea5fee66-9b37-4db3-bed2-d9bc514772e4')
INSERT [dbo].[tblUserType] ([UserTypeId], [UserType], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (N'c12a9643-c448-4018-8c0c-b371bc1792c4', N'Administrator', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'ea5fee66-9b37-4db3-bed2-d9bc514772e4', CAST(N'2018-01-13 00:00:00.000' AS DateTime), N'ea5fee66-9b37-4db3-bed2-d9bc514772e4')
ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblProjectType] FOREIGN KEY([ProjectTypeId])
REFERENCES [dbo].[tblProjectType] ([ProjectTypeId])
GO
ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_tblProject_tblProjectType]
GO
ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblUser] FOREIGN KEY([ProjectManagerId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_tblProject_tblUser]
GO
ALTER TABLE [dbo].[tblUserInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblUserInfo_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblUserInfo] CHECK CONSTRAINT [FK_tblUserInfo_tblUser]
GO
ALTER TABLE [dbo].[tblUserInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblUserInfo_tblUserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[tblUserType] ([UserTypeId])
GO
ALTER TABLE [dbo].[tblUserInfo] CHECK CONSTRAINT [FK_tblUserInfo_tblUserType]
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckUserLogin]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CheckUserLogin]
@emailId as nvarchar(100),
@password as nvarchar(max)
as
begin
	update tblUser set LastLogin=GETUTCDATE() where EmailId=@emailId and Password=@password;

	Select tu.UserId,tu.EmailId,tu.IsActive,tui.ContactNo,tui.FirstName,tui.LastName,tui.Location,
	tui.UserInfoId,tut.UserType
	from tblUser tu WITH(NOLOCK)
	inner join tblUserInfo tui WITH(NOLOCK) on tu.UserId=tui.UserId
	inner join tblUserType tut WITH(NOLOCK) on tut.UserTypeId=tui.UserTypeId
	where tu.EmailId=@emailId and tu.Password=@password
end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProject]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteProject]
@projectId uniqueidentifier
as
begin
	delete from tblProject where ProjectId=@projectId;
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProjects]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetProjects]
@projectId uniqueidentifier=null,
@projectManagerId uniqueidentifier=null
as
begin
	if(@projectId is null and @projectManagerId is null)
	begin
		select tp.ClientContact,tp.ClientEmail,tp.ClientName,tp.LastModifiedBy,tp.LastModifiedDate,tp.CreatedDate,
		tp.CreatedBy,tp.ProjectDescription,tp.ProjectId,tp.ProjectManagerId,tp.ProjectName,tp.ProjectTypeId,
		tp.Technology,tu.EmailId,tui.ContactNo,tui.FirstName,tui.LastName,tui.UserInfoId,tui.Location,
		tut.UserType,tut.UserTypeId,tpt.ProjectType
		from tblProject tp WITH(NOLOCK)
		inner join tblProjectType tpt WITH(NOLOCK) on tp.ProjectTypeId=tpt.ProjectTypeId
		inner join tblUser tu WITH(NOLOCK) on tu.UserId=tp.ProjectManagerId
		inner join tblUserInfo tui WITH(NOLOCK) on tu.UserId=tui.UserId
		inner join tblUserType tut WITH(NOLOCK) on tut.UserTypeId=tui.UserTypeId

	end
	else if(@projectId is not null and @projectManagerId is null)
	begin
		select tp.ClientContact,tp.ClientEmail,tp.ClientName,tp.LastModifiedBy,tp.LastModifiedDate,tp.CreatedDate,
		tp.CreatedBy,tp.ProjectDescription,tp.ProjectId,tp.ProjectManagerId,tp.ProjectName,tp.ProjectTypeId,
		tp.Technology,tu.EmailId,tui.ContactNo,tui.FirstName,tui.LastName,tui.UserInfoId,tui.Location,
		tut.UserType,tut.UserTypeId,tpt.ProjectType
		from tblProject tp WITH(NOLOCK)
		inner join tblProjectType tpt WITH(NOLOCK) on tp.ProjectTypeId=tpt.ProjectTypeId
		inner join tblUser tu WITH(NOLOCK) on tu.UserId=tp.ProjectManagerId
		inner join tblUserInfo tui WITH(NOLOCK) on tu.UserId=tui.UserId
		inner join tblUserType tut WITH(NOLOCK) on tut.UserTypeId=tui.UserTypeId
		where tp.ProjectId=@projectId
	end
	else if(@projectManagerId is not null and @projectId is null)
	begin
		select tp.ClientContact,tp.ClientEmail,tp.ClientName,tp.LastModifiedBy,tp.LastModifiedDate,tp.CreatedDate,
		tp.CreatedBy,tp.ProjectDescription,tp.ProjectId,tp.ProjectManagerId,tp.ProjectName,tp.ProjectTypeId,
		tp.Technology,tu.EmailId,tui.ContactNo,tui.FirstName,tui.LastName,tui.UserInfoId,tui.Location,
		tut.UserType,tut.UserTypeId,tpt.ProjectType
		from tblProject tp WITH(NOLOCK)
		inner join tblProjectType tpt WITH(NOLOCK) on tp.ProjectTypeId=tpt.ProjectTypeId
		inner join tblUser tu WITH(NOLOCK) on tu.UserId=tp.ProjectManagerId
		inner join tblUserInfo tui WITH(NOLOCK) on tu.UserId=tui.UserId
		inner join tblUserType tut WITH(NOLOCK) on tut.UserTypeId=tui.UserTypeId
		where tp.ProjectManagerId=@projectManagerId
	end
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProjectTypes]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetProjectTypes]
as
begin
	Select ProjectTypeId,ProjectType from tblProjectType WITH(NOLOCK)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUsers]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUsers]
as
begin
	Select tu.UserId,tu.EmailId,tu.IsActive,tui.ContactNo,tui.FirstName,tui.LastName,tui.Location,
	tui.UserInfoId,tut.UserType
	from tblUser tu WITH(NOLOCK)
	inner join tblUserInfo tui WITH(NOLOCK) on tu.UserId=tui.UserId
	inner join tblUserType tut WITH(NOLOCK) on tut.UserTypeId=tui.UserTypeId

end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserTypes]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserTypes]
as
begin
	Select UserTypeId,UserType from tblUserType WITH(NOLOCK)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_SetProject]    Script Date: 18/01/2018 11:53:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SetProject]
@projectid uniqueidentifier=null,
@projectname nvarchar(100),
@projecttypeid uniqueidentifier,
@clientname nvarchar(100),
@clientemail nvarchar(100),
@clientcontact nvarchar(50),
@projectdescription nvarchar(1000),
@technology nvarchar(100),
@projectmanagerid uniqueidentifier,
@requestorid uniqueidentifier
as
begin
	if(not exists(select 1 from tblProject where ProjectId=@projectid))
	begin
			declare @temp uniqueidentifier;
			set @temp=NEWID();
	
		INSERT INTO tblProject(ProjectId,ProjectName,ProjectTypeId,ClientName,ClientEmail,ClientContact,ProjectDescription,Technology,ProjectManagerId,CreatedBy,CreatedDate)
		VALUES (@temp,@projectname,@projecttypeid,@clientname,@clientemail,@clientcontact,@projectdescription,@technology,@projectmanagerid,@requestorid,GETUTCDATE());

		select * from tblProject where ProjectId=@temp;
	end
	else
	begin
		UPDATE tblProject
		SET	ProjectName=@projectname,
			ProjectTypeId=@projecttypeid,
			ClientName=@clientname,
			ClientEmail=@clientemail,
			ClientContact=@clientcontact,
			ProjectDescription=@projectdescription,
			Technology=@technology,
			ProjectManagerId=@projectmanagerid,
			LastModifiedBy=@requestorid,
			LastModifiedDate=GETUTCDATE()
		WHERE ProjectId=@projectid;

		select * from tblProject where ProjectId= @projectid;
	end
end
GO
USE [master]
GO
ALTER DATABASE [PMS] SET  READ_WRITE 
GO
