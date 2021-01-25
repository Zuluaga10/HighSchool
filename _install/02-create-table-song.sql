-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generaciÃ³n: 27-11-2017 a las 07:14:12
-- VersiÃ³n del servidor: 10.1.25-MariaDB
-- VersiÃ³n de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cleaningmaster`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_CambiarEstadoCliente` (IN `_documento` INT, IN `_estado` INT)  NO SQL
UPDATE persona SET estado= _estado WHERE documento = _documento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_CambiarEstadoEmpleado` (IN `_documento` INT, IN `_estado` INT)  NO SQL
UPDATE persona SET estado= _estado WHERE documento = _documento and Tipo_Persona_idTipo_Persona =1 OR Tipo_Persona_idTipo_Persona=2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_CambiarEstadoProducto` (IN `_codigo` INT, IN `_estado` INT)  NO SQL
UPDATE producto SET estado= _estado WHERE idproducto = _codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_CambiarEstadoServicio` (IN `_codigo` INT, IN `_estado` INT)  NO SQL
UPDATE servicio SET estado=_estado WHERE idservicios=_codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_CambiarEstadoTipoVehiculo` (IN `_codigo` INT, IN `_estado` INT)  NO SQL
UPDATE tipo_vehiculo SET estado= _estado WHERE idtipo_vehiculo = _codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_CambiarEstadoUnidadMedida` (IN `_codigo` INT, IN `_estado` INT)  NO SQL
UPDATE unidad_medida SET estado= _estado WHERE idUnidadMedida = _codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ConsularDetalles` (IN `_codigo` INT)  NO SQL
SELECT d.idDetalle,d.cantidad,d.kit_idkit,p.nombre FROM detale d JOIN producto p WHERE d.kit_idkit =_codigo and d.producto_idproducto = p.idproducto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ConsultarProducto` (IN `_codigo` INT)  NO SQL
SELECT p.nombre,p.precio_unitario,p.cantidad,p.medida,u.nombre nombreu FROM producto p JOIN unidad_medida u WHERE p.idproducto = _codigo and p.medida=u.idUnidadMedida$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ConsultarUsuario` (IN `_correo` VARCHAR(100))  NO SQL
SELECT Codigo, Correo, Contrasena, Rol_Codigo FROM usuario WHERE Correo = _correo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_EliminarDetalle` (IN `_codigo` INT)  NO SQL
DELETE FROM detale WHERE idDetalle=_codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_EliminarKit` (IN `_codigo` INT)  NO SQL
DELETE FROM kit WHERE idkit=_codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarCliente` ()  NO SQL
SELECT tipoDocumento,documento,nombre,contacto,direccion,estado FROM persona where Tipo_Persona_idTipo_Persona =3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarClienteActivo` ()  NO SQL
SELECT tipoDocumento,documento,nombre,contacto,direccion,estado FROM persona WHERE estado=1 AND Tipo_Persona_idTipo_Persona =3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarEmpleado` ()  NO SQL
SELECT tipoDocumento,documento,nombre,Tipo_Persona_idTipo_Persona,contacto,direccion,estado FROM persona where Tipo_Persona_idTipo_Persona =1 OR Tipo_Persona_idTipo_Persona=2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarEmpleadoActivo` ()  NO SQL
SELECT tipoDocumento,documento,nombre,contacto,direccion,estado FROM persona WHERE estado=1 AND Tipo_Persona_idTipo_Persona !=3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarKit` ()  NO SQL
SELECT k.idkit,k.nombre,s.nombre SNombre,t.nombre TNombre,k.estado FROM kit k JOIN tipo_vehiculo t JOIN servicio s WHERE k.servicio= s.idservicios and k.tipo_vehiculo=t.idtipo_vehiculo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarMovimiento` (IN `_tipo` INT)  NO SQL
SELECT m.idmovimiento,m.cantidad,p.nombre,m.descripcion FROM movimiento m JOIN producto p WHERE m.tipomovimiento=_tipo and m.producto=p.idproducto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarProducto` ()  NO SQL
SELECT p.idproducto,p.nombre,p.precio_unitario,p.cantidad,u.nombre medida,p.estado FROM producto p JOIN unidad_medida u WHERE u.idUnidadMedida = p.medida$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarServicio` ()  NO SQL
SELECT idservicios, nombre, costo, estado, descripcion FROM servicio$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarServicioActivo` ()  NO SQL
SELECT idservicios ,nombre FROM servicio WHERE estado=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarTipoPersona` ()  NO SQL
SELECT idtipoPersona,nombre from tipo_persona WHERE idtipoPersona != 3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarTipoVehiculo` ()  NO SQL
select idtipo_vehiculo, nombre, estado, observaciones FROM tipo_vehiculo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarTipoVehiculoActivo` ()  NO SQL
SELECT idtipo_vehiculo,nombre FROM tipo_vehiculo WHERE estado=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ListarUnidadMedida` ()  NO SQL
SELECT idUnidadMedida, nombre, estado FROM unidad_medida$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ModificarCantidadProducto` (IN `_codigo` INT, IN `_cantidad` INT)  NO SQL
UPDATE producto SET cantidad=_cantidad WHERE idproducto=_codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ModificarCliente` (IN `_tipoDocumento` VARCHAR(50), IN `_documento` INT, IN `_nombre` VARCHAR(70), IN `_contacto` VARCHAR(70), IN `_direccion` VARCHAR(70), IN `_estado` INT)  NO SQL
UPDATE persona SET tipoDocumento=_tipoDocumento,documento=_documento,nombre=_nombre,contacto=_contacto,direccion=_direccion,estado=_estado WHERE documento=_documento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ModificarEmpleado` (IN `_tipoDocumento` VARCHAR(50), IN `_documento` INT(50), IN `_nombre` VARCHAR(50), IN `_Tipo_Persona_idTipo_Persona` INT, IN `_contacto` VARCHAR(50), IN `_direccion` VARCHAR(70), IN `_estado` INT)  NO SQL
UPDATE persona SET tipoDocumento=_tipoDocumento,documento=_documento,nombre=_nombre,_Tipo_Persona_idTipo_Persona=_Tipo_Persona_idTipo_Persona,contacto=_contacto,direccion=_direccion,estado=_estado WHERE documento=_documento and Tipo_Persona_idTipo_Persona =1 OR Tipo_Persona_idTipo_Persona=2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ModificarProducto` (IN `_codigo` INT, IN `_nombre` VARCHAR(50), IN `_precio` INT, IN `_cantidad` INT, IN `_medida` INT)  NO SQL
UPDATE producto SET nombre= _nombre,precio_unitario= _precio,cantidad= _cantidad,medida= _medida  WHERE idproducto = _codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ModificarServicio` (IN `_codigo` INT, IN `_nombre` VARCHAR(50), IN `_costo` INT, IN `_descripcion` VARCHAR(200))  NO SQL
UPDATE servicio SET nombre=_nombre, costo=_costo, descripcion=_descripcion WHERE idservicios=_codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ModificarTipoVehiculo` (IN `_codigo` INT, IN `_nombre` VARCHAR(50), IN `_descripcion` VARCHAR(200))  NO SQL
UPDATE tipo_vehiculo SET nombre= _nombre, observaciones= _descripcion WHERE idtipo_vehiculo = _codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_ModificarUnidadMedida` (IN `_codigo` INT, IN `_nombre` VARCHAR(50))  NO SQL
UPDATE unidad_medida SET nombre= _nombre WHERE idUnidadMedida = _codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarCliente` (IN `_tipoDocumento` VARCHAR(50), IN `_documento` INT, IN `_nombre` VARCHAR(70), IN `_contacto` VARCHAR(70), IN `_direccion` VARCHAR(70), IN `_estado` INT)  NO SQL
INSERT INTO persona(tipoDocumento,documento,nombre,contacto,direccion,estado,Tipo_Persona_idTipo_Persona) VALUES (_tipoDocumento,_documento,_nombre,_contacto,_direccion,_estado,3)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarDetalle` (IN `_cantidad` INT, IN `_kit` INT, IN `_producto` INT)  NO SQL
INSERT INTO detale(cantidad,kit_idkit,producto_idproducto)
VALUES(_cantidad,_kit,_producto)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarEmpleado` (IN `_tipoDocumento` VARCHAR(50), IN `_documento` INT(50), IN `_nombre` VARCHAR(50), IN `_Tipo_Persona_idTipo_Persona` INT, IN `_contacto` VARCHAR(50), IN `_direccion` VARCHAR(50), IN `_estado` INT)  NO SQL
INSERT INTO persona(tipoDocumento,documento,nombre,Tipo_Persona_idTipo_Persona,contacto,direccion,estado) VALUES (_tipoDocumento,_documento,_nombre,_Tipo_Persona_idTipo_Persona,_contacto,_direccion,_estado)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarKit` (IN `_codigo` INT, IN `_nombre` VARCHAR(50), IN `_Tvehiculo` INT, IN `_servicio` INT, IN `_estado` INT)  NO SQL
INSERT INTO kit(idkit,nombre,tipo_vehiculo,servicio,estado) VALUES(_codigo,_nombre,_Tvehiculo,_servicio,_estado)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarMovimiento` (IN `_codigo` INT, IN `_cantidad` INT, IN `_producto` INT, IN `_descripcion` VARCHAR(200), IN `_tipo` INT)  NO SQL
INSERT INTO movimiento(idmovimiento,cantidad,producto,descripcion,tipomovimiento) VALUES(_codigo,_cantidad,_producto,_descripcion,_tipo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarProducto` (IN `_codigo` INT(11), IN `_nombre` VARCHAR(50), IN `_precio` INT(11), IN `_cantidad` INT(11), IN `_medida` INT(11), IN `_estado` INT(2))  NO SQL
INSERT INTO producto(idproducto,nombre,precio_unitario,cantidad,medida,estado) VALUES(_codigo,_nombre,_precio,_cantidad,_medida,_estado)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarServicio` (IN `_codigo` INT, IN `_nombre` VARCHAR(50), IN `_costo` INT, IN `_estado` INT, IN `_descripcion` VARCHAR(200))  NO SQL
INSERT INTO servicio (idservicios, nombre, costo, estado, descripcion) VALUES (_codigo, _nombre, _costo, _estado, _descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarTipoVehiculo` (IN `_codigo` INT, IN `_nombre` VARCHAR(50), IN `_estado` INT, IN `_descripcion` VARCHAR(200))  NO SQL
INSERT INTO tipo_vehiculo(idtipo_vehiculo,nombre,estado,observaciones) VALUES (_codigo,_nombre,_estado,_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CM_RegistrarUnidadMedida` (IN `_codigo` INT, IN `_nombre` VARCHAR(50), IN `_estado` VARCHAR(20))  NO SQL
INSERT INTO unidad_medida(idUnidadMedida,nombre,estado) VALUES (_codigo,_nombre,_estado)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detale`
--

CREATE TABLE `detale` (
  `idDetalle` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `kit_idkit` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detale`
--

INSERT INTO `detale` (`idDetalle`, `cantidad`, `kit_idkit`, `producto_idproducto`) VALUES
(9, 12, 111, 402),
(10, 5, 111, 401),
(11, 3, 55, 402),
(12, 5, 1212, 402),
(13, 2, 1212, 401),
(14, 1, 101, 401),
(15, 2, 101, 400),
(16, 7, 1241, 400),
(17, 16, 1551, 401),
(18, 6, 555, 400),
(19, 4, 55555555, 400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kit`
--

CREATE TABLE `kit` (
  `idkit` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo_vehiculo` int(11) NOT NULL,
  `estado` int(1) DEFAULT NULL,
  `servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `kit`
--

INSERT INTO `kit` (`idkit`, `nombre`, `tipo_vehiculo`, `estado`, `servicio`) VALUES
(55, 'nn', 100, 1, 200),
(101, 'si', 100, 1, 205),
(111, 'nose', 100, 1, 200),
(555, 'aaa', 101, 1, 201),
(1212, 'nnnn', 100, 1, 201),
(1241, 'ss', 102, 1, 202),
(1551, 'dd', 103, 1, 201),
(55555555, 'AAA', 101, 0, 201);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `idmovimiento` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `producto` int(11) NOT NULL,
  `tipomovimiento` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden de servicio`
--

CREATE TABLE `orden de servicio` (
  `idordenServicio` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `empleado` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `servicios solicitados` varchar(100) DEFAULT NULL,
  `numero de orden` int(11) DEFAULT NULL,
  `tipo_vehiculo_idtipo_vehiculo` int(11) NOT NULL,
  `servicios_idservicios` int(11) NOT NULL,
  `persona_idpersona` int(11) NOT NULL,
  `persona_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `tipoDocumento` varchar(45) DEFAULT NULL,
  `documento` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `contacto` int(11) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `Tipo_Persona_idTipo_Persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`tipoDocumento`, `documento`, `nombre`, `contacto`, `correo`, `direccion`, `estado`, `Tipo_Persona_idTipo_Persona`) VALUES
('1', 1212212, 'Pablo', 454545, NULL, 'ELEGANTE', '1', 2),
('2', 121212212, 'Jhonatan', 5555, NULL, 'Bello', '1', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `precio_unitario` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` int(2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `medida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `precio_unitario`, `nombre`, `estado`, `cantidad`, `medida`) VALUES
(400, 500, 'Estopa', 1, 2, 303),
(401, 1000, 'Shampoo', 1, 0, 305),
(402, 1200, 'ACPM', 1, 0, 302);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Codigo`, `Nombre`) VALUES
(1, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idservicios` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idservicios`, `nombre`, `costo`, `estado`, `descripcion`) VALUES
(200, 'Lavada Sencilla', 12000, '1', 'Lavada por fuera del vehÃ­culo.'),
(201, 'Brillada', 16000, '1', ''),
(202, 'Desmanchada', 17000, '1', ''),
(203, 'Grafiteada', 14000, '1', ''),
(204, 'Lavada Motor', 6000, '0', ''),
(205, 'Lavada Chasis', 10000, '1', ''),
(206, 'Interior', 10000, '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_moviento`
--

CREATE TABLE `tipo_moviento` (
  `idmovimiento` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE `tipo_persona` (
  `idtipoPersona` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`idtipoPersona`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Empleado'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `idtipo_vehiculo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `estado`, `observaciones`) VALUES
(100, 'Automoviles', '1', ''),
(101, 'Campero', '1', ''),
(102, 'Moto', '1', ''),
(103, 'Camioneta', '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `idUnidadMedida` int(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`idUnidadMedida`, `nombre`, `estado`) VALUES
(300, 'Centimetro', '1'),
(301, 'Metro', '1'),
(302, 'Litro', '1'),
(303, 'Caja de 4', '1'),
(304, 'Caja de 6', '1'),
(305, 'Mililitro', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Codigo` int(11) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Rol_Codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Codigo`, `Correo`, `Contrasena`, `Rol_Codigo`) VALUES
(2, 'anderson@hotmail.com', '202cb962ac59075b964b07152d234b70', 1);

--
-- Ãndices para tablas volcadas
--

--
-- Indices de la tabla `detale`
--
ALTER TABLE `detale`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `fk_Detale_kit1_idx` (`kit_idkit`),
  ADD KEY `fk_Detale_producto1_idx` (`producto_idproducto`);

--
-- Indices de la tabla `kit`
--
ALTER TABLE `kit`
  ADD PRIMARY KEY (`idkit`),
  ADD KEY `fk_kit_tipo_vehiculo1_idx` (`tipo_vehiculo`),
  ADD KEY `fk_kit_servicio1_idx` (`servicio`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`idmovimiento`),
  ADD KEY `fk_movimiento_producto1_idx` (`producto`),
  ADD KEY `fk_movimiento_tipo_moviento1_idx` (`tipomovimiento`);

--
-- Indices de la tabla `orden de servicio`
--
ALTER TABLE `orden de servicio`
  ADD PRIMARY KEY (`idordenServicio`),
  ADD KEY `fk_orden de servicio_tipo_vehiculo1_idx` (`tipo_vehiculo_idtipo_vehiculo`),
  ADD KEY `fk_orden de servicio_servicios1_idx` (`servicios_idservicios`),
  ADD KEY `fk_orden de servicio_persona1_idx` (`persona_documento`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `fk_persona_Tipo_Persona1_idx` (`Tipo_Persona_idTipo_Persona`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `fk_producto_unidad de medida1_idx` (`medida`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idservicios`);

--
-- Indices de la tabla `tipo_moviento`
--
ALTER TABLE `tipo_moviento`
  ADD PRIMARY KEY (`idmovimiento`);

--
-- Indices de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  ADD PRIMARY KEY (`idtipoPersona`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`idtipo_vehiculo`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`idUnidadMedida`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `fk_Usuario_Rol_idx` (`Rol_Codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detale`
--
ALTER TABLE `detale`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detale`
--
ALTER TABLE `detale`
  ADD CONSTRAINT `fk_Detale_kit1` FOREIGN KEY (`kit_idkit`) REFERENCES `kit` (`idkit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detale_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `kit`
--
ALTER TABLE `kit`
  ADD CONSTRAINT `fk_kit_servicio1` FOREIGN KEY (`servicio`) REFERENCES `servicio` (`idservicios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kit_tipo_vehiculo1` FOREIGN KEY (`tipo_vehiculo`) REFERENCES `tipo_vehiculo` (`idtipo_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `fk_movimiento_producto1` FOREIGN KEY (`producto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movimiento_tipo_moviento1` FOREIGN KEY (`tipomovimiento`) REFERENCES `tipo_moviento` (`idmovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden de servicio`
--
ALTER TABLE `orden de servicio`
  ADD CONSTRAINT `fk_orden de servicio_persona1` FOREIGN KEY (`persona_documento`) REFERENCES `persona` (`documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden de servicio_servicios1` FOREIGN KEY (`servicios_idservicios`) REFERENCES `servicio` (`idservicios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden de servicio_tipo_vehiculo1` FOREIGN KEY (`tipo_vehiculo_idtipo_vehiculo`) REFERENCES `tipo_vehiculo` (`idtipo_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_Tipo_Persona1` FOREIGN KEY (`Tipo_Persona_idTipo_Persona`) REFERENCES `tipo_persona` (`idtipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_unidad de medida1` FOREIGN KEY (`medida`) REFERENCES `unidad_medida` (`idUnidadMedida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Rol` FOREIGN KEY (`Rol_Codigo`) REFERENCES `rol` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
