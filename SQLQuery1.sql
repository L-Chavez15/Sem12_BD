USE Comercial
SELECT * FROM Productos
--COSULTA: MUESTRE EL NOMBRE DEL PRODUCTO, PRECIO, CANTIDAD Y EL SUB TOTAL CALCULADO
SELECT NombreProducto,PrecioUnitario,UnidadesEnPedido, PrecioUnitario*UnidadesEnPedido AS SUBTOTAL
FROM Productos
--CONSULTA: Al precio de cada columna agregale otra al costado que calcule el precio del mismo
--producto con un descuento del 5%

SELECT NombreProducto,PrecioUnitario,UnidadesEnPedido, PrecioUnitario*0.05 AS descuento, PrecioUnitario-(PrecioUnitario*0.05) as [Precio Actualizado]--se coloca entre corchetes cuando hay dos palabras [Precio Actualizado]
FROM Productos

--CONSULTA: Unir dos columnas 
select Apellido +'  '+Nombre as [Nombre Completo], Cargo,FechaNacimiento, FechaContratacion
from Empleados

-- CONSULTA: IGUAL Y DIFERENTE
select *
from Productos
where NombreProducto = 'Manzanas'
--mostramos los productos distintos a manzana
select *
from Productos
where NombreProducto <> 'Manzanas'

--CONSULTA: productos que comienzan con A o productos que empiecen con c
SELECT *
FROM Productos
WHERE NombreProducto like 'A%' or NombreProducto like'C%'

--Configuracion de fechas
SELECT SYSDATETIME () as [FECHA Y HORA DEL SERVIDOR FORM AMPLIO]
SELECT GETDATE () as [FECHA Y HORA DEL SERVIDOR]
SELECT DAY (GETDATE())AS'Día'
SELECT MONTH (GETDATE()) AS 'Mes'
SELECT YEAR (GETDATE()) AS 'Año'
SELECT SYSDATETIMEOffset() as [FECHA Y HORA DE SERVIDOR, JUNTO CON EL DESPLAZAMENTO UTC]
SELECT GETUTCDATE() as [FECHA Y HORA GMT GREENWINCH]

--FORMATO MES/DIA/AÑO
DECLARE @mifecha datetime
SET @mifecha=GETDATE()
SELECT CONVERT(varchar,@mifecha,1) as [Mes/Día/Año]
GO
--FORMATO AÑO/MES/DIA
DECLARE @mifecha datetime
SET @mifecha=GETDATE()
SELECT CONVERT(varchar,@mifecha,2) as [AÑO.MES.DIA]
GO
--FORMATO DÍA/MES/AÑO
DECLARE @mifecha datetime
SET @mifecha=GETDATE()
SELECT CONVERT(varchar,@mifecha,3) as [DÍA/MES/AÑO]
GO
--FORMATO DIA/MES/AÑO HORA
DECLARE @mifecha datetime
SET @mifecha=GETDATE()
SELECT CONVERT(varchar,@mifecha,13) as [DÍA MES AÑO
HORA:MINUTO:SEGUNDO:MILISEGUNDO]

--CONSULTA: DE LA TABLA PRODUCTOS MOSTRAR LOS PRODUCTOS DE MAYOR PRECIO
SELECT MAX(PrecioUnitario)  
FROM Productos
--COVERTIMOS A UNA SUBCONSULTA, mostramos nombre, precio y cantidad del producto
SELECT NombreProducto, PrecioUnitario,CantidadPorUnidad
FROM Productos
--juntamos las dos consultas y la convertimos en subconsulta
SELECT NombreProducto, PrecioUnitario,CantidadPorUnidad
FROM Productos
where PrecioUnitario =(SELECT MAX(PrecioUnitario) FROM Productos)

--Consulta: Actualizar el precio de todos los productos aumentando en un 2.3%
SELECT NombreProducto,PrecioUnitario from Productos
update Productos set PrecioUnitario =2.3

--cambiamos el valor de un registro 
select NombreProducto,PrecioUnitario from Productos
update Productos set PrecioUnitario = 10
where IdProducto = 6

--aumentamos el precio de 2.3%
select NombreProducto,PrecioUnitario from Productos
update Productos set PrecioUnitario = PrecioUnitario+(PrecioUnitario*0.023)
where IdProducto=6