select * from evento;

select * from productora;



DECLARE
    e_sin_eventos_vigentes EXCEPTION;
    v_estado EVENTO.estado%TYPE;

    
BEGIN
    select nombre, fecha_evento, estado, p.productora_id into v_nombre, v_fecha_evento, v_estado, v_productora_id
    from evento 
    join productora p on evento.productora_id = p.productora_id;

    if v_estado != 'VIGENTE' then
        RAISE e_sin_eventos_vigentes;
    end if;

    dbms_output.put_line('evento disponible');

    exception
        WHEN e_sin_eventos_vigentes THEN
            dbms_output.put_line('la productora no registra eventos vigentes en la cartelera.');
        WHEN OTHERS THEN
            dbms_output.put_line('Ocurrió un error inesperado: ' || SQLERRM);

    

 NULL;
END;
/