--SENTENCIAS PARA ELIMINAR LA BASE DE DATOS
USE master;
GO
DROP DATABASE banco;
GO
-------------------------------------------



--COMIENZA CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE banco;
GO
USE banco;
GO

--CREACIÓN DE TABLAS
CREATE TABLE rol(
  idRol INT IDENTITY(1,1),
  nombre VARCHAR(45) NOT NULL,
CONSTRAINT pk_rol PRIMARY KEY(idRol));
GO

CREATE TABLE usuario(
  idUsuario INT IDENTITY(1,1),
  correoElectronico VARCHAR(90) NOT NULL,
  contrasena VARCHAR(22)NOT NULL,
  idRol INT NOT NULL,
CONSTRAINT pk_usuario PRIMARY KEY(idUsuario),
CONSTRAINT fk_usuario_rol FOREIGN KEY(idRol)REFERENCES rol(idRol));
GO

CREATE TABLE ejecutivo(
  idEjecutivo INT IDENTITY(1,1),
  nombre VARCHAR(45)NOT NULL,
  apellidos VARCHAR(60)NOT NULL,
  fechaNacimiento DATE NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(10) NOT NULL,
  sueldo MONEY NOT NULL CHECK(sueldo>=0),
  nss VARCHAR(20)NOT NULL,
  rfc VARCHAR(25)NOT NULL,
  acceso BIT DEFAULT 1,
  idUsuario INT NOT NULL,
CONSTRAINT pk_ejecutivo PRIMARY KEY(idEjecutivo),
CONSTRAINT fk_ejecutivo_usuario FOREIGN KEY(idUsuario)REFERENCES usuario(idUsuario));
GO

CREATE TABLE cliente(
  idCliente INT IDENTITY(1,1),
  nombre VARCHAR(45)NOT NULL,
  apellidos VARCHAR(60)NOT NULL,
  fechaNacimiento DATE NOT NULL,
  direccion VARCHAR(200),
  telefono VARCHAR(10),
  acceso BIT DEFAULT 1,
  idUsuario INT,
CONSTRAINT pk_cliente PRIMARY KEY(idCliente),
CONSTRAINT fk_cliente_usuario FOREIGN KEY(idUsuario)REFERENCES usuario(idUsuario));
GO

CREATE TABLE tipoCuenta(
  idTipoCuenta INT IDENTITY(1,1),
  nombre VARCHAR(60)NOT NULL,
CONSTRAINT pk_tipoCuenta PRIMARY KEY(idTipoCuenta));
GO

CREATE TABLE cuenta(
  idCuenta INT IDENTITY(1,1),
  fechaCreacion DATETIME DEFAULT GETDATE(),
  saldo MONEY NOT NULL CHECK(saldo>=0),
  idCliente INT NOT NULL,
  idTipoCuenta INT NOT NULL,
CONSTRAINT pk_cuenta PRIMARY KEY(idCuenta), 
CONSTRAINT fk_cuenta_cliente FOREIGN KEY(idCliente)REFERENCES cliente(idCliente),
CONSTRAINT fk_cuenta_tipoCuenta FOREIGN KEY(idTipoCuenta)REFERENCES tipoCuenta(idTipoCuenta));
GO

--INSERCCIÓN DE DATOS
INSERT INTO rol(nombre)VALUES('SUPERUSUARIO');
INSERT INTO rol(nombre)VALUES('EJECUTIVO');
INSERT INTO rol(nombre)VALUES('CLIENTE');
GO

INSERT INTO usuario(correoElectronico,contrasena,idRol)VALUES('sa@gmail.com','root',1);
INSERT INTO usuario(correoElectronico,contrasena,idRol)VALUES('francisco@gmail.com','abcfrancisco',2);
INSERT INTO usuario(correoElectronico,contrasena,idRol)VALUES('maria@gmail.com','abcmaria',2);
INSERT INTO usuario(correoElectronico,contrasena,idRol)VALUES('cliente1@gmail.com','abc123cliente1',3);
INSERT INTO usuario(correoElectronico,contrasena,idRol)VALUES('cliente2@gmail.com','abc123cliente2',3);
INSERT INTO usuario(correoElectronico,contrasena,idRol)VALUES('cliente3@gmail.com','abc123cliente3',3);
GO

