CREATE TABLE [Contenedores] (
  [idContenedor] integer PRIMARY KEY  IDENTITY(1,1),
  [nroContenedor] nvarchar(255),
  [descripcion] nvarchar(255),
  [estadoContenedor] nvarchar(255)
)
GO

CREATE TABLE [Unit] (
  [idUnit] integer  IDENTITY(1,1),
  [idTitulo] integer,
  [nroPrecinto] nvarchar(255),
  [nroPrecinto2] nvarchar(255),
  [nroPrecinto_N4] nvarchar(255),
  [nroPrecinto2_N4] nvarchar(255),
  [tipoCarga] integer,
  [idPortO] integer,
  [IdPortD] integer,
  [categoria] nvarchar(255),
  [dimension] integer,
  [idContenedor] integer,
  [idTransporte] integer,
  [idConductor] integer,
  [idVessel] integer,
  [idNaviera] integer,
  PRIMARY KEY ([idUnit],[idVessel],[idContenedor])
)
GO

CREATE TABLE [VesselVisit] (
  [idVessel] integer PRIMARY KEY  IDENTITY(1,1),
  [vesselVisit] nvarchar(255),
  [lineaOperadora] integer
)
GO

CREATE TABLE [Naviera] (
  [idNaviera] integer PRIMARY KEY  IDENTITY(1,1),
  [codigo] nvarchar(255),
  [nombre] nvarchar(255)
)
GO

CREATE TABLE [Transporte] (
  [idTransporte] integer PRIMARY KEY  IDENTITY(1,1),
  [tipoTransporte] nvarchar(255),
  [indicadorTransporte] nvarchar(255),
  [matriculaTransporte] nvarchar(20)
)
GO

CREATE TABLE [Puerto] (
  [idPuerto] integer PRIMARY KEY  IDENTITY(1,1),
  [codigo] nvarchar(255),
  [ciudad] nvarchar(255),
  [pais] nvarchar(255)
)
GO

CREATE TABLE [Conductor] (
  [idConductor] integer PRIMARY KEY IDENTITY(1,1),
  [nombre] nvarchar(255),
  [identidad] nvarchar(255),
  [nacionalidad] nvarchar(255),
  [observaciones] nvarchar(255)
)
GO

ALTER TABLE [VesselVisit] ADD FOREIGN KEY ([lineaOperadora]) REFERENCES [Naviera] ([idNaviera])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idPortO]) REFERENCES [Puerto] ([idPuerto])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([IdPortD]) REFERENCES [Puerto] ([idPuerto])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idContenedor]) REFERENCES [Contenedores] ([idContenedor])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idVessel]) REFERENCES [VesselVisit] ([idVessel])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idTransporte]) REFERENCES [Transporte] ([idTransporte])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idConductor]) REFERENCES [Conductor] ([idConductor])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idNaviera]) REFERENCES [Naviera] ([idNaviera])
GO
