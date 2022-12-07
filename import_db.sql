PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY, 
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users(id, fname, lname)
VALUES
    (1, 'Manny', 'Little'),
    (2, 'Joey', 'Tsui');

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions (id, title, body, author_id)
VALUES
    (1, 'App Academy', 'This is stresfull!', 2);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
    question_follows (id, users_id, questions_id)
VALUES
    (1, 2, 1);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    q_subject TEXT NOT NULL,
    parent_reply INTEGER,
    users_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    FOREIGN KEY (parent_reply) REFERENCES replies(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO
    replies (id, q_subject, parent_reply, users_id, body)
VALUES
    (1, 'School', NULL, 2, 'It will get better.');

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY, 
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

-- INSERT INTO
-- question_likes (id, users_id, questions_id)
-- VALUES
-- ()

