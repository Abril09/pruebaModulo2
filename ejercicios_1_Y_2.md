### Ejercicios.
1.  tablas.
    * a.Mostrar la cantidad de prestaciones de servicios ejecutados entre el 01 de    octubre y el 26 de noviembre del 2018.

        ~~~
            SELECT COUNT(IDPRESTACIONSERVICIO ) 
            FROM PRESTACIÓN_SERVICIO 
            WHERE FECHA BETWEEN '2018/10/01' AND '2018/11/26';
        ~~~
    * b. Mostrar la cantidad total de prestaciones realizadas agrupadas por idVehiculo.
        ~~~
        SELECT IDVEHICULO AS Vehiculo ,COUNT(IDPRESTACIONSERVICIO) AS Total
        FROM PRESTACIÓN_SERVICIO
        GROUP BY IDVEHICULO ;

        ~~~    
    * c. Mostrar los vehículos con la menor cantidad de prestaciones de servicios realizados.
        ~~~
        SELECT IDVEHICULO AS Vehiculo ,COUNT(IDPRESTACIONSERVICIO) AS Total
        FROM PRESTACIÓN_SERVICIO
        WHERE rownum <= 1
        GROUP BY IDVEHICULO
        ORDER BY  TOTAL ASC ;
        ~~~    
2. Crear con DDL una tabla empleado que contenga lo siguiente:
    *
    ~~~
    CREATE TABLE empleado (IdEmpleado Integer NOT NULL,nombre varchar(100),apellido varchar(100),direccion varchar(100) ,telefono Integer ,idDepartamento Integer);
    ~~~