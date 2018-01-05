DROP TABLE IF EXISTS users;

CREATE TABLE users (
id INTEGER PRIMARY KEY,
f_name TEXT NOT NULL,
l_name TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
body TEXT,
user_id INTEGER NOT NULL,

FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
id INTEGER PRIMARY KEY,
user_id INTEGER NOT NULL,
question_id INTEGER NOT NULL
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
id INTEGER PRIMARY KEY,
question_id INTEGER NOT NULL,
parent_replies_id INTEGER,
body TEXT NOT NULL,
user_id INTEGER NOT NULL,

FOREIGN KEY(parent_replies_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
id INTEGER PRIMARY KEY,
user_id INTEGER NOT NULL,
question_id INTEGER NOT NULL
);

INSERT INTO
  users (f_name, l_name)
VALUES
  ('Neil', 'Richardson'),
  ('Katie', 'Noonan'),
  ('Brian', 'Vann');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Why do we need foreign keys?', 'Hey, what''s the deal with these foreign keys?', 3),
  ('Will the Warriors win the championship?', 'Oh my god the Warriors would win!', 1),
  ('Did you shave?', 'I noticed that you shaved.',2);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ('1', '1'),
  ('2', '1'),
  ('3', '1'),
  ('1', '2'),
  ('2', '2'),
  ('2', '3');

INSERT INTO
  replies (question_id, parent_replies_id, body, user_id)
VALUES
  ('1', null, 'You don''t need so many.', '1'),
  ('1', null, 'I think you are right.', '2'),
  ('1', null, 'Hey! Ok.', '3'),
  ('1', '3', 'Good job Brain.', '1'),
  ('1', '4', 'Thank you.', '3');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ('1', '1'),
  ('2', '1'),
  ('3', '1'),
  ('1', '2'),
  ('2', '2'),
  ('3', '3');
