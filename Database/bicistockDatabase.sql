USE [BICISTOCK]
GO
/****** Object:  User [sa1]    Script Date: 07/06/2023 11:39:43 ******/
CREATE USER [sa1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[BIKE]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BIKE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[ID_Brand] [int] NOT NULL,
	[Bike_Image] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BRAND]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRAND](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BRAND_COMPONENT]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRAND_COMPONENT](
	[id_Component] [int] NOT NULL,
	[id_brand] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Component] ASC,
	[id_brand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CITATION]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITATION](
	[IDCitation] [int] IDENTITY(1,1) NOT NULL,
	[DateCitation] [datetime] NOT NULL,
	[DateRequest] [datetime] NOT NULL,
	[UsernameClient] [varchar](30) NOT NULL,
	[StatusCitation] [varchar](10) NOT NULL,
	[ID_Brand] [int] NOT NULL,
	[Description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCitation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPONENT]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT](
	[id_Component] [int] IDENTITY(1,1) NOT NULL,
	[name_Coponent] [varchar](max) NOT NULL,
	[component_image] [varchar](max) NULL,
	[description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Component] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENT]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENT](
	[id_event] [int] IDENTITY(1,1) NOT NULL,
	[id_brand] [int] NOT NULL,
	[event_description] [varchar](max) NULL,
	[MapURL] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_event] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISSION]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISSION](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](max) NULL,
	[DNI] [varchar](max) NULL,
	[Name] [varchar](max) NULL,
	[Surnames] [varchar](max) NULL,
	[Age] [int] NULL,
	[Phone] [varchar](max) NULL,
	[Verified] [varchar](1) NULL,
	[Id_Permission] [tinyint] NOT NULL,
	[Email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BIKE] ON 

INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (1, N'TREK Marlin 7', 1, N'/Images/bicicleta-trek-marlin-7-2022.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (2, N'GIANT Stance 29', 2, N'/Images/bicicleta-giant-stance-29-1-rosewood-2022.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (3, N'SCOTT Sub Comfort 20', 10, N'/Images/bicicleta-scott-sub-comfort-20-unisex-2022.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (4, N'CANNONDALE Adventure EQ', 9, N'/Images/bicicleta-cannondale-adventure-eq-2022.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (5, N'ORBEA MX 29 40', 4, N'/Images/bicicleta-orbea-mx-29-40-2021.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (6, N'ORBEA Occam H30', 4, N'/Images/bicicleta-orbea-occam-h30-2022.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (7, N'TREK Fuel EX 5', 1, N'/Images/bicicleta-trek-fuel-ex-5-29-2022.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (8, N'BMC Fourstroke FS01 LT', 11, N'/Images/bicicleta-bmc-fourstroke-fs01-lt-two-2022.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (9, N'BMC Roadmachine FOUR', 11, N'/Images/bicicleta-bmc-roadmachine-four-2022.jpg', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (10, N'connor malibuddddd', 2, N'/Images/91320-71_EPIC-HT-CARBON-29-BLK-WHT_HERO.png', NULL)
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (11, N'Trek 4400', 1, N'/Images/descarga.jpeg', N'Descripcion')
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (12, N'Bike test', 4, N'/Images/Moby-logo.webp', N'HOla')
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (13, N'ee', 3, N'/Images/colchon.PNG', N'ee')
INSERT [dbo].[BIKE] ([ID], [Name], [ID_Brand], [Bike_Image], [Description]) VALUES (14, N'ee', 2, N'/Images/colchon.PNG', N'ee')
SET IDENTITY_INSERT [dbo].[BIKE] OFF
GO
SET IDENTITY_INSERT [dbo].[BRAND] ON 

INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (1, N'Trek')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (2, N'Giant')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (3, N'Specialized')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (4, N'Orbea')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (5, N'Shimano')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (6, N'Sram')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (7, N'RockShox')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (8, N'Gurpil')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (9, N'Cannondale')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (10, N'Scott')
INSERT [dbo].[BRAND] ([ID], [Name]) VALUES (11, N'BMC')
SET IDENTITY_INSERT [dbo].[BRAND] OFF
GO
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (1, 5)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (2, 5)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (3, 6)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (4, 6)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (5, 7)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (6, 7)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (7, 6)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (8, 6)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (9, 8)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (10, 2)
INSERT [dbo].[BRAND_COMPONENT] ([id_Component], [id_brand]) VALUES (11, 1)
GO
SET IDENTITY_INSERT [dbo].[CITATION] ON 

INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (2, CAST(N'2022-05-26T15:00:00.000' AS DateTime), CAST(N'2022-05-15T11:33:21.757' AS DateTime), N'javi', N'Aceptada', 2, N'No me funcionan los cambios')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (3, CAST(N'2022-05-24T10:15:00.000' AS DateTime), CAST(N'2022-05-15T13:57:01.967' AS DateTime), N'Ainhoa', N'Aceptada', 10, N'Cambiar pastillas de freno')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (4, CAST(N'2022-05-27T12:00:00.000' AS DateTime), CAST(N'2022-05-15T14:08:27.243' AS DateTime), N'Lucas', N'Aceptada', 4, N'Revisión general')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (10, CAST(N'2022-05-14T05:00:00.000' AS DateTime), CAST(N'2022-05-15T18:49:55.500' AS DateTime), N'javi', N'Aceptada', 3, N'Me duele el sillin
')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (11, CAST(N'2022-05-28T10:00:00.000' AS DateTime), CAST(N'2022-05-16T21:08:33.913' AS DateTime), N'javi', N'Aceptada', 3, N'Me duele el sillin
')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (17, CAST(N'2023-04-28T00:00:00.000' AS DateTime), CAST(N'2023-04-18T13:45:24.137' AS DateTime), N'AaronLeon', N'Pendiente', 5, N'admin
')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (18, CAST(N'2023-04-19T03:00:00.000' AS DateTime), CAST(N'2023-04-18T20:42:58.657' AS DateTime), N'AaronLeon', N'Pendiente', 1, N'Hola test')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (20, CAST(N'2023-04-21T00:00:00.000' AS DateTime), CAST(N'2023-04-24T22:42:19.120' AS DateTime), N'perrozanche', N'Pendiente', 4, N'Kiero una bisi to wapa, con iamas, y nitro')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (21, CAST(N'2023-05-20T05:00:00.000' AS DateTime), CAST(N'2023-05-11T13:59:02.370' AS DateTime), N'AaronLeon', N'Pendiente', 1, N'admin
')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (22, CAST(N'2023-05-26T00:00:00.000' AS DateTime), CAST(N'2023-05-11T16:29:33.663' AS DateTime), N'AaronLeon', N'Pendiente', 3, N'hebhe
')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (23, CAST(N'2023-05-19T00:00:00.000' AS DateTime), CAST(N'2023-05-11T16:33:11.527' AS DateTime), N'AaronLeon', N'Pendiente', 4, N'eee
')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (28, CAST(N'2023-05-13T00:00:00.000' AS DateTime), CAST(N'2023-05-13T00:32:39.233' AS DateTime), N'AaronLeon', N'Pendiente', 4, N'dd')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (29, CAST(N'2023-05-13T00:00:00.000' AS DateTime), CAST(N'2023-05-13T00:55:52.463' AS DateTime), N'AaronLeon', N'Pendiente', 6, N'ss')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (30, CAST(N'2023-05-13T00:00:00.000' AS DateTime), CAST(N'2023-05-13T00:57:18.923' AS DateTime), N'AaronLeon', N'Pendiente', 5, N'ddd')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (31, CAST(N'2023-05-13T00:00:00.000' AS DateTime), CAST(N'2023-05-13T00:59:59.880' AS DateTime), N'AaronLeon', N'Pendiente', 2, N'ddd')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (32, CAST(N'2023-05-13T00:00:00.000' AS DateTime), CAST(N'2023-05-13T01:01:34.993' AS DateTime), N'AaronLeon', N'Pendiente', 2, N'dddd')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (33, CAST(N'2023-05-13T00:00:00.000' AS DateTime), CAST(N'2023-05-13T01:02:41.727' AS DateTime), N'AaronLeon', N'Pendiente', 3, N'admin')
INSERT [dbo].[CITATION] ([IDCitation], [DateCitation], [DateRequest], [UsernameClient], [StatusCitation], [ID_Brand], [Description]) VALUES (34, CAST(N'2023-05-19T00:00:00.000' AS DateTime), CAST(N'2023-05-19T11:02:18.630' AS DateTime), N'AaronLeon', N'Pendiente', 1, N'jkbuf')
SET IDENTITY_INSERT [dbo].[CITATION] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPONENT] ON 

INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (1, N'Desviador SHIMANO SIS', N'/Images/desviador-shimano-sis.jpg', N'Descripcion desviador')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (2, N'Freno trasero SHIMANO Mt400', N'/Images/freno-trasero-shimano-mt400.jpg', N'Descripcion freno')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (3, N'Disco freno SRAM Centerline 160 mm', N'/Images/disco-freno-sram-centerline-160-mm-biselado.jpg', N'Descripcion disco')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (4, N'Cambio SRAM GX 2x11', N'/Images/cambio-sram-gx-2x11-caja-larga-negro.jpg', N'Descripcion cambio')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (5, N'Amortiguador ROCKSHOX MONARCH XX', N'/Images/amortiguador-rockshox-monarch-xx-200x51.jpg', N'Descripcion amortiguador')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (6, N'Horquilla ROCKSHOX Boxxer Select 29', N'/Images/horquilla-rockshox-boxxer-select-29-boost-180-mm-183-mm.jpg', N'Descripcion Horquilla')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (7, N'Cassette SRAM Force Etap', N'/Images/cassette-sram-force-etap-axs-xg1270-12v-1036d.jpg', N'Descripcion Cassete')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (8, N'Pedalier SRAM Dub English BSA', N'/Images/pedalier-sram-dub-english-bsa-road-mtb-7368.jpg', N'Descripcion Pedalier')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (9, N'Rueda trasera GURPIL 26', N'/Images/rueda-trasera-gurpil-26-zac-8vnegro.jpg', N'Descripcion rueda')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (10, N'ee', N'/Images/colchon.PNG', N'/Images/colchon.PNG')
INSERT [dbo].[COMPONENT] ([id_Component], [name_Coponent], [component_image], [description]) VALUES (11, N'eeee', N'/Images/colchon.PNG', N'/Images/colchon.PNG')
SET IDENTITY_INSERT [dbo].[COMPONENT] OFF
GO
SET IDENTITY_INSERT [dbo].[EVENT] ON 

INSERT [dbo].[EVENT] ([id_event], [id_brand], [event_description], [MapURL]) VALUES (1, 4, N'Únete a nosotros en un emocionante evento de ciclismo patrocinado por la marca de bicicletas líder en el mercado. Comenzaremos nuestra ruta en el ayuntamiento de Mutxamel, donde los participantes tendrán la oportunidad de conocer a otros ciclistas y recibir una breve charla de seguridad y orientación por parte de nuestros expertos.

Nuestra ruta comenzará en dirección al puerto de Tibi. A lo largo del camino, podrás disfrutar de vistas impresionantes y paisajes únicos que solo se pueden encontrar en esta parte de España.

Una vez que lleguemos al puerto de Tibi, tendremos una breve parada para descansar y recargar energías antes de regresar a Mutxamel. En el camino de regreso, pasaremos por Jijona, una hermosa ciudad que nos sorprenderá con sus encantos y su ambiente pintoresco.', N'https://www.google.com/maps/embed?pb=!1m40!1m12!1m3!1d99946.61962107246!2d-0.5791182969409748!3d38.479983623185014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m25!3e1!4m5!1s0xd623a0ebfe7166b%3A0xe9af1601cea1404!2sAyuntamiento%20de%20Mutxamel%2C%20Avenida%20Carlos%20Soler%2C%20Mutxamel!3m2!1d38.414558299999996!2d-0.4443603!4m5!1s0xd622dabe0eaa4ad%3A0x87398e576d3159da!2sPort%20de%20Tibi%2C%20CV-810!3m2!1d38.526885899999996!2d-0.5442275999999999!4m5!1s0xd622eecabac8539%3A0x5315d373465b8368!2sJijona!3m2!1d38.541041199999995!2d-0.506292!4m5!1s0xd623a0ebfe7166b%3A0xe9af1601cea1404!2sAyuntamiento%20de%20Mutxamel%2C%20Avinguda%20Carlos%20Soler%2C%20Mutxamel!3m2!1d38.414558299999996!2d-0.4443603!5e0!3m2!1ses!2ses!4v1682322079964!5m2!1ses!2ses')
INSERT [dbo].[EVENT] ([id_event], [id_brand], [event_description], [MapURL]) VALUES (2, 1, N'¡Prepárate para un emocionante recorrido en bicicleta a través de algunos de los paisajes más impresionantes de la provincia de Alicante! Nuestro evento de ciclismo comenzará en Agost, donde los participantes podrán registrarse y prepararse para el recorrido.
Una vez que lleguemos a Monforte del Cid, disfrutaremos de una parada para descansar, comer y beber antes de volver a Agost.', N'https://www.google.com/maps/embed?pb=!1m24!1m12!1m3!1d48492.19098975091!2d-0.7047647491223341!3d38.384866490099185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m9!3e1!4m3!3m2!1d38.4374798!2d-0.6393649!4m3!3m2!1d38.3828434!2d-0.7262238999999999!5e0!3m2!1ses!2ses!4v1682323541654!5m2!1ses!2ses')
INSERT [dbo].[EVENT] ([id_event], [id_brand], [event_description], [MapURL]) VALUES (3, 3, N'Esta ruta nos lleva desde la playa de Muchavista hasta Castalla, en pleno interior de la provincia. En la primera parte pedaleamos por zona urbanizada, conectando las poblaciones de Sant Joan d’Alacant y San Vicente del Raspeig por medio de un estupendo carril bici. Cerca de Agost, tomamos la Vía Verde del Maigmó por la que atravesamos tierras áridas y vamos ganando altura, sin apenas darnos cuenta, contemplando unas estupendas vistas de toda la costa hasta llegar a las faldas del Maigmó, el pulmón de Alicante. En la última parte pedaleamos por la Hoya de Castalla, en la que rodeados por sierras como la del Menejador, Peña Roja o Castalla, se alternan campos de cultivo con algunos bosques de pinos. Esta ruta puede plantearse también en combinación con las tres siguientes para realizar un viaje de varios días por la provincia.', N'https://www.google.com/maps/embed?pb=!1m46!1m12!1m3!1d99938.75193464279!2d-0.6360802467600343!3d38.48565751128282!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m31!3e1!4m5!1s0xd623a1e1e69bb85%3A0xd27bef449f184456!2sSan%20Juan%20de%20Alicante%2C%2003550%2C%20Alicante!3m2!1d38.4020456!2d-0.43602959999999996!4m5!1s0xd6239e54a9266c5%3A0xf84e8d887f9ecc21!2sSanta%20Faz%2C%20Alicante!3m2!1d38.389949699999995!2d-0.4435629!4m5!1s0xd6234073bc6dced%3A0x2428cb56fa0c4878!2sSan%20Vicente%20del%20Raspeig%2C%20Alicante!3m2!1d38.3964181!2d-0.5248710999999999!4m5!1s0xd63ccff869035fd%3A0xa8483f397e04afcc!2sAgost%2C%2003698%2C%20Alicante!3m2!1d38.4372517!2d-0.6381854!4m5!1s0xd63d4238fb8ac89%3A0xf6bfd3fe72e9982f!2sCastalla%2C%2003420%2C%20Alicante!3m2!1d38.5934127!2d-0.6725355!5e0!3m2!1ses!2ses!4v1682323963663!5m2!1ses!2ses')
INSERT [dbo].[EVENT] ([id_event], [id_brand], [event_description], [MapURL]) VALUES (4, 4, N'Quedada para todas las edades, para pasar una mañana agradable y disfrutar del buen tiempo que nos acompaña estos días. 

Una gran oportunidad para hacer una ruta turística por la playa sin la preocupación de que los coches tengan que esquivarte ya que cortaremos la cuidad para vosotros.', N'https://www.google.com/maps/embed?pb=!1m38!1m12!1m3!1d50018.54881729984!2d-0.4392189280317714!3d38.41468329090505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m23!3e1!4m5!1s0xd623b85480664a1%3A0x3bd3be681e37e76a!2sIlleta%20dels%20Banyets%2C%20Partida%20Almadrava%2C%2003560%20El%20Campello%2C%20Alicante!3m2!1d38.4322635!2d-0.3819565!4m3!3m2!1d38.414694399999995!2d-0.39318539999999996!4m3!3m2!1d38.4066263!2d-0.40267329999999996!4m3!3m2!1d38.361078!2d-0.41162669999999996!4m3!3m2!1d38.355449799999995!2d-0.41142979999999996!5e0!3m2!1ses!2ses!4v1682324135972!5m2!1ses!2ses')
INSERT [dbo].[EVENT] ([id_event], [id_brand], [event_description], [MapURL]) VALUES (5, 4, N'ddd', N'https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d25010.670581328413!2d-0.44178565000000003!3d38.4106496!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ses!4v1685870473303!5m2!1ses!2ses')
SET IDENTITY_INSERT [dbo].[EVENT] OFF
GO
SET IDENTITY_INSERT [dbo].[PERMISSION] ON 

INSERT [dbo].[PERMISSION] ([ID], [Name]) VALUES (1, N'Usuario')
INSERT [dbo].[PERMISSION] ([ID], [Name]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[PERMISSION] OFF
GO
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'aa', N'961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506', N'aa', N'PEepe', N'aaaaaa', 11, N'11', N'T', 1, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'aaron', N'admin', N'54208529J', N'Aaron', N'Leon', 20, N'666666666', N'f', 2, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'AaronLeon', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'56372837H', N'AaronLeon', N'Leonss', 23, N'777777777', N'T', 2, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'Ainhoa', N'Ainhoa', N'65899877L', N'Ainhoa', N'Amorós Sánchez', 25, N'655888997', N'f', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'andreac', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'67676767J', N'andreac', N'c', 20, N'ee', N'T', 1, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'clase', N'af197166e4f59bf696fcf42a1d0a18df5dd752ca812c06a96468e51c915622d0', N'', N'clase', N'', 0, N'', N'T', 1, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'David', N'David', N'99499117M', N'David', N'Zapata Romero', 44, N'688110002', N'T', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'Holas', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'22222333e', N'ww', N'www', 23, N'222222222', N'T', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'javi', N'admin', N'53239662K', N'Javi', N'Sagredo', 31, N'677777777', N'f', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'JuanAlberto', N'contrasena', N'76869273S', N'Juan', N'Al', 23, N'263925173', N'f', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'Lucas', N'Lucas', N'88459877H', N'Lucas', N'Villaverde González', 33, N'666177889', N'f', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'Maria', N'Maria', N'33658877K', N'María', N'Hidalgo Hernández', 20, N'698777445', N'f', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'MartinA', N'123', N'67652456K', N'Martin', N'Apellido', 40, N'654565432', N'f', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'perrozanche', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'40502012Q', N'Pedrito', N'Sanches', 45, N'694200000', N'T', 1, N'zavxnaaeczjiaayarr@bbitq.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'prueba', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'67676767J', N'prueba', N'prueba', 20, N'666666666', N'F', 1, N'aaronclase24@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'Rodolfo', N'Rodolfo', N'11299117J', N'Rodolfo', N'Blasco Miller', 56, N'633779254', N'f', 1, NULL)
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'test', N'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', N'test', N'test', N'test', 0, N'test', N'T', 1, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'test1', N'1b4f0e9851971998e732078544c96b36c3d01cedf7caa332359d6f1d83567014', N'test1', N'test1', N'test1', 0, N'test1', N'T', 1, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'test2', N'60303ae22b998861bce3b28f33eec1be758a213c86c93c076dbe9f558c11c752', N'test2', N'test2', N'test2', 0, N'test2', N'T', 1, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'test3', N'fd61a03af4f77d870fc21e05e7e80678095c92d808cfb3b5c279ee04c74aca13', N'test3', N'test3', N'test3', 0, N'test3', N'T', 1, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'test4', N'a4e624d686e03ed2767c0abd85c14426b0b1157d2ce81d27bb4fe4f6f01d688a', N'test4', N'test4', N'test4', 0, N'test4', N'T', 1, N'test4')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'testDocumentacion', N'f4e2ac0adc6be7c88b3fe4d4d39ac6f1dd1617f0271aa1e98d28f853a0df6810', N'65383838P', N'testDocumentacion', N'testDocumentacion', 20, N'777777777', N'T', 1, N'testgaminguser@gmail.com')
INSERT [dbo].[USER] ([Username], [Password], [DNI], [Name], [Surnames], [Age], [Phone], [Verified], [Id_Permission], [Email]) VALUES (N'testeos', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'73765464v', N'hoka', N'ebdb', 23, N'4444444', N'T', 1, NULL)
GO
ALTER TABLE [dbo].[BIKE]  WITH CHECK ADD FOREIGN KEY([ID_Brand])
REFERENCES [dbo].[BRAND] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BRAND_COMPONENT]  WITH CHECK ADD FOREIGN KEY([id_brand])
REFERENCES [dbo].[BRAND] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BRAND_COMPONENT]  WITH CHECK ADD FOREIGN KEY([id_Component])
REFERENCES [dbo].[COMPONENT] ([id_Component])
GO
ALTER TABLE [dbo].[CITATION]  WITH CHECK ADD FOREIGN KEY([ID_Brand])
REFERENCES [dbo].[BRAND] ([ID])
GO
ALTER TABLE [dbo].[CITATION]  WITH CHECK ADD FOREIGN KEY([UsernameClient])
REFERENCES [dbo].[USER] ([Username])
GO
ALTER TABLE [dbo].[EVENT]  WITH CHECK ADD FOREIGN KEY([id_brand])
REFERENCES [dbo].[BRAND] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD FOREIGN KEY([Id_Permission])
REFERENCES [dbo].[PERMISSION] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[BikeByBrand]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BikeByBrand]
AS
BEGIN

   SELECT BIKE.Name,BRAND.Name
   FROM BIKE,BRAND
   WHERE BIKE.ID_Brand = BRAND.ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAppointment]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAppointment] (@idCita as int)
AS
BEGIN
--COMENTARIOS
DELETE FROM CITATION 
WHERE CITATION.IDCitation = @idCita
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteUser]
@Username int
as
delete from [dbo].[USER] where [Username]=@Username
GO
/****** Object:  StoredProcedure [dbo].[GetAppointments]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAppointments]
AS 
BEGIN

	SELECT [IDCitation],[DateCitation],[DateRequest],UsernameClient,[StatusCitation],brand.name,[Description]
	FROM CITATION,BRAND
	WHERE CITATION.ID_Brand = BRAND.ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetBrandById]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBrandById] (@idBrand as int)
AS
BEGIN

SELECT * 
FROM BRAND
where @idBrand = BRAND.ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetBrands]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetBrands]
AS
BEGIN

SELECT BRAND.ID, BRAND.Name FROM BRAND
END
GO
/****** Object:  StoredProcedure [dbo].[GetCitationById]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCitationById]
    @Id int
AS
BEGIN
    SELECT CITATION.IDCitation, CITATION.DateCitation, CITATION.DateRequest, CITATION.UsernameClient, CITATION.StatusCitation, BRAND.Name, CITATION.Description
    FROM CITATION, BRAND
    WHERE IDCitation = @Id
	AND CITATION.ID_Brand = BRAND.ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetCitationId]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCitationId]
    @inputName varchar(max)
AS
BEGIN
    SELECT top 1 IDCitation
    FROM CITATION
    WHERE UsernameClient = @inputName
	order by daterequest desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetVerified]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVerified]
    @username nvarchar(50)
AS
BEGIN
    SELECT Verified
    FROM [User]
    WHERE username = @username
END
GO
/****** Object:  StoredProcedure [dbo].[NewAppointment]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NewAppointment] (@Datecitation as datetime,@Daterequest as datetime, @Username as varchar(max),@Status as varchar(max),@Idbrand as int,@Description as varchar(max))
as 
begin

	Insert into CITATION
	VaLUES
	(@Datecitation,@Daterequest,@Username,@Status,@Idbrand,@Description)
end
GO
/****** Object:  StoredProcedure [dbo].[NewBike]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewBike] (@name as varchar(max), @brand as int, @bike_image as varchar(max), @description as varchar(max))
AS
BEGIN

INSERT INTO BIKE
VALUES
(@name,@brand,@bike_image,@description)
END
GO
/****** Object:  StoredProcedure [dbo].[NewComponent]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewComponent] (@nombreComponente as varchar(max),@idmarca as int,@rutaImagen as varchar(max),@description as varchar(max))
AS
BEGIN

DECLARE @idcomponent INT

INSERT INTO COMPONENT
VALUES
(@nombreComponente,@rutaImagen,@description)

SELECT @idcomponent = COMPONENT.id_Component
FROM COMPONENT
WHERE name_Coponent = @nombrecomponente

INSERT INTO BRAND_COMPONENT
VALUES
(@idcomponent,@idmarca)

END
GO
/****** Object:  StoredProcedure [dbo].[NewEvent]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NewEvent] (@Brand as int, @Description as varchar(max), @Url as varchar(max))
AS
BEGIN

INSERT INTO [EVENT]
VALUES
(@Brand, @Description, @Url)
END
GO
/****** Object:  StoredProcedure [dbo].[NewUser]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NewUser]
@Username varchar (max),
@Password varchar (max),
@DNI varchar (max),
@Name varchar (max),
@Surnames varchar (max),
@Age int,
@Phone varchar (max),
@Verified varchar (max),
@Id_Permission tinyint,
@Email varchar (255)
as
insert into [dbo].[USER] values (@Username,@Password,@DNI,@Name,@Surnames,@Age,@Phone,@Verified,@Id_Permission, @Email)

GO
/****** Object:  StoredProcedure [dbo].[SelectAllBikes]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SelectAllBikes]
AS 
BEGIN
SELECT * FROM BIKE
end
GO
/****** Object:  StoredProcedure [dbo].[SelectAllComponents]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllComponents]
AS
BEGIN

    SELECT COMPONENT.id_Component,COMPONENT.name_Coponent,BRAND.Name,BRAND.ID,COMPONENT.component_image,COMPONENT.description
    FROM COMPONENT,BRAND,BRAND_COMPONENT
    WHERE COMPONENT.id_Component = BRAND_COMPONENT.id_Component
    AND BRAND_COMPONENT.id_brand = BRAND.ID

END
GO
/****** Object:  StoredProcedure [dbo].[SelectBrandComponent]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SelectBrandComponent] (@brandId as int)
AS
BEGIN

    SELECT COMPONENT.id_Component,COMPONENT.name_Coponent,BRAND.Name,BRAND.ID,COMPONENT.component_image,COMPONENT.description
    FROM COMPONENT,BRAND,BRAND_COMPONENT
    WHERE COMPONENT.id_Component = BRAND_COMPONENT.id_Component
    AND BRAND_COMPONENT.id_brand = BRAND.ID
	AND BRAND.ID = @brandId

END
GO
/****** Object:  StoredProcedure [dbo].[ShowEvents]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowEvents]
AS
BEGIN

    SELECT event.id_event,event.event_description,BRAND.Name,EVENT.MapURL
    FROM BRAND,event
    WHERE event.id_brand = BRAND.ID

END
GO
/****** Object:  StoredProcedure [dbo].[ShowUser]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ShowUser] (@nombreusuario varchar(max))
as
SELECT [Username]
      ,[Password]
      ,[DNI]
      ,[Name]
      ,[Surnames]
      ,[Age]
      ,[Phone]
      ,[Verified]
      ,[Id_Permission]
	  ,[Email]
  FROM [dbo].[USER]
  Where @nombreusuario = Username
GO
/****** Object:  StoredProcedure [dbo].[ShowUsers]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ShowUsers]
as
SELECT [Username]
      ,[Password]
      ,[DNI]
      ,[Name]
      ,[Surnames]
      ,[Age]
      ,[Phone]
      ,[Verified]
      ,[Id_Permission]
	  ,[Email]
  FROM [dbo].[USER]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
    @UserName VARCHAR(max),
    @Dni VARCHAR(max),
    @Name VARCHAR(max),
    @Surnames VARCHAR(max),
    @Age INT,
    @Phone VARCHAR(max),
    @Verified varchar(1),
    @Role tinyint,
    @UserEmail VARCHAR(max)
AS
BEGIN
    UPDATE [USER]
    SET
        Dni = @Dni,
        [Name] = @Name,
        Surnames =@Surnames,
        Age = @Age,
        Phone = @Phone,
        Verified = @Verified,
        [Id_Permission] =@Role,
        Email = @UserEmail
    WHERE Username = @UserName;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserVerificationStatus]    Script Date: 07/06/2023 11:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserVerificationStatus]
    @username VARCHAR(50)
AS
BEGIN
    UPDATE [User]
    SET Verified = 'T'
    WHERE Username = @username
END
GO
