CREATE TABLE IF NOT EXISTS vacancy (
	vacancy_id 			SERIAL PRIMARY KEY,
	title 				VARCHAR(300) NOT NULL,
	compensation_from 		NUMERIC(23,5),
	compensation_to 		NUMERIC(23,5),
	description 			TEXT,
	area_id				INTEGER NOT NULL,
	employer_id			INTEGER NOT NULL,
	rec_create_dttm 		TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	rec_update_dttm 		TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE IF NOT EXISTS resume (
	resume_id 			SERIAL PRIMARY KEY,
	title 				VARCHAR(300) NOT NULL,
	compensation 			NUMERIC(23,5),
	description 			TEXT,
	area_id				INTEGER NOT NULL,
	employee_id			INTEGER NOT NULL,
	rec_create_dttm 		TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	rec_update_dttm 		TIMESTAMP WITHOUT TIME ZONE  
);


CREATE TABLE IF NOT EXISTS specialization (
    specialization_id 			SERIAL PRIMARY KEY,
    title 				VARCHAR(300),
    rec_create_dttm 			TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    rec_update_dttm	 		TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE IF NOT EXISTS respond (
    vacancy_id 				INTEGER NOT NULL  REFERENCES vacancy(vacancy_id) ON DELETE CASCADE,
    resume_id 				INTEGER NOT NULL REFERENCES resume(resume_id) ON DELETE CASCADE,
    rec_create_dttm 			TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    rec_update_dttm	 		TIMESTAMP WITHOUT TIME ZONE,
    PRIMARY KEY (vacancy_id, resume_id)
);

CREATE TABLE IF NOT EXISTS vacancy_specialization (
    specialization_id 			INTEGER NOT NULL  REFERENCES specialization(specialization_id) ON DELETE CASCADE,
    vacancy_id 				INTEGER NOT NULL REFERENCES vacancy(vacancy_id) ON DELETE CASCADE,
    rec_create_dttm 			TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    rec_update_dttm 			TIMESTAMP WITHOUT TIME ZONE,
    PRIMARY KEY (specialization_id, vacancy_id)
);

CREATE TABLE IF NOT EXISTS resume_specialization (
    specialization_id   		INTEGER NOT NULL REFERENCES specialization(specialization_id) ON DELETE CASCADE,
    resume_id 				INTEGER NOT NULL REFERENCES resume(resume_id) ON DELETE CASCADE,
    rec_create_dttm 			TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    rec_update_dttm 			TIMESTAMP WITHOUT TIME ZONE,
    PRIMARY KEY (specialization_id, resume_id)
); 