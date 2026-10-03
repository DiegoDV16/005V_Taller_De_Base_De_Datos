create or replace function fn_calcular_total_entrada
(p_monto_entrada IN NUMBER, p_descuento_banco IN NUMBER) RETURN NUMBER
IS
    v_resultado NUMBER;

BEGIN
    v_resultado := p_monto_entrada - (p_monto_entrada * p_descuento_banco) / 100;

    RETURN v_resultado;
END fn_calcular_total_entrada;
/

--100000 - (100000 * 15) / 100 = 85000

DECLARE
    v_precio_evento NUMBER;
    v_descuento_banco NUMBER;
    v_total NUMBER;

BEGIN

    SELECT PRECIO
      INTO v_precio_evento
      FROM LOCALIDAD_EVENTO
     WHERE EVENTO_ID = 1
       AND LOCALIDAD_EVENTO_ID = 1;

    SELECT DESCUENTO_BANCO
      INTO v_descuento_banco
      FROM CONVENIO_BANCO
     WHERE BANCO = 'Bci';

    SELECT FN_CALCULAR_TOTAL_ENTRADA(v_precio_evento, v_descuento_banco)
      INTO v_total
      FROM dual;

    DBMS_OUTPUT.PUT_LINE('Total entrada: ' || v_total);
END;
/

SELECT PRECIO FROM LOCALIDAD_EVENTO WHERE EVENTO_ID = 1 AND LOCALIDAD_EVENTO_ID = 1;
select ROUND(fn_calcular_total_entrada(100000, 15), 0) as total_entrada from dual;