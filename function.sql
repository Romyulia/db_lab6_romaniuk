-- Функція, яка виводить список арторів та їх стать за назвою дорами, в якій вони зіграли

DROP FUNCTION IF EXISTS acting_actors(varchar(50));

CREATE OR REPLACE FUNCTION acting_actors(given_kdrama_name varchar(50))
RETURNS TABLE (actor_name varchar(25), gender text)
LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
		SELECT actors.actor_name,
			CASE
				WHEN actors.gender = 1 THEN 'female'
				ELSE 'male'
			END AS gender
		FROM actors JOIN kdramas_actor
		ON actors.actor_id = kdramas_actor.actor_id
		JOIN kdramas
		ON kdramas_actor.kdrama_id = kdramas.kdrama_id
		WHERE kdramas.kdrama_name = given_kdrama_name;
END;
$$;