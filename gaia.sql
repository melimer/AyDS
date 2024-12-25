use GAIA;

-- Gaia.usuario definition

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contraseña` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apodo` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo_electronico` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Gaia.doctor definition

CREATE TABLE `medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cedula` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Gaia.p_embarazo definition

CREATE TABLE `p_embarazo` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `sexo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sem_emba` int DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.usuario_doctor definition

CREATE TABLE `usuario_medico` (
  `id_medico` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  KEY `id_medico` (`id_medico`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `usuario_medico_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_medico_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Gaia.usuario_padre definition

CREATE TABLE `usuario_pemba` (
  `id_persona` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  KEY `id_persona` (`id_persona`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `usuario_pemba_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `p_embarazo` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_pemba_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `disponibilidad` (
  `id_disp` int NOT NULL AUTO_INCREMENT,
  `dis_semana` int,
  `hora_inicio` time,
  `hora_fin` time,
  PRIMARY KEY (`id_disp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `medico_disponibilidad` (
  `id_medico` int DEFAULT NULL,
  `id_disp` int DEFAULT NULL,
  KEY `id_medico` (`id_medico`),
  KEY `id_disp` (`id_disp`),
  CONSTRAINT `medico_disponibilidad_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medico_disponibilidad_ibfk_2` FOREIGN KEY (`id_disp`) REFERENCES `disponibilidad` (`id_disp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Gaia.registros definition

CREATE TABLE `registros` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `fecha_regis` date DEFAULT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Gaia.pa_registro definition

CREATE TABLE `pe_registro` (
  `id_persona` int DEFAULT NULL,
  `id_registro` int DEFAULT NULL,
  KEY `id_persona` (`id_persona`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `pe_registro_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `p_embarazo` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pe_registro_ibfk_2` FOREIGN KEY (`id_registro`) REFERENCES `registros` (`id_registro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.sintomas definition

CREATE TABLE `sintomas` (
  `id_sintomas` int NOT NULL AUTO_INCREMENT,
  `nauseas` tinyint(1) DEFAULT NULL,
  `fatiga` tinyint(1) DEFAULT NULL,
  `dolor_ca` tinyint(1) DEFAULT NULL,
  `se_sensible` tinyint(1) DEFAULT NULL,
  `hinchazon` tinyint(1) DEFAULT NULL,
  `constipacion` tinyint(1) DEFAULT NULL,
  `calambres` tinyint(1) DEFAULT NULL,
  `vomito` tinyint(1) DEFAULT NULL,
  `sangrado` tinyint(1) DEFAULT NULL,
  `feliz` tinyint(1) DEFAULT NULL,
  `triste` tinyint(1) DEFAULT NULL,
  `sensible` tinyint(1) DEFAULT NULL,
  `ira` tinyint(1) DEFAULT NULL,
  `angustia` tinyint(1) DEFAULT NULL,
  `confusion` tinyint(1) DEFAULT NULL,
  `tranquilidad` tinyint(1) DEFAULT NULL,
  `disgusto` tinyint(1) DEFAULT NULL,
  `notas_s` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_sintomas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Gaia.regis_sintoma definition

CREATE TABLE `regis_sintoma` (
  `id_sintomas` int DEFAULT NULL,
  `id_registro` int DEFAULT NULL,
  KEY `id_sintomas` (`id_sintomas`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `regis_sintoma_ibfk_1` FOREIGN KEY (`id_sintomas`) REFERENCES `sintomas` (`id_sintomas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regis_sintoma_ibfk_2` FOREIGN KEY (`id_registro`) REFERENCES `registros` (`id_registro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.cam_emba definition

CREATE TABLE `cam_emba` (
  `id_cam_emba` int NOT NULL AUTO_INCREMENT,
  `antojos` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cambios_piel` tinyint(1) DEFAULT NULL,
  `frecuencia_u` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cambios_pdes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diametro_p` int DEFAULT NULL,
  `notas_ce` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_cam_emba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Gaia.regis_ca_emba definition

CREATE TABLE `regis_ca_emba` (
  `id_cam_emba` int DEFAULT NULL,
  `id_registro` int DEFAULT NULL,
  KEY `id_cam_emba` (`id_cam_emba`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `regis_ca_emba_ibfk_1` FOREIGN KEY (`id_cam_emba`) REFERENCES `cam_emba` (`id_cam_emba`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regis_ca_emba_ibfk_2` FOREIGN KEY (`id_registro`) REFERENCES `registros` (`id_registro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- Gaia.cam_emba definition

CREATE TABLE `estudios` (
  `id_est` int NOT NULL AUTO_INCREMENT,
  `documento` longblob DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_sub` date DEFAULT NULL,
  `hora_est` time DEFAULT NULL,
  `fecha_real` date DEFAULT NULL,
  PRIMARY KEY (`id_est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Gaia.regis_ca_emba definition

CREATE TABLE `regis_estudio` (
  `id_est` int DEFAULT NULL,
  `id_registro` int DEFAULT NULL,
  KEY `id_est` (`id_est`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `regis_estudio_ibfk_1` FOREIGN KEY (`id_est`) REFERENCES `estudios` (`id_est`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `regis_estudio_ibfk_2` FOREIGN KEY (`id_registro`) REFERENCES `registros` (`id_registro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.foro definition

CREATE TABLE `foro` (
  `id_foro` int NOT NULL AUTO_INCREMENT,
  `nom_foro` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `iniciado_por` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_foro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.foro_msg definition

CREATE TABLE `foro_msg` (
  `id_mensaje` int DEFAULT NULL,
  `id_foro` int DEFAULT NULL,
  KEY `id_mensaje` (`id_mensaje`),
  KEY `id_foro` (`id_foro`),
  CONSTRAINT `foro_msg_ibfk_1` FOREIGN KEY (`id_mensaje`) REFERENCES `mensajes` (`id_mensaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foro_msg_ibfk_2` FOREIGN KEY (`id_foro`) REFERENCES `foro` (`id_foro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.foro_tema definition

CREATE TABLE `foro_tema` (
  `id_tema` int DEFAULT NULL,
  `id_foro` int DEFAULT NULL,
  KEY `id_tema` (`id_tema`),
  KEY `id_foro` (`id_foro`),
  CONSTRAINT `foro_tema_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `temas` (`id_tema`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foro_tema_ibfk_2` FOREIGN KEY (`id_foro`) REFERENCES `foro` (`id_foro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Gaia.dr_foro definition

CREATE TABLE `med_foro` (
  `id_medico` int DEFAULT NULL,
  `id_foro` int DEFAULT NULL,
  KEY `id_medico` (`id_medico`),
  KEY `id_foro` (`id_foro`),
  CONSTRAINT `med_foro_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `med_foro_ibfk_2` FOREIGN KEY (`id_foro`) REFERENCES `foro` (`id_foro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.mensajes definition

CREATE TABLE `mensajes` (
  `id_mensaje` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(1700) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_mensaje` date DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.replica definition

CREATE TABLE `replica` (
  `id_replica` int NOT NULL AUTO_INCREMENT,
  `contenido` varchar(1700) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hecha_por` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_replica` date DEFAULT NULL,
  PRIMARY KEY (`id_replica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.temas definition

CREATE TABLE `temas` (
  `id_tema` int NOT NULL AUTO_INCREMENT,
  `nombre_t` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tema`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.msg_replica definition

CREATE TABLE `msg_replica` (
  `id_mensaje` int DEFAULT NULL,
  `id_replica` int DEFAULT NULL,
  KEY `id_mensaje` (`id_mensaje`),
  KEY `id_replica` (`id_replica`),
  CONSTRAINT `msg_replica_ibfk_1` FOREIGN KEY (`id_mensaje`) REFERENCES `mensajes` (`id_mensaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `msg_replica_ibfk_2` FOREIGN KEY (`id_replica`) REFERENCES `replica` (`id_replica`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Gaia.pa_foro definition

CREATE TABLE `pa_foro` (
  `id_padre` int DEFAULT NULL,
  `id_foro` int DEFAULT NULL,
  KEY `id_padre` (`id_padre`),
  KEY `id_foro` (`id_foro`),
  CONSTRAINT `pa_foro_ibfk_1` FOREIGN KEY (`id_padre`) REFERENCES `p_embarazo` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pa_foro_ibfk_2` FOREIGN KEY (`id_foro`) REFERENCES `foro` (`id_foro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pa_med` (
  `id_persona` int DEFAULT NULL,
  `id_medico` int DEFAULT NULL,
  KEY `id_persona` (`id_persona`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `pa_med_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `p_embarazo` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pa_med_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 0: enviada sin respuesta, 1:aceptada, borrar al rechazar. esta es para cuando un padre manda solicitud a un medico
CREATE TABLE `solicitudes_pa_med` (
  `id_soli_pa` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `id_medico` int DEFAULT NULL,
  `estado` int DEFAULT NULL,
    PRIMARY KEY (`id_soli_pa`),
  KEY `id_persona` (`id_persona`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `pa_med_soli_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `p_embarazo` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pa_med_soli_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 0: enviada sin respuesta, 1:aceptada, borrar al rechazar. esta es para cuando un medico manda solicitud a un padre
CREATE TABLE `solicitudes_med_pa` (
  `id_soli_med` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `id_medico` int DEFAULT NULL,
  `estado` int DEFAULT NULL,
    PRIMARY KEY (`id_soli_med`),
  KEY `id_persona` (`id_persona`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `med_pa_soli_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `p_embarazo` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `med_pa_soli_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO GAIA.temas (nombre_t) VALUES
	 ('Salud Bebé'),
	 ('Salud Embarazo'),
	 ('Nombres'),
	 ('Médico'),
	 ('Cuidados');

