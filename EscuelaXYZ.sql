USE [master]
GO
/****** Object:  Database [EscuelaXYZ]    Script Date: 19/10/2024 12:05:16 ******/
CREATE DATABASE [EscuelaXYZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EscuelaXYZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EscuelaXYZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EscuelaXYZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EscuelaXYZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EscuelaXYZ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EscuelaXYZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EscuelaXYZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EscuelaXYZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EscuelaXYZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EscuelaXYZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EscuelaXYZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET RECOVERY FULL 
GO
ALTER DATABASE [EscuelaXYZ] SET  MULTI_USER 
GO
ALTER DATABASE [EscuelaXYZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EscuelaXYZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EscuelaXYZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EscuelaXYZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EscuelaXYZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EscuelaXYZ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EscuelaXYZ', N'ON'
GO
ALTER DATABASE [EscuelaXYZ] SET QUERY_STORE = ON
GO
ALTER DATABASE [EscuelaXYZ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EscuelaXYZ]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 19/10/2024 12:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[id_alumno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[id_aula] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aulas]    Script Date: 19/10/2024 12:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aulas](
	[id_aula] [int] IDENTITY(1,1) NOT NULL,
	[nombre_aula] [varchar](50) NOT NULL,
	[capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_aula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docentes]    Script Date: 19/10/2024 12:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docentes](
	[id_docente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[especialidad] [varchar](100) NULL,
	[id_aula] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_docente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [apellido], [fecha_nacimiento], [id_aula]) VALUES (1, N'Carlos', N'Sánchez', CAST(N'2010-03-15' AS Date), 1)
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [apellido], [fecha_nacimiento], [id_aula]) VALUES (2, N'Lucía', N'Martínez', CAST(N'2009-06-22' AS Date), 2)
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [apellido], [fecha_nacimiento], [id_aula]) VALUES (3, N'Andrés', N'García', CAST(N'2011-01-10' AS Date), 1)
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [apellido], [fecha_nacimiento], [id_aula]) VALUES (4, N'Carolina', N'Ramírez', CAST(N'2010-09-30' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
GO
SET IDENTITY_INSERT [dbo].[aulas] ON 

INSERT [dbo].[aulas] ([id_aula], [nombre_aula], [capacidad]) VALUES (1, N'Aula 101', 30)
INSERT [dbo].[aulas] ([id_aula], [nombre_aula], [capacidad]) VALUES (2, N'Aula 102', 25)
SET IDENTITY_INSERT [dbo].[aulas] OFF
GO
SET IDENTITY_INSERT [dbo].[docentes] ON 

INSERT [dbo].[docentes] ([id_docente], [nombre], [apellido], [especialidad], [id_aula]) VALUES (1, N'Carlos', N'Gómez', N'Matemáticas', 1)
INSERT [dbo].[docentes] ([id_docente], [nombre], [apellido], [especialidad], [id_aula]) VALUES (2, N'Sofia', N'Flores', N'Computación', 2)
SET IDENTITY_INSERT [dbo].[docentes] OFF
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD FOREIGN KEY([id_aula])
REFERENCES [dbo].[aulas] ([id_aula])
GO
ALTER TABLE [dbo].[docentes]  WITH CHECK ADD FOREIGN KEY([id_aula])
REFERENCES [dbo].[aulas] ([id_aula])
GO
/****** Object:  StoredProcedure [dbo].[spActualizarAlumno]    Script Date: 19/10/2024 12:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarAlumno]
    @IdAlumno INT,
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @FechaNacimiento DATE,
    @IdAula INT
AS
BEGIN
    UPDATE alumnos
    SET nombre = @Nombre,
        apellido = @Apellido,
        fecha_nacimiento = @FechaNacimiento,
        id_aula = @IdAula
    WHERE id_alumno = @IdAlumno;
END;
GO
/****** Object:  StoredProcedure [dbo].[spCrearAlumno]    Script Date: 19/10/2024 12:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearAlumno]
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @FechaNacimiento DATE,
    @IdAula INT
AS
BEGIN
    INSERT INTO alumnos (nombre, apellido, fecha_nacimiento, id_aula)
    VALUES (@Nombre, @Apellido, @FechaNacimiento, @IdAula);
END;
GO
/****** Object:  StoredProcedure [dbo].[spEliminarAlumno]    Script Date: 19/10/2024 12:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarAlumno]
    @IdAlumno INT
AS
BEGIN
    DELETE FROM Alumnos WHERE id_alumno = @IdAlumno;
END;
GO
/****** Object:  StoredProcedure [dbo].[spListarAlumnos]    Script Date: 19/10/2024 12:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarAlumnos]
AS
BEGIN
    SELECT id_alumno, nombre, apellido, fecha_nacimiento, id_aula
    FROM Alumnos;
END;
GO
/****** Object:  StoredProcedure [dbo].[spObtenerAlumnosPorAula]    Script Date: 19/10/2024 12:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerAlumnosPorAula]
    @IdAula INT
AS
BEGIN
    SELECT nombre, apellido, fecha_nacimiento
    FROM Alumnos
    WHERE id_aula = @IdAula;
END;
GO
USE [master]
GO
ALTER DATABASE [EscuelaXYZ] SET  READ_WRITE 
GO
