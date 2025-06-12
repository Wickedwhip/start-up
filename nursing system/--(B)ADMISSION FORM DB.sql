--(B)ADMISSION FORM DB 
--children table
-- stores information about children in the system
CREATE TABLE children (
  child_id       INTEGER PRIMARY KEY AUTOINCREMENT,
  full_name      TEXT    NOT NULL,
  date_of_birth  DATE    NOT NULL,
  gender         TEXT    NOT NULL,
  place_of_birth TEXT,
  nationality    TEXT,
  religion       TEXT,
  tribe          TEXT,
  photo_path     TEXT      -- if you ever store an upload
);

--admission event table
-- stores information about admissions of children
-- This table links children to their admission events
CREATE TABLE admissions (
  admission_id    INTEGER PRIMARY KEY AUTOINCREMENT,
  child_id        INTEGER NOT NULL REFERENCES children(child_id),
  admission_date  DATE    NOT NULL,
  admitted_by     TEXT    NOT NULL,
  reason          TEXT    NOT NULL,
  current_status  TEXT    NOT NULL
);

--background information table
-- stores background information about children
CREATE TABLE backgrounds (
  background_id           INTEGER PRIMARY KEY AUTOINCREMENT,
  child_id                INTEGER NOT NULL REFERENCES children(child_id),
  previous_living_situation TEXT NOT NULL
);

--family members table
-- stores information about existing family members of children
CREATE TABLE family_members (
  member_id     INTEGER PRIMARY KEY AUTOINCREMENT,
  child_id      INTEGER NOT NULL REFERENCES children(child_id),
  name          TEXT    NOT NULL,
  relation      TEXT    NOT NULL,
  contact_phone TEXT
);

--education table
-- stores education-related information for children
CREATE TABLE education (
  education_id         INTEGER PRIMARY KEY AUTOINCREMENT,
  child_id             INTEGER NOT NULL REFERENCES children(child_id),
  schooled_before      BOOLEAN NOT NULL,
  last_school_attended TEXT,
  class_grade          TEXT,
  performance          TEXT,    -- 'good'/'average'/'poor'
  learning_disabilities BOOLEAN
);

--officials table
-- stores information about officials involved in the admission process
CREATE TABLE officials (
  official_id     INTEGER PRIMARY KEY AUTOINCREMENT,
  admission_id    INTEGER NOT NULL REFERENCES admissions(admission_id),
  name            TEXT    NOT NULL,
  role            TEXT    NOT NULL,
  date_filled     DATE    NOT NULL,
  signature       TEXT
);

