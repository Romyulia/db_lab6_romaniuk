-- Функція
SELECT * FROM acting_actors('Business Proposal');

-- Процедура
CALL get_duration('True Beauty');

-- Тригер

INSERT INTO kdramas(kdrama_id, kdrama_name, number_of_episodes, airing_date, episode_run_time)
VALUES (133091, 'My Sweet Dear', 18, DATE '2021-10-21', 15);

SELECT * FROM kdramas;

-- DELETE FROM kdramas WHERE kdrama_id = 133091;