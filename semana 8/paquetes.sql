select * from evento;
select * from LOCALIDAD_EVENTO;

--SPEC (PARTE PUBLICA DEL PAQUETE)

CREATE OR REPLACE PACKAGE pkg_vender_entradas
AS

    g_total_vendidas NUMBER := 0;

    FUNCTION fn_devolver_stock(id_localidad_evento IN NUMBER) RETURN NUMBER;

    PROCEDURE sp_descontar_stock(p_localidad_evento_id IN NUMBER,
                                p_cantidad_entradas IN NUMBER);

END pkg_vender_entradas;
/

CREATE OR REPLACE PACKAGE BODY pkg_vender_entradas
AS
    v_stock NUMBER;

    FUNCTION fn_devolver_stock(id_localidad_evento IN NUMBER) RETURN NUMBER
    AS
    BEGIN
        SELECT stock_disponible
        INTO v_stock
        FROM localidad_evento
        WHERE localidad_evento_id = id_localidad_evento;

        RETURN v_stock;
    END fn_devolver_stock;

    PROCEDURE sp_descontar_stock(p_localidad_evento_id IN NUMBER,
                                p_cantidad_entradas IN NUMBER)
    AS
        v_stock NUMBER;
    BEGIN
        v_stock := fn_devolver_stock(p_localidad_evento_id);

        IF v_stock <= 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Entradas agotadas.');
        END IF;

        UPDATE localidad_evento
        SET stock_disponible = stock_disponible - p_cantidad_entradas
        WHERE localidad_evento_id = p_localidad_evento_id;

        COMMIT;

        g_total_vendidas := g_total_vendidas + p_cantidad_entradas;
    END sp_descontar_stock;

END pkg_vender_entradas;
/

DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Stock disponible: ' || pkg_vender_entradas.FN_DEVOLVER_STOCK(1));
   
   pkg_vender_entradas.SP_DESCONTAR_STOCK(1, 5);
   
    DBMS_OUTPUT.PUT_LINE('Stock disponible después de la venta: ' || pkg_vender_entradas.FN_DEVOLVER_STOCK(1));
END;
/