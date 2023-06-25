CREATE TABLE movies(
    id int,
    moviesid int, 
    title varchar(255),
    genre varchar(255)
);

CREATE TABLE ratings(
    id int,
    userid int, 
    movieid int, 
    rating float,
    dtimestamp varchar(255)
);

CREATE TABLE users(
    id int,
    userid int, 
    gender varchar(1), 
    age int,
    occupation int,
    zipcode varchar(5)
);

select * from users where userid=100

select gender, count(*) AS counter from users
GROUP BY gender
ORDER BY counter DESC;