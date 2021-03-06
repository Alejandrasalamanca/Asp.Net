USE [Familias]
GO
/****** Object:  Table [dbo].[administrador]    Script Date: 09/03/2016 1:06:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[administrador](
	[IdAdministrador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Telefono] [bigint] NULL,
	[Direccion] [varchar](45) NULL,
	[Usuario] [varchar](45) NULL,
	[Contrasena] [varchar](45) NULL,
	[Tipo] [varchar](6) NULL,
	[Estado] [varchar](8) NULL,
 CONSTRAINT [administrador_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[IdAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[beneficiario]    Script Date: 09/03/2016 1:06:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[beneficiario](
	[idBeneficiario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](45) NULL,
	[Apellido] [varchar](45) NULL,
	[Telefono] [bigint] NULL,
	[Codigo] [real] NULL,
	[RazonSocial] [varchar](45) NULL,
	[FechaNacimiento] [date] NULL,
 CONSTRAINT [beneficiario_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[idBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[certificadosalud]    Script Date: 09/03/2016 1:06:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[certificadosalud](
	[IdCertificadoSalud] [int] IDENTITY(1,1) NOT NULL,
	[FechaActualizacion] [date] NULL,
	[Documento] [varchar](45) NULL,
	[Usuario] [int] NOT NULL,
 CONSTRAINT [certificadosalud_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[IdCertificadoSalud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[controlmedico]    Script Date: 09/03/2016 1:06:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[controlmedico](
	[IdControlMedico] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [int] NOT NULL,
 CONSTRAINT [controlmedico_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[IdControlMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[materia]    Script Date: 09/03/2016 1:06:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[materia](
	[idMateria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](45) NULL,
	[IntensidadHoraria] [varchar](45) NULL,
	[Notas] [int] NOT NULL,
 CONSTRAINT [materia_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[idMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[notas]    Script Date: 09/03/2016 1:06:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[notas](
	[idNotas] [int] IDENTITY(1,1) NOT NULL,
	[FechaActualizacion] [date] NULL,
	[Materia] [varchar](45) NULL,
	[Fallas] [int] NULL,
	[Nota] [int] NULL,
	[Documento] [varchar](45) NULL,
	[Usuario] [int] NOT NULL,
 CONSTRAINT [notas_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[idNotas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 09/03/2016 1:06:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Beneficiario] [int] NOT NULL,
	[Nombre] [varchar](45) NULL,
	[Apellido] [varchar](45) NULL,
	[Telefono] [bigint] NULL,
	[Edad] [real] NULL,
	[Estado] [varchar](8) NULL,
 CONSTRAINT [usuario_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[certificadosalud]  WITH CHECK ADD  CONSTRAINT [fk_CertificadoSalud_Usuario1] FOREIGN KEY([Usuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[certificadosalud] CHECK CONSTRAINT [fk_CertificadoSalud_Usuario1]
GO
ALTER TABLE [dbo].[controlmedico]  WITH CHECK ADD  CONSTRAINT [fk_ControlMedico_Usuario1] FOREIGN KEY([Usuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[controlmedico] CHECK CONSTRAINT [fk_ControlMedico_Usuario1]
GO
ALTER TABLE [dbo].[materia]  WITH CHECK ADD  CONSTRAINT [fk_Materia_Notas1] FOREIGN KEY([Notas])
REFERENCES [dbo].[notas] ([idNotas])
GO
ALTER TABLE [dbo].[materia] CHECK CONSTRAINT [fk_Materia_Notas1]
GO
ALTER TABLE [dbo].[notas]  WITH CHECK ADD  CONSTRAINT [fk_Notas_Usuario1] FOREIGN KEY([Usuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[notas] CHECK CONSTRAINT [fk_Notas_Usuario1]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_Usuario_Beneficiario] FOREIGN KEY([Beneficiario])
REFERENCES [dbo].[beneficiario] ([idBeneficiario])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [fk_Usuario_Beneficiario]
GO
