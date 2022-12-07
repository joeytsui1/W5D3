
CREATE TABLE users (
    id INTEGER PRIMARY KEY, 
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
)

CREATE TABLE questions (
    id INTEGER PRIMARY KEY
    title TEXT NOT NULL,
    body TEXT NOT NULL
    author_id INTEGER NOT NULL
    FOREIGN KEY (author_id) REFERENCES users(id)
)

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL

    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
)

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    q_subject TEXT NOT NULL,
    parent_reply INTEGER,
    users_id INTEGER NOT NULL

    FOREIGN KEY (parent) REFERENCES (id)
    FOREIGN KEY (users_id) REFERENCES users(id)
 )