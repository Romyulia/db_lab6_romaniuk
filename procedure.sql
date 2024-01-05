-- Процедура, яка виводить кількість серій, час однієї серії та загальний час дорами.

DROP PROCEDURE IF EXISTS get_duration(varchar(50));

CREATE OR REPLACE PROCEDURE get_duration(given_kdrama_name varchar(50))
LANGUAGE plpgsql
AS $$
DECLARE episodes kdramas.number_of_episodes%TYPE;
DECLARE episode_duration kdramas.episode_run_time%TYPE;
DECLARE kdrama_duration INT;
BEGIN
	SELECT number_of_episodes, episode_run_time, number_of_episodes * episode_run_time
	INTO episodes, episode_duration, kdrama_duration
	FROM kdramas
	WHERE kdrama_name = given_kdrama_name;
	RAISE INFO 'Number of episodes: %, One episode duration: %, Kdrama duration: %',
	episodes, episode_duration, kdrama_duration;
END;
$$;

CALL get_duration('True Beauty')