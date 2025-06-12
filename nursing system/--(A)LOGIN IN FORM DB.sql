--(A)LOGIN IN FORM DB
-- a users database schema for a nursing management system.
CREATE TABLE users (
  user_id       INTEGER PRIMARY KEY AUTOINCREMENT,
  username      TEXT    NOT NULL UNIQUE,
  password_hash TEXT    NOT NULL,
  role          TEXT    NOT NULL    -- e.g. 'admin', 'nurse', 'socialworker'
);
--stores user information including their role in the system
