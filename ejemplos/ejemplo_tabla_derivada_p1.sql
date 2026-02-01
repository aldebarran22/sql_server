CREATE TABLE personaje
( id       INT
, nombre   VARCHAR(10)
, provincia INT
);
GO
 
INSERT INTO personaje
( id
, nombre
, provincia
)
VALUES
(1, 'Ana', 1),
(2, 'Jose', 1),
(3, 'Pedro', 2),
(4, 'Pilar', 2),
(5, 'Vero', 1),
(6, 'Alba', 3),
(7, 'Ricar', 3),
(8, 'Fred', 4);
GO
 
CREATE TABLE provincia
( id    INT
, descripcion  VARCHAR(20)
);
GO
 
INSERT INTO provincia
(id, descripcion)
values
(1,'Asturias'),
(2,'Madrid'),
(3,'Valencia'),
(4,'Murcia'),
(5,'Cádiz');
GO