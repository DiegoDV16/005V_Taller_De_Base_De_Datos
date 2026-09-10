SELECT * FROM EVENTO;

UPDATE EVENTO SET ESTADO = 'CANCELADO' WHERE EVENTO_ID = 1;
commit;

DECLARE 
    e_evento_cancelado EXCEPTION;
    v_estado EVENTO.estado%TYPE;




BEGIN
    select estado into v_estado from EVENTO where evento_id = 1;
    IF v_estado = 'CANCELADO' THEN
        RAISE e_evento_cancelado;
    END IF;

    dbms_output.put_line('Evento disponible.');

    EXCEPTION
        WHEN e_evento_cancelado THEN
            dbms_output.put_line('El evento ya ha sido cancelado.');
    
END;
/

DECLARE
    v_stock LOCALIDAD_EVENTO.stock_disponible%TYPE;
BEGIN
    SELECT stock_disponible INTO v_stock
    FROM LOCALIDAD_EVENTO
    WHERE localidad_evento_id = 1;

    IF v_stock <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Sin stock: las entradas para esta localidad están agotadas.'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('Stock disponible: ' || v_stock);
END;
/