-- Тригер, який при вставці нового рядка в таблицю kdramas приводить назву дорами у верхній регістр.

CREATE OR REPLACE FUNCTION upper_kdrama_name() RETURNS trigger
LANGUAGE 'plpgsql'
AS
$$
BEGIN
	UPDATE kdramas SET kdrama_name = upper(kdrama_name)
	WHERE kdramas.kdrama_id = NEW.kdrama_id;
	RETURN NULL;
END;
$$;

CREATE TRIGGER kdrama_name_insert
AFTER INSERT ON kdramas
FOR EACH ROW EXECUTE FUNCTION upper_kdrama_name();