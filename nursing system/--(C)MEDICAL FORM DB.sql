--(C)MEDICAL FORM DB
--Medical background & narrative
CREATE TABLE medical_records (
  record_id             INTEGER PRIMARY KEY AUTOINCREMENT,
  child_id              INTEGER NOT NULL REFERENCES children(child_id),
  known_history         TEXT    NOT NULL,
  allergies             TEXT,
  current_medications   TEXT,
  vaccination_status    TEXT,
  special_needs         TEXT,
  additional_info       TEXT,
  nurse_name            TEXT    NOT NULL,
  nurse_signature       TEXT    NOT NULL,
  record_date           DATE    NOT NULL
);

-- Immunization checklist
CREATE TABLE immunizations (
  imm_id        INTEGER PRIMARY KEY AUTOINCREMENT,
  child_id      INTEGER NOT NULL REFERENCES children(child_id),
  type          TEXT    NOT NULL,   -- 'BCG','POLIO','DPT',etc.
  last_date     DATE
);

--Current health metrics
CREATE TABLE health_status (
  status_id      INTEGER PRIMARY KEY AUTOINCREMENT,
  child_id       INTEGER NOT NULL REFERENCES children(child_id),
  weight_kg      REAL    NOT NULL,
  height_cm      REAL    NOT NULL,
  blood_pressure TEXT    NOT NULL,
  temperature    REAL    NOT NULL,
  observations   TEXT
);

--