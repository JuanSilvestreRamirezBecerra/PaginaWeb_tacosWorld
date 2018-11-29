
../*AUTOR: JUAN SILVESTRE RAMIREZ BECERRA
COLABORACION:JOSE MARTIN RUIZ COSS
			 ANGEL CHRISTIAN ALVAREZ TRUJILLO
MATERIA:PAGINAS WEB
*/

/***************CREACION BASE DE DATOS**********************/
CREATE DATABASE TACOSWORL;
USE TACOSWORL;

/***************  CREACION DE TABLAS  **********************/
CREATE TABLE USUARIO(
ID_USUARIO INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO VARCHAR(50) NOT NULL,
CORREO VARCHAR(30) NOT NULL,
CONTRASEÑA VARCHAR(20)NOT NULL,
TELEFONO VARCHAR(20)NULL,
CALLE VARCHAR(50)NULL,
CODIGO_POSTAL INT NULL,
LOCALIDAD VARCHAR(40)NULL,
ROL VARCHAR(30) NOT NULL
);

CREATE TABLE TAQUERIA(
ID_TAQUERIA INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ESTATUSBT BIT NOT NULL,
TELEFONO VARCHAR(20) NOT NULL,
NOMBRE VARCHAR(50) NOT NULL,
CALLE VARCHAR(50) NOT NULL,
CODIGO_POSTAL INT NOT NULL,
LOCALIDAD VARCHAR(40) NOT NULL,
ALTITUD FLOAT(10,6) NULL,
LATITUD FLOAT(10,6)  NULL,
ID_USUARIO INT NOT NULL,
ESTATUS_SUCURSAL BIT NOT NULL);

CREATE TABLE PRODUCTO(
ID_PRODUCTO INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
TIPO VARCHAR(30) NOT NULL,
NOMBRE VARCHAR(50) NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL,
PRECIO FLOAT NOT NULL,
ESTATUS BIT NOT NULL
);

CREATE TABLE PEDIDOS(
ID_PEDIDOS INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ID_TAQUERIA INT NOT NULL,
ID_USUARIO INT NOT NULL,
ID_PRODUCTO INT NOT NULL,
CANTIDAD INT NOT NULL,
OBSERVACION VARCHAR(100),
ESTATUS BIT NOT NULL
);

CREATE TABLE PROMOCION(
ID_PROMOCION INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ID_TAQUERIA INT NOT NULL,
FECHAINI DATE NOT NULL,
FECHAFIN DATE NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL,
IMAGEN BLOB
);

CREATE TABLE BOLSA_TRABAJO(
ID_BOLSA INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ID_TAQUERIA INT NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL,
SUELDO FLOAT NULL
);

CREATE TABLE COMENTARIOS(
ID_COMENTARIO INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ID_TAQUERIA INT NOT NULL,
ID_USUARIO INT NOT NULL,
COMENTARIO VARCHAR(100) NULL,
FECHA DATE NOT NULL 
);

/***************CREACION DE LLAVES FORANEAS**********************/
ALTER TABLE TAQUERIA ADD FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO);
ALTER TABLE PEDIDOS ADD FOREIGN KEY(ID_TAQUERIA) REFERENCES TAQUERIA(ID_TAQUERIA);
ALTER TABLE PEDIDOS ADD FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO);
ALTER TABLE PEDIDOS ADD FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO);
ALTER TABLE PROMOCION ADD FOREIGN KEY(ID_TAQUERIA) REFERENCES TAQUERIA(ID_TAQUERIA);
ALTER TABLE COMENTARIOS ADD FOREIGN KEY(ID_TAQUERIA) REFERENCES TAQUERIA(ID_TAQUERIA);
ALTER TABLE COMENTARIOS ADD FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO);
ALTER TABLE BOLSA_TRABAJO ADD FOREIGN KEY(ID_TAQUERIA) REFERENCES TAQUERIA(ID_TAQUERIA);

/***************    INSERCION DE DATOS    **********************/
/*TIPO DE ROLES: 1.-ADMINISTRADOR
				 2.-GERENTE
                 3.-USUARIO*/
INSERT INTO USUARIO(NOMBRE,APELLIDO,CORREO,CONTRASEÑA,TELEFONO,CALLE,CODIGO_POSTAL,LOCALIDAD,ROL) VALUES('JUAN SILVESTRE','RAMÍREZ BECERRA','trebol_silvestre14@hotmail.com','tacosZas123',4774408656,'BRICHO# 213',37108,'VALLE HERMOSO, LEON, GUANAJUATO','USUARIO');
INSERT INTO USUARIO(NOMBRE,APELLIDO,CORREO,CONTRASEÑA,TELEFONO,CALLE,CODIGO_POSTAL,LOCALIDAD,ROL) VALUES('JOSÉ MARTÍN','RUIZ COSS','MARTIN69ENCUATRO@gmail.com','ZaZatacos666',4733564189,'Anegeles# 235',35103,'LEON MODERNO, LEON, GUANAJUATO','GERENTE');
INSERT INTO USUARIO(NOMBRE,APELLIDO,CORREO,CONTRASEÑA,TELEFONO,CALLE,CODIGO_POSTAL,LOCALIDAD,ROL) VALUES('ANGEL CHRISTIAN','ALVAREZ TRUJILLO','trujillo69@hotmail.com','VamosTacos123',4772634859,'DONATELO# 313',39101,'LEON 1, LEON, GUANAJUATO','USUARIO');
INSERT INTO USUARIO(NOMBRE,APELLIDO,CORREO,CONTRASEÑA,TELEFONO,CALLE,CODIGO_POSTAL,LOCALIDAD,ROL) VALUES('ARGEL','ARENAS ORTIZ','ARENAS32@gmail.com','ZaZatacos666',4733564189,'Anegeles# 235',35103,'ECHEVESTE, LEON, GUANAJUATO','GERENTE');
INSERT INTO USUARIO(NOMBRE,APELLIDO,CORREO,CONTRASEÑA,TELEFONO,CALLE,CODIGO_POSTAL,LOCALIDAD,ROL) VALUES('EL ROBER','EL ENGAÑAO','VEN4Y69@gmail.com','123',4733564189,'SOLAMA# 235',35103,'LA MISERIA, LEON, GUANAJUATO','GERENTE');
INSERT INTO USUARIO(NOMBRE,APELLIDO,CORREO,CONTRASEÑA,TELEFONO,CALLE,CODIGO_POSTAL,LOCALIDAD,ROL) VALUES('ÁNGELICA','GAUCIN','CAMINOSROMA@gmail.com','1234',4733564189,'ROMA# 234',35103,'Lusdunum Convenarum , ROMA','GERENTE');
INSERT INTO USUARIO(NOMBRE,APELLIDO,CORREO,CONTRASEÑA,TELEFONO,CALLE,CODIGO_POSTAL,LOCALIDAD,ROL) VALUES('ALBERTO','GONZALES ROCHA','ALBERTOROCH@gmail.com','DELTAZELTAOMEGA',4774851623,'COBRE# 124',35103,'ECHEVESTE , LEON, GUANAJUATO','ADMINISTRADOR');


INSERT INTO TAQUERIA(ESTATUSBT,TELEFONO,NOMBRE,CALLE,CODIGO_POSTAL,LOCALIDAD,ALTITUD,LATITUD,ID_USUARIO,ESTATUS_SUCURSAL) VALUES(1,4778956235,'Taqueria ricardo','Torneros de echeveste',37125,'Echeveste, LEON, GUANAJUATO',21.1028667,-101.6391852,2,1);
INSERT INTO TAQUERIA(ESTATUSBT,TELEFONO,NOMBRE,CALLE,CODIGO_POSTAL,LOCALIDAD,ALTITUD,LATITUD,ID_USUARIO,ESTATUS_SUCURSAL) VALUES(1,4775961248,'Taqueria los cuñados','Cedro',37125,'Vilas de San juan, LEON, GUANAJUATO',21.1174243, -101.6662155,4,1);
INSERT INTO TAQUERIA(ESTATUSBT,TELEFONO,NOMBRE,CALLE,CODIGO_POSTAL,LOCALIDAD,ALTITUD,LATITUD,ID_USUARIO,ESTATUS_SUCURSAL) VALUES(1,4778254896,'Taqueria los del leño','Cartoneros',37125,'Rivera de la presa, LEON, GUANAJUATO',21.1262745, -101.6799806,5,1);
INSERT INTO TAQUERIA(ESTATUSBT,TELEFONO,NOMBRE,CALLE,CODIGO_POSTAL,LOCALIDAD,ALTITUD,LATITUD,ID_USUARIO,ESTATUS_SUCURSAL) VALUES(1,4771234957,'Taqueria doña pelos','Ortigilla',37125,'Delta, LEON, GUANAJUATO',21.0939798, -101.6417581,6,1);

/*TIPO DE ALIMENTOS: BEBIDAS Y ALIMENTOS*/
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE BISTEC','TACO DE DOBLE TORTILLA DE MAIZ CON BISTEC DE RES',7,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE CHORIZO','TACO DE DOBLE TORTILLA DE MAIZ CON CHORIZO DE PUERCO',7,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE BUCHE','TACO DE DOBLE TORTILLA DE MAIZ CON BUCHE DE RES',7,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE PASTOR','TACO DE DOBLE TORTILLA DE MAIZ CON PASTOR DE TROMPO',7,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE BARBACOA','TACO DE DOBLE TORTILLA DE MAIZ CON BARBACOA',7,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE SUADERO','TACO DE DOBLE TORTILLA DE MAIZ CON SUADERO',7,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE CABEZA','TACO DE DOBLE TORTILLA DE MAIZ CON CABEZA',7,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE TRIPAS','TACO DE DOBLE TORTILLA DE MAIZ CON TRIPAS',9,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE PEPENA','TACO DE DOBLE TORTILLA DE MAIZ CON PEPENA',9,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE TUETANO','TACO DE DOBLE TORTILLA DE MAIZ CON TUETANO DE RES',9,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE ARRACHERA','TACO DE DOBLE TORTILLA DE MAIZ CON ARRACHERA',9,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE CHICHARRON','TACO DE DOBLE TORTILLA DE MAIZ CON CHICHARRON',9,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO MINEROS','TACO DE DOBLE TORTILLA DE MAIZ CON PASTA, TOCINO Y CARNE DE CERDO',9,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE ESCAMOLES','TACO DE DOBLE TORTILLA DE MAIZ CON HUEVA DE HORMIGAS',9,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('ALIMENTO','TACO DE PITO','TACO DE DOBLE TORTILLA DE MAIZ CON FLORES DE COLORIN GUISADA EN CALDILLO DE JITOMATE',10,1);
INSERT INTO PRODUCTO(TIPO,NOMBRE,DESCRIPCION,PRECIO,ESTATUS) VALUES('BEBIDA','COCA COLA','REFRESCO SABOR COLA DE 600ML',13.50,1);

/*************** CONSULTAR TABLAS DE LA BASE DE DATOS ***********/

SELECT * FROM BOLSA_TRABAJO;
SELECT * FROM PEDIDOS;
SELECT * FROM PRODUCTO;
SELECT * FROM PROMOCION;
SELECT * FROM TAQUERIA;
SELECT * FROM USUARIO;
/**************  PRUEBAS DE LA BASE DE DATOS TRANSACT   *********/
DROP DATABASE TACOSWORL;
