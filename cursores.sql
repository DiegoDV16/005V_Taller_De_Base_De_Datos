SELECT * FROM CLIENTE;
DECLARE 
    CURSOR c_clientes is 
    SELECT * FROM CLIENTE;
BEGIN
    dbms_output.put_line('LISTA DE CLIENTES:');
    FOR un_cliente IN c_clientes LOOP
        dbms_output.put_line('CLIENTE: ' || un_cliente.NOMBRE);
    END LOOP;
    null;
END;
/

-- Creamos una boleta para todos los clientes con el pago aprobado
Select * from transaccion_pago;

SELECT c.nombre, rt.estado as estado_reserva, tp.monto_bruto, tp.descuento, 
tp.monto_final, tp.estado as estado_transaccion
FROM CLIENTE c
JOIN RESERVA_TEMPORAL rt ON rt.cliente_id = c.cliente_id
JOIN TRANSACCION_PAGO tp ON tp.reserva_id = rt.reserva_id
WHERE tp.estado = 'APROBADO';

DECLARE 
    CURSOR c_boleta is 
    SELECT c.nombre, rt.estado as estado_reserva, tp.monto_bruto, tp.descuento, 
    tp.monto_final, tp.estado as estado_transaccion
    FROM CLIENTE c
    JOIN RESERVA_TEMPORAL rt ON rt.cliente_id = c.cliente_id
    JOIN TRANSACCION_PAGO tp ON tp.reserva_id = rt.reserva_id
    WHERE tp.estado = 'APROBADO';

    v_contador NUMBER := 1;

BEGIN
    dbms_output.put_line('*** BOLETA PUNTO TICKET ***');
    FOR una_boleta IN c_boleta LOOP
        
        dbms_output.put_line('BOLETA N°: ' || v_contador);
        dbms_output.put_line('CLIENTE: ' || una_boleta.nombre);
        dbms_output.put_line('ESTADO DE LA RESERVA: ' || una_boleta.estado_reserva);
        dbms_output.put_line('MONTO BRUTO: ' || una_boleta.monto_bruto);
        dbms_output.put_line('DESCUENTO: ' || una_boleta.descuento);
        dbms_output.put_line('MONTO FINAL: ' || una_boleta.monto_final);
        dbms_output.put_line('ESTADO DE LA TRANSACCIÓN: ' || una_boleta.estado_transaccion);

        v_contador := v_contador + 1;
    END LOOP;

END;
/