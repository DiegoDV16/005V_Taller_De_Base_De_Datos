select * from recinto;


DECLARE
    TYPE T_RECINTO IS RECORD (
        RECINTO_ID recinto.recinto_id%TYPE,
        NOMBRE recinto.nombre%TYPE,
        DIRECCION recinto.direccion%TYPE,
        CIUDAD recinto.ciudad%TYPE,
        CAPACIDAD_TOTAL recinto.capacidad_total%TYPE
    );
    v_recinto T_RECINTO;

BEGIN
    select recinto_id, nombre, direccion, ciudad, capacidad_total 
    into v_recinto.RECINTO_ID, v_recinto.NOMBRE, v_recinto.DIRECCION,
    v_recinto.CIUDAD, v_recinto.CAPACIDAD_TOTAL
    from recinto 
    where recinto_id = 1;

    dbms_output.put_line('Recinto ID: ' || v_recinto.RECINTO_ID);
    dbms_output.put_line('Nombre: ' || v_recinto.NOMBRE);
    dbms_output.put_line('Dirección: ' || v_recinto.DIRECCION);
    dbms_output.put_line('Ciudad: ' || v_recinto.CIUDAD);
    dbms_output.put_line('Capacidad Total: ' || v_recinto.CAPACIDAD_TOTAL);
        
    exception
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('No se encontró el recinto con ID 1.');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('Se encontraron multiples registros.');
        WHEN OTHERS THEN
            dbms_output.put_line('Ocurrió un error inesperado: ' || SQLERRM);
END;
/