INSERT INTO ejecutivo(nombre,apellidos,fechaNacimiento,direccion,telefono,sueldo,nss,rfc,idUsuario)
VALUES('Francisco Javier','Garduño Estrada','1997-06-26','Flores Magón No.37, Josefa Ortiz, Jiutepec, Mor. C.P. 62570','7771550701',3500,'IMSS-2017-G','SHCP-2017-GAEF',2);
INSERT INTO ejecutivo(nombre,apellidos,fechaNacimiento,direccion,telefono,sueldo,nss,rfc,idUsuario)
VALUES('María Arianet','Romero Orosco','1997-05-20','Revolución No.123, Lomas del pedregal, Jiutpec, Mor. C.P. 62575','7774112345',3500,'IMSS-2017-R','SHCP-2017-ROOM',3);
GO

INSERT INTO cliente(nombre,apellidos,fechaNacimiento,direccion,telefono,idUsuario)
VALUES('Luis','Arenas Silva','1996-11-20','Constitución No.5, Centro Jiutepec, Jiutepec, Mor. C.P. 62000','7772345678',4);
INSERT INTO cliente(nombre,apellidos,fechaNacimiento,direccion,telefono,idUsuario)
VALUES('María Isabel','Sánchez Jaimes','1996-11-10','28 Octubre No.55, Otilio Montaño, Jiutepec, Mor. C.P. 62500','7771234567',5);
INSERT INTO cliente(nombre,apellidos,fechaNacimiento,direccion,telefono,idUsuario)
VALUES('Evelyn','Sánchez Márquez','1997-06-20','Paz No.1, Antonio Barona, Cuernavaca, Mor. C.P. 62100','7776781234',6);
GO

INSERT INTO tipoCuenta(nombre)VALUES('Tarjeta de crédito');
INSERT INTO tipoCuenta(nombre)VALUES('Tarjeta de débito');
GO

INSERT INTO cuenta(saldo,idCliente,idTipoCuenta)VALUES(10000,1,2);
INSERT INTO cuenta(saldo,idCliente,idTipoCuenta)VALUES(5000,1,1);
INSERT INTO cuenta(saldo,idCliente,idTipoCuenta)VALUES(3000.60,2,1);
INSERT INTO cuenta(saldo,idCliente,idTipoCuenta)VALUES(20000,2,2);
INSERT INTO cuenta(saldo,idCliente,idTipoCuenta)VALUES(300,3,1);
INSERT INTO cuenta(saldo,idCliente,idTipoCuenta)VALUES(12000.50,3,1);
GO

CREATE PROCEDURE pa_mostrarUsuarios
AS
BEGIN
  SELECT idUsuario,correoElectronico,contrasena,u.idRol AS idRol,nombre FROM usuario AS u JOIN rol AS r ON u.idRol=r.idRol;
END;
GO

CREATE PROCEDURE pa_mostrarCliente
@idUsuario INT
AS
BEGIN
   SELECT c.idCliente AS idCliente,c.nombre,c.apellidos,CONVERT(VARCHAR(10),c.fechaNacimiento,103)AS fechaNacimiento,c.direccion,c.telefono,u.correoElectronico,CONVERT(DECIMAL(18,2),SUM(saldo)) AS totalDinero,COUNT(*) AS numeroCuentas FROM cliente AS C
   INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario INNER JOIN cuenta AS cu ON c.idCliente=cu.idCliente GROUP BY c.idCliente,
   c.nombre,c.apellidos,c.fechaNacimiento,c.direccion,c.telefono,u.correoElectronico,c.idUsuario HAVING c.idUsuario=@idUsuario;
END;
GO

CREATE PROCEDURE pa_mostrarCuentas
@idUsuario INT
AS
BEGIN
  SELECT cu.idCuenta,CONVERT(VARCHAR(10),cu.fechaCreacion,103)AS fechaCreacion,CONVERT(DECIMAL(18,2),saldo,2)AS saldo,t.nombre AS tipoCuenta FROM cuenta AS cu INNER JOIN cliente AS c ON cu.idCliente=c.idCliente
  INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario INNER JOIN tipoCuenta AS t ON cu.idTipoCuenta=t.idTipoCuenta WHERE u.idUsuario=@idUsuario;
END;
GO

CREATE PROCEDURE pa_mostrarEjecutivo
@idUsuario INT
AS
BEGIN
   SELECT e.idEjecutivo,e.nombre,e.apellidos,CONVERT(VARCHAR(10),e.fechaNacimiento,103)AS fechaNacimiento,e.direccion,e.telefono,
   CONVERT(DECIMAL(18,2),e.sueldo)AS sueldo,e.nss,e.rfc,u.correoElectronico FROM ejecutivo AS e INNER JOIN usuario AS u ON e.idUsuario=u.idUsuario
   WHERE e.idUsuario=@idUsuario;
END;
GO

CREATE PROCEDURE pa_registrarCliente
@correo VARCHAR(120),
@contrasena VARCHAR(22),
@nombre VARCHAR(45),
@apellidos VARCHAR(60),
@fechaNacimiento DATE,
@direccion VARCHAR(200),
@telefono VARCHAR(10),
@saldo MONEY,
@idTipoCuenta INT
AS
BEGIN
    DECLARE @idUsuario INT;
	DECLARE @idCliente INT;
    --PRIMERO INSERTAMOS EN USUARIO
	INSERT INTO usuario(correoElectronico,contrasena,idRol)VALUES(@correo,@contrasena,3);
	SELECT @idUsuario=@@IDENTITY FROM usuario;
	--INSERTAMOS EL CLIENTE
	INSERT INTO cliente(nombre,apellidos,fechaNacimiento,direccion,telefono,idUsuario)
	VALUES(@nombre,@apellidos,@fechaNacimiento,@direccion,@telefono,@idUsuario);
	SELECT @idCliente=@@IDENTITY FROM cliente;
	--INSERTAMOS SU PRIMERA CUENTA
	INSERT INTO cuenta(saldo,idCliente,idTipoCuenta)VALUES(@saldo,@idCliente,@idTipoCuenta);
END;
GO

CREATE PROCEDURE pa_mostrarTiposCuentas
AS
BEGIN
   SELECT idTipoCuenta,nombre FROM tipoCuenta;
END;
GO

CREATE PROCEDURE pa_mostrarClienteModificar
@idCliente INT
AS
BEGIN
   SELECT c.idCliente,c.nombre,c.apellidos,c.fechaNacimiento,
   c.direccion,c.telefono,c.acceso,u.correoElectronico FROM cliente AS c INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario
   WHERE c.idCliente=@idCliente;
END;
GO

CREATE PROCEDURE pa_buscarCliente
@criterio VARCHAR(100)
AS
BEGIN 
   SELECT c.idCliente,c.nombre,c.apellidos,CONVERT(VARCHAR(10),c.fechaNacimiento,103)AS fechaNacimiento,u.correoElectronico
   FROM cliente AS C INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario WHERE c.nombre LIKE '%'+@criterio+'%' OR c.apellidos LIKE '%'+@criterio+'%';
END;
GO

CREATE PROCEDURE pa_modificarCliente
@correo VARCHAR(120),
@nombre VARCHAR(45),
@apellidos VARCHAR(60),
@fechaNacimiento DATE,
@direccion VARCHAR(200),
@telefono VARCHAR(10),
@idCliente INT
AS
BEGIN
   DECLARE @idUsuario INT;
   SELECT @idUsuario=c.idUsuario FROM cliente AS c INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario WHERE c.idCliente=@idCliente;
   UPDATE usuario SET correoElectronico=@correo WHERE idUsuario=@idUsuario;
   UPDATE cliente SET nombre=@nombre,apellidos=@apellidos,fechaNacimiento=@fechaNacimiento,direccion=@direccion,telefono=@telefono WHERE idCliente=@idCliente;
END;
GO

CREATE PROCEDURE pa_mostrarCuentasCliente
@idCliente INT
AS
BEGIN 
   SELECT cu.idCuenta,CONVERT(VARCHAR(10),cu.fechaCreacion,103)AS fechaCreacion,CONVERT(DECIMAL(18,2),saldo,2)AS saldo,t.nombre AS tipoCuenta FROM cuenta AS cu INNER JOIN cliente AS c ON cu.idCliente=c.idCliente
  INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario INNER JOIN tipoCuenta AS t ON cu.idTipoCuenta=t.idTipoCuenta WHERE c.idCliente=@idCliente;
END;
GO

CREATE PROCEDURE pa_eliminarCuenta
@idCuenta INT
AS
BEGIN
   DELETE FROM cuenta WHERE idCuenta=@idCuenta;
END;
GO

CREATE PROCEDURE pa_registrarNuevaCuenta
@saldo MONEY,
@idTipoCuenta INT,
@idCliente INT
AS
BEGIN
  --INSERTAMOS SU PRIMERA CUENTA
  INSERT INTO cuenta(saldo,idCliente,idTipoCuenta)VALUES(@saldo,@idCliente,@idTipoCuenta);
END;
GO

CREATE PROCEDURE pa_registarEjecutivo
@nombre VARCHAR(45),
@apellidos VARCHAR(60),
@fechaNacimiento DATE,
@direccion VARCHAR(200),
@telefono VARCHAR(10),
@sueldo MONEY,
@nss VARCHAR(25),
@rfc VARCHAR(20),
@correoElectronico VARCHAR(100),
@contrasena VARCHAR(22)
AS
BEGIN
  --INSERTAMOS SU USUARIO PRIMERO 
  DECLARE @idUsuario INT;
  INSERT INTO usuario(correoElectronico,contrasena,idRol)VALUES(@correoElectronico,@contrasena,2);
  SELECT @idUsuario=@@IDENTITY;
  --INSERTAMOS EL EJECUTIVO
  INSERT INTO ejecutivo(nombre,apellidos,fechaNacimiento,direccion,telefono,sueldo,nss,rfc,idUsuario)
  VALUES(@nombre,@apellidos,@fechaNacimiento,@direccion,@telefono,@sueldo,@nss,@rfc,@idUsuario);
END;
GO

CREATE PROCEDURE pa_buscarEjecutivo
@criterio VARCHAR(100)
AS
BEGIN 
   SELECT c.idEjecutivo,c.nombre,c.apellidos,CONVERT(VARCHAR(10),c.fechaNacimiento,103)AS fechaNacimiento,u.correoElectronico
   FROM ejecutivo AS c INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario WHERE c.nombre LIKE '%'+@criterio+'%' OR c.apellidos LIKE '%'+@criterio+'%';
END;
GO

CREATE PROCEDURE pa_mostrarEjecutivoModificar
@idEjecutivo INT
AS
BEGIN
   SELECT e.idEjecutivo,e.nombre,e.apellidos,e.fechaNacimiento,e.direccion,e.telefono,
   CONVERT(DECIMAL(18,2),e.sueldo)AS sueldo,e.nss,e.rfc,u.correoElectronico FROM ejecutivo AS e INNER JOIN usuario AS u ON e.idUsuario=u.idUsuario
   WHERE e.idEjecutivo=@idEjecutivo;
END;
GO

CREATE PROCEDURE pa_modificarEjecutivo
@nombre VARCHAR(45),
@apellidos VARCHAR(60),
@fechaNacimiento DATE,
@direccion VARCHAR(200),
@telefono VARCHAR(10),
@sueldo MONEY,
@nss VARCHAR(25),
@rfc VARCHAR(20),
@correoElectronico VARCHAR(100),
@idEjecutivo INT
AS
BEGIN
   DECLARE @idUsuario INT;
   SELECT @idUsuario=c.idUsuario FROM ejecutivo AS c INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario WHERE c.idEjecutivo=@idEjecutivo;
   UPDATE usuario SET correoElectronico=@correoElectronico WHERE idUsuario=@idUsuario;
   UPDATE ejecutivo SET nombre=@nombre,apellidos=@apellidos,fechaNacimiento=@fechaNacimiento,direccion=@direccion,telefono=@telefono,sueldo=@sueldo,
   nss=@nss,rfc=@rfc WHERE idEjecutivo=@idEjecutivo;
END;
GO

CREATE PROCEDURE pa_eliminarEjecutivo
@idEjecutivo INT
AS
BEGIN
   DECLARE @idUsuario INT;
   SELECT @idUsuario=u.idUsuario FROM ejecutivo AS c INNER JOIN usuario AS u ON c.idUsuario=u.idUsuario;
   --ELIMINAR AL EJECUTIVO
   DELETE FROM ejecutivo WHERE idEjecutivo=@idEjecutivo;
   --ELIMINAR AL USUARIO
   DELETE FROM usuario WHERE idUsuario=@idUsuario;
END;
GO



SELECT * FROM rol;
SELECT * FROM usuario;
SELECT * FROM ejecutivo;
SELECT * FROM cliente;
SELECT * FROM cuenta;
SELECT * FROM tipoCuenta;
