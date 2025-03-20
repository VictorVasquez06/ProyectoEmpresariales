-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.7-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para inventarioparcial1
CREATE DATABASE IF NOT EXISTS `inventarioparcial1` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `inventarioparcial1`;

-- Volcando estructura para tabla inventarioparcial1.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.categoria: ~5 rows (aproximadamente)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'Electrodomésticos', 'Aparatos eléctricos para el hogar'),
	(2, 'Tecnología', 'Dispositivos tecnológicos'),
	(3, 'Muebles', 'Mobiliario para el hogar y oficina'),
	(4, 'Hogar', 'Artículos para el hogar y cocina'),
	(6, 'Juguestes', 'Juguetes para niños y adultos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.cliente: ~8 rows (aproximadamente)
DELETE FROM `cliente`;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `nombre`, `correo`, `telefono`) VALUES
	(1, 'Luis Fernández', 'luisf@email.com', '3109876543'),
	(2, 'Mariana Torres', 'marianat@email.com', '3016549873'),
	(3, 'Pedro Sánchez', 'pedros@email.com', '3128765432'),
	(4, 'Carlos López', 'carlos@email.com', '3109876543'),
	(5, 'Ana Martínez', 'ana@email.com', '3016549873'),
	(6, 'Javier Rodríguez', 'javier@email.com', '3123456789'),
	(7, 'Laura González', 'laura@email.com', '3156789012'),
	(8, 'Pedro Castro', 'pedro@email.com', '3182345678');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.detalleventa
CREATE TABLE IF NOT EXISTS `detalleventa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_id` (`venta_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`),
  CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.detalleventa: ~10 rows (aproximadamente)
DELETE FROM `detalleventa`;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` (`id`, `venta_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
	(1, NULL, 1, 1, 1500.00, 1500.00),
	(2, NULL, 5, 2, 250.00, 500.00),
	(3, NULL, 6, 1, 1500.00, 1500.00),
	(4, NULL, 2, 1, 1200.00, 1200.00),
	(5, NULL, 4, 2, 450.00, 900.00),
	(6, NULL, 3, 3, 600.00, 1800.00),
	(7, NULL, NULL, 2, 220.00, 440.00),
	(8, NULL, 5, 1, 250.00, 250.00),
	(17, 7, 2, 1, 1200.00, 1200.00),
	(18, 7, 5, 2, 300.00, 600.00);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` double NOT NULL,
  `subtotal` double NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `venta_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.detalle_venta: ~0 rows (aproximadamente)
DELETE FROM `detalle_venta`;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.movimientoinventario
CREATE TABLE IF NOT EXISTS `movimientoinventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `tipo` enum('entrada','salida') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `cliente_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `movimientoinventario_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `movimientoinventario_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `movimientoinventario_ibfk_3` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.movimientoinventario: ~7 rows (aproximadamente)
DELETE FROM `movimientoinventario`;
/*!40000 ALTER TABLE `movimientoinventario` DISABLE KEYS */;
INSERT INTO `movimientoinventario` (`id`, `producto_id`, `tipo`, `cantidad`, `fecha`, `cliente_id`, `proveedor_id`) VALUES
	(1, 1, 'entrada', 10, '2025-03-20 17:20:06', NULL, 1),
	(2, 2, 'entrada', 8, '2025-03-20 17:20:06', NULL, 2),
	(3, 3, 'entrada', 15, '2025-03-20 17:20:06', NULL, 1),
	(4, 4, 'entrada', 12, '2025-03-20 17:20:06', NULL, 2),
	(5, 5, 'entrada', 20, '2025-03-20 17:20:06', NULL, 3),
	(6, 2, 'salida', 1, '2025-03-20 17:32:33', 4, NULL),
	(7, 5, 'salida', 2, '2025-03-20 17:32:33', 4, NULL);
/*!40000 ALTER TABLE `movimientoinventario` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.movimiento_inventario
CREATE TABLE IF NOT EXISTS `movimiento_inventario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `tipo` enum('ENTRADA','SALIDA') DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) NOT NULL,
  `proveedor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.movimiento_inventario: ~0 rows (aproximadamente)
DELETE FROM `movimiento_inventario`;
/*!40000 ALTER TABLE `movimiento_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_inventario` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.producto: ~10 rows (aproximadamente)
DELETE FROM `producto`;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `categoria_id`, `proveedor_id`) VALUES
	(1, 'Refrigerador', 'Refrigerador de 300 litros con congelador', 1500, 20, 1, 1),
	(2, 'Lavadora', 'Lavadora automática de 15 kg', 1200, 15, 1, 2),
	(3, 'Horno Microondas', 'Horno microondas de 20 litros con grill', 300, 30, 1, 1),
	(4, 'Aspiradora', 'Aspiradora con filtro HEPA y 1200W de potencia', 500, 25, 1, 2),
	(5, 'Cafetera', 'Cafetera programable de 12 tazas', 250, 40, 1, 3),
	(6, 'Laptop', 'Laptop con procesador i7 y 16GB RAM', 2500, 10, 2, 4),
	(7, 'Smartphone', 'Teléfono inteligente con cámara 108MP', 1200, 25, 2, 1),
	(8, 'Smartwatch', 'Reloj inteligente con GPS y monitor cardíaco', 500, 35, 2, 5),
	(9, 'Audífonos inalámbricos', 'Audífonos con cancelación de ruido', 300, 50, 2, 3),
	(10, 'Tableta', 'Tableta de 10 pulgadas con 128GB de almacenamiento', 800, 20, 2, 4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.proveedor: ~5 rows (aproximadamente)
DELETE FROM `proveedor`;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` (`id`, `nombre`, `contacto`, `telefono`) VALUES
	(1, 'ElectroHogar S.A.', 'Juan Pérez', '3001234567'),
	(2, 'TecnoCasa Ltda.', 'María Gómez', '3207654321'),
	(3, 'HogarSmart', 'Carlos Ramírez', '3108765432'),
	(4, 'ElectroMundo', 'Laura Torres', '3059876543'),
	(5, 'Distribuidora Rápida', 'Pedro Sánchez', '3145678901');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('ADMINISTRADOR','OPERADOR') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.usuario: ~2 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `username`, `password`, `rol`) VALUES
	(1, 'admin', 'admin123', 'ADMINISTRADOR'),
	(2, 'operador1', 'operador123', 'OPERADOR');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla inventarioparcial1.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `cliente_id` int(11) DEFAULT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla inventarioparcial1.venta: ~7 rows (aproximadamente)
DELETE FROM `venta`;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` (`id`, `fecha`, `cliente_id`, `total`) VALUES
	(1, '2025-03-20 17:26:26', 4, 2700),
	(2, '2025-03-20 17:26:26', 5, 1500),
	(3, '2025-03-20 17:26:26', 6, 2100),
	(4, '2025-03-20 17:26:26', 7, 1800),
	(5, '2025-03-20 17:26:26', 8, 900),
	(6, '2025-03-20 17:29:11', 4, 1800),
	(7, '2025-03-20 17:31:42', 4, 1800);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
