-- для запроса на фильтрацию денежных сумм
CREATE INDEX IF NOT EXISTS vacancy_compensation_from_idx ON vacancy (compensation_from);
CREATE INDEX IF NOT EXISTS respond_compensation_to_idx ON vacancy (compensation_to);
CREATE INDEX IF NOT EXISTS vacancy_compensation_from_to_idx ON vacancy (compensation_from, compensation_to);
-- в запросах используем в условие
CREATE INDEX IF NOT EXISTS respond_rec_create_dttm_idx ON respond (rec_create_dttm);
CREATE INDEX IF NOT EXISTS vacancy_rec_create_dttm_idx ON vacancy (rec_create_dttm);
-- используем в сортировке
CREATE INDEX IF NOT EXISTS vacancy_rec_create_dttm_idx ON vacancy (vacancy_id, title);
CREATE INDEX IF NOT EXISTS vacancy_area_id_idx ON vacancy (area_id);