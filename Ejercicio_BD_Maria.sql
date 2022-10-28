#DROP DATABASE ejercicio_BD
CREATE DATABASE ejercicio_BD;

USE ejercicio_BD;

CREATE TABLE propietarios(
	id_propietario INT AUTO_INCREMENT,
    nombre_propietario VARCHAR(100) NOT NULL,
    telefono_propietario VARCHAR(15) NOT NULL,
	PRIMARY KEY(id_propietario)
);

#El diagrama nos indica que la placa del vehiculo es la clave primaria, pero como no
#hay informacion sobre como es la placa, pongo el campo como tipo varchar(100) y no
#puedo hacerla auto incremental porque es un dato que no controlo
CREATE TABLE taxis(
	placa_vehiculo varchar(100),
    marca_vehiculo VARCHAR(100) NOT NULL,
    modelo_vehiculo VARCHAR(200) NOT NULL,
    id_fk_propietario INT,
	PRIMARY KEY(placa_vehiculo),
    FOREIGN KEY(id_fk_propietario) REFERENCES propietarios(id_propietario) ON DELETE SET NULL
);

CREATE TABLE conductores(
	id_conductor INT AUTO_INCREMENT,
    nombre_conductor VARCHAR(100) NOT NULL,
    telefono_conductor VARCHAR(15) NOT NULL,
    id_fk_taxi varchar(100) NOT NULL,
	PRIMARY KEY(id_conductor),
    FOREIGN KEY(id_fk_taxi) REFERENCES taxis(placa_vehiculo) ON UPDATE CASCADE
);

# Inserta 3 registros por tabla

INSERT INTO propietarios (nombre_propietario, telefono_propietario) VALUES("Paco", "123123123");
INSERT INTO propietarios (nombre_propietario, telefono_propietario) VALUES("Pedro", "111111111");
INSERT INTO propietarios (nombre_propietario, telefono_propietario) VALUES("Juan", "222222222");
SELECT * FROM propietarios;

INSERT INTO taxis (placa_vehiculo, marca_vehiculo, modelo_vehiculo, id_fk_propietario) VALUES("1", "ford", "1", 1);
INSERT INTO taxis (placa_vehiculo, marca_vehiculo, modelo_vehiculo, id_fk_propietario) VALUES("2", "ford", "2", 2);
INSERT INTO taxis (placa_vehiculo, marca_vehiculo, modelo_vehiculo, id_fk_propietario) VALUES("3", "BMW", "3", 3);
SELECT * FROM taxis;

INSERT INTO conductores (nombre_conductor, telefono_conductor, id_fk_taxi) VALUES("Manolo", "123123123", "1");
INSERT INTO conductores (nombre_conductor, telefono_conductor, id_fk_taxi) VALUES("Benito", "111111111", "2");
INSERT INTO conductores (nombre_conductor, telefono_conductor, id_fk_taxi) VALUES("Pili", "222222222", "3");
SELECT * FROM conductores;

#Actualiza el teléfono de un propietario filtrando por id
UPDATE propietarios SET telefono_propietario = '333333333' where id_propietario = 1;
SELECT * FROM propietarios;

#Prueba de que al borrar un propietario se pone a NULL la clave foranea en taxi
DELETE FROM propietarios WHERE id_propietario = 1;
SELECT * FROM propietarios;
SELECT * FROM taxis;

#Prueba de que al actualizar un taxi se actualiza la id que lo apunta
UPDATE taxis SET placa_vehiculo = '8' where placa_vehiculo = "1";
SELECT * FROM taxis;
SELECT * FROM conductores;