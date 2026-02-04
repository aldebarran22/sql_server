USE [Empresa_PRC]
GO

/****** Object:  Table [dbo].[Pedidos]    Script Date: 04/02/2026 17:11:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [int] NOT NULL,
	[IdCliente] [nvarchar](5) NOT NULL,
	[IdEmpleado] [int] NULL,
	[FechaPedido] [datetime] NULL,
	[FechaEntrega] [datetime] NULL,
	[FechaEnvío] [datetime] NULL,
	[FormaEnvío] [int] NULL,
	[Cargo] [money] NULL,
	[Destinatario] [nvarchar](40) NULL,
	[DirecciónDestinatario] [nvarchar](60) NULL,
	[CiudadDestinatario] [nvarchar](15) NULL,
	[RegiónDestinatario] [nvarchar](15) NULL,
	[CódPostalDestinatario] [nvarchar](10) NULL,
	[PaísDestinatario] [nvarchar](15) NULL,
	[pais]  AS (upper([PaísDestinatario])) PERSISTED
) ON [PRIMARY]
GO

