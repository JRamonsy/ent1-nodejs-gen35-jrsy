-- === table users ===
create table users (
	id serial primary key,
	firstname varchar(50),
	lastname varchar(50),
	email varchar(100)
);

insert into users (firstname, lastname, email) values
('Ramón', 'Salas', 'ramon@gmail.com'),
('Abigail', 'Gomez', 'abigail@gmail.com'),
('Diana', 'Jalomo', 'diana@gmail.com');

select * from users;

-- === table posts ===
create table posts (
	id serial primary key,
	creator_id int,
	title varchar(50),
	text text
);

insert into posts (creator_id, title, text) values
('1', 'Logica de programcón', 'Duis elit massa, lobortis in, auctor lobortis diam.'),
('2', 'Principios ventas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
('2', 'Donativos', 'Ut a felis quis odio dapibus vestibulum molestie'),
('3', 'Fundamentos diseño', 'Sed vitae erat leo. Pellentesque iaculis sapien id'),
('3', 'optimización en las venstas', 'Donec mollis justo justo, eget bibendum ipsum.');

select * from posts;


-- === table likes pivote ==
create table likes (
	id serial primary key,
	user_id int,
	post_id int
);

insert into likes (user_id, post_id) values
('1', '2'),
('1', '3'),
('2', '1'),
('2', '3'),
('3', '1');

select * from likes;

-- === post e información del usuario del campo creator_id ===
-- posts -- users
select * from posts inner join users
on posts.creator_id = users.id;

-- === post con lainformación de los usuarios que les dieron likes ===
-- post - likes - users
select * from users inner join likes
on users.id = likes.user_id inner join posts
on likes.post_id = posts.id;

select users.firstname, users.lastname, users.email, likes.post_id 
from users inner join likes
on users.id = likes.user_id inner join posts
on likes.post_id = posts.id;

