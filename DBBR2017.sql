USE [master]
GO

/****** Object:  Database [DBBR2017]    Script Date: 08/08/2018 12:49:24 ******/
DROP DATABASE [DBBR2017]
GO

/****** Object:  Database [DBBR2017]    Script Date: 08/08/2018 12:49:24 ******/
CREATE DATABASE [DBBR2017]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBBR2017', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBBR2017.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBBR2017_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBBR2017_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [DBBR2017] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBBR2017].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DBBR2017] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DBBR2017] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DBBR2017] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DBBR2017] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DBBR2017] SET ARITHABORT OFF 
GO

ALTER DATABASE [DBBR2017] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DBBR2017] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DBBR2017] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DBBR2017] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DBBR2017] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DBBR2017] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DBBR2017] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DBBR2017] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DBBR2017] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DBBR2017] SET  DISABLE_BROKER 
GO

ALTER DATABASE [DBBR2017] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DBBR2017] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DBBR2017] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DBBR2017] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DBBR2017] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DBBR2017] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DBBR2017] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DBBR2017] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [DBBR2017] SET  MULTI_USER 
GO

ALTER DATABASE [DBBR2017] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DBBR2017] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DBBR2017] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DBBR2017] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [DBBR2017] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [DBBR2017] SET QUERY_STORE = OFF
GO

USE [DBBR2017]
GO

ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [DBBR2017] SET  READ_WRITE 
GO


USE [DBBR2017]
GO

ALTER TABLE [dbo].[Atletas] DROP CONSTRAINT [FK_Atletas_Posicao]
GO

/****** Object:  Table [dbo].[Atletas]    Script Date: 08/08/2018 12:50:14 ******/
DROP TABLE [dbo].[Atletas]
GO

/****** Object:  Table [dbo].[Atletas]    Script Date: 08/08/2018 12:50:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- TABELA ATLETAS

CREATE TABLE [dbo].[Atletas](
	[IDAtletas] [int] IDENTITY(1,1) NOT NULL,
	[PNome] [nvarchar](50) NOT NULL,
	[SNome] [nvarchar](50) NOT NULL,
	[Nasc] [date] NOT NULL,
	[MassaC] [int] NULL,
	[Estatura] [int] NULL,
	[Posicao] [int] NOT NULL,
	[Nacionalidade] [int] NOT NULL,
 CONSTRAINT [PK_Atletas] PRIMARY KEY CLUSTERED 
(
	[IDAtletas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Atletas]  WITH CHECK ADD  CONSTRAINT [FK_Atletas_Posicao] FOREIGN KEY([Posicao])
REFERENCES [dbo].[Posicao] ([IDPosicao])
GO

ALTER TABLE [dbo].[Atletas] CHECK CONSTRAINT [FK_Atletas_Posicao]
GO

-- TABELA EQUIPES

USE [DBBR2017]
GO

/****** Object:  Table [dbo].[Equipes]    Script Date: 08/08/2018 12:51:47 ******/
DROP TABLE [dbo].[Equipes]
GO

/****** Object:  Table [dbo].[Equipes]    Script Date: 08/08/2018 12:51:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Equipes](
	[IDEquipes] [int] NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Equipes_1] PRIMARY KEY CLUSTERED 
(
	[IDEquipes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- TABELA EVENTOS

USE [DBBR2017]
GO

ALTER TABLE [dbo].[Eventos] DROP CONSTRAINT [FK_Eventos_Qualificadores]
GO

ALTER TABLE [dbo].[Eventos] DROP CONSTRAINT [FK_Eventos_Equipes1]
GO

ALTER TABLE [dbo].[Eventos] DROP CONSTRAINT [FK_Eventos_Atletas]
GO

/****** Object:  Table [dbo].[Eventos]    Script Date: 08/08/2018 12:52:14 ******/
DROP TABLE [dbo].[Eventos]
GO

/****** Object:  Table [dbo].[Eventos]    Script Date: 08/08/2018 12:52:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Eventos](
	[IDEvento] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Min] [int] NOT NULL,
	[Sec] [int] NOT NULL,
	[Equipe] [int] NOT NULL,
	[Resultado] [int] NOT NULL,
	[X] [decimal](18, 0) NOT NULL,
	[Y] [decimal](18, 0) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Qualificadores] [int] NOT NULL,
	[Atleta] [int] NOT NULL,
	[Partida] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Eventos] PRIMARY KEY CLUSTERED 
(
	[IDEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_Atletas] FOREIGN KEY([Atleta])
REFERENCES [dbo].[Atletas] ([IDAtletas])
GO

ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_Atletas]
GO

ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_Equipes1] FOREIGN KEY([Equipe])
REFERENCES [dbo].[Equipes] ([IDEquipes])
GO

ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_Equipes1]
GO

ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_Qualificadores] FOREIGN KEY([Qualificadores])
REFERENCES [dbo].[Qualificadores] ([IDQualificador])
GO

ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_Qualificadores]
GO

-- TABELA PARTIDAS

USE [DBBR2017]
GO

ALTER TABLE [dbo].[Partidas] DROP CONSTRAINT [FK_Partidas_Equipes]
GO

/****** Object:  Table [dbo].[Partidas]    Script Date: 08/08/2018 12:52:30 ******/
DROP TABLE [dbo].[Partidas]
GO

/****** Object:  Table [dbo].[Partidas]    Script Date: 08/08/2018 12:52:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Partidas](
	[IDPartidas] [int] NOT NULL,
	[ForaGols] [int] NOT NULL,
	[ForaId] [int] NOT NULL,
	[CompId] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[CasaGols] [int] NOT NULL,
	[CasaID] [int] NOT NULL,
	[Rodada] [int] NOT NULL,
	[IniPer1] [int] NOT NULL,
	[IniPer2] [int] NOT NULL,
	[TemporadaID] [int] NOT NULL,
	[Estadio] [nvarchar](50) NOT NULL,
	[Cidade] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partidas] PRIMARY KEY CLUSTERED 
(
	[IDPartidas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Equipes] FOREIGN KEY([ForaId])
REFERENCES [dbo].[Equipes] ([IDEquipes])
GO

ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Equipes]
GO

-- TABELA POSI��O

USE [DBBR2017]
GO

/****** Object:  Table [dbo].[Posicao]    Script Date: 08/08/2018 12:53:05 ******/
DROP TABLE [dbo].[Posicao]
GO

/****** Object:  Table [dbo].[Posicao]    Script Date: 08/08/2018 12:53:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Posicao](
	[IDPosicao] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Corredor] [char](1) NULL,
 CONSTRAINT [PK_Posicao_1] PRIMARY KEY CLUSTERED 
(
	[IDPosicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--TABELA QUALIFICADORES

USE [DBBR2017]
GO

/****** Object:  Table [dbo].[Qualificadores]    Script Date: 08/08/2018 12:53:33 ******/
DROP TABLE [dbo].[Qualificadores]
GO

/****** Object:  Table [dbo].[Qualificadores]    Script Date: 08/08/2018 12:53:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Qualificadores](
	[IDQualificador] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [int] NOT NULL,
 CONSTRAINT [PK_Qualificadores] PRIMARY KEY CLUSTERED 
(
	[IDQualificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

