SELECT * FROM TRANSACCION_PAGO;
SELECT * FROM RESERVA_TEMPORAL;
SELECT * FROM CLIENTE;



DECLARE 
    TYPE boleta_cliente is record (
        nombre_cliente CLIENTE.NOMBRE%TYPE,
        estado_reserva RESERVA_TEMPORAL.ESTADO%TYPE,
        monto_bruto TRANSACCION_PAGO.MONTO_BRUTO%TYPE,
        descuento TRANSACCION_PAGO.DESCUENTO%TYPE,
        monto_final TRANSACCION_PAGO.MONTO_FINAL%TYPE,
        estado_pago TRANSACCION_PAGO.ESTADO%TYPE
    );

    v_boleta boleta_cliente;
BEGIN 
    SELECT c.nombre, rt.estado as ESTADO_DE_RESERVA,tp.MONTO_BRUTO, tp.DESCUENTO, 
    tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_PAGO INTO v_boleta.nombre_cliente, v_boleta.estado_reserva, 
    v_boleta.monto_bruto, v_boleta.descuento, v_boleta.monto_final, v_boleta.estado_pago
    FROM CLIENTE c
    INNER JOIN RESERVA_TEMPORAL rt ON rt.cliente_id = c.cliente_id
    INNER JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.RESERVA_ID 
    WHERE tp.TRANSACCION_ID = 1;


END;
/