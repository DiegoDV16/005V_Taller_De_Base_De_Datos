select * from ticket;
select * from transaccion_pago;
select * from cliente;
select * from reserva_temporal;

DECLARE
    cursor c_ticket_emitidos is 
    select rt.reserva_id, rt.cliente_id, c.nombre, c.apellido, 
    tp.monto_final as precio_pagado, tp.metodo_pago, t.codigo_ticket
    from reserva_temporal rt
    join cliente c on rt.cliente_id = c.cliente_id
    join transaccion_pago tp on rt.reserva_id = tp.reserva_id
    join ticket t on rt.reserva_id = t.reserva_id
    where t.ESTADO = 'EMITIDO';


BEGIN
    dbms_output.put_line('*** TICKETS EMITIDOS ***');
    FOR un_ticket IN c_ticket_emitidos LOOP
        dbms_output.put_line('RESERVA ID: ' || un_ticket.reserva_id);
        dbms_output.put_line('CLIENTE: ' || un_ticket.nombre || ' ' || un_ticket.apellido);
        dbms_output.put_line('PRECIO PAGADO: ' || un_ticket.precio_pagado);
        dbms_output.put_line('MÉTODO DE PAGO: ' || un_ticket.metodo_pago);
        dbms_output.put_line('CÓDIGO DE TICKET: ' || un_ticket.codigo_ticket);
        dbms_output.put_line('-----------------------------');
    END LOOP;

    EXCEPTION
        WHEN  CURSOR_ALREADY_OPEN THEN
            dbms_output.put_line('El cursor ya está abierto.');
        WHEN INVALID_CURSOR THEN
            dbms_output.put_line('El cursor es inválido.');
        WHEN OTHERS THEN
            dbms_output.put_line('Ocurrió un error inesperado: ' || SQLERRM);
        
        IF c_ticket_emitidos%ISOPEN THEN
            CLOSE c_ticket_emitidos;
        END IF;

    
END;
/