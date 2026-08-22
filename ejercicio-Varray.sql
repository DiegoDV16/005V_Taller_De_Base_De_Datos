-- POR MEDIO DEL METODO CONSTRUCTOR DEL OBJETO

DECLARE 
    TYPE frutas is VARRAY(5) OF VARCHAR2(50);

    v_frutera frutas := frutas('Manzana', 'Pera', 'Naranja', 'platano', 'Uva');
BEGIN

    dbms_output.put_line('La frutera contiene: ' ||  v_frutera(3));
END;
/

DECLARE 
    TYPE frutas is VARRAY(5) OF VARCHAR2(50);

    v_frutera frutas := frutas();
BEGIN
    v_frutera.extend;
    V_frutera(1):= 'Manzana';
    dbms_output.put_line('La frutera contiene: ' || V_frutera(1));
END;
/