
GO

CREATE FUNCTION dbo.CapacidadActual(@IDAlmacen int)
Returns int 
AS BEGIN 
DECLARE @Ocupado int
DECLARE @Capacidad int
	
		SET @Ocupado = ( SELECT SUM(E.NumeroContenedores) FROM Envios AS E
							WHERE A.ID = @IDAlmacen 
							INNER JOIN Asignaciones AS S
							ON E.ID = S.IDEnvio
							INNER JOIN Almacenes AS A
							ON A.ID = S.IDAlmacen
							)
	
		SET @Capacidad = (SELECT Capacidad FROM Almacenes
						WHERE ID = @IDAlmacen)



	RETURN @Capacidad - @Ocupado
END
GO