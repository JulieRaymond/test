DROP DATABASE IF EXISTS bdd_test;
CREATE DATABASE bdd_test;
USE bdd_test;

CREATE TABLE blog_user (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    password VARCHAR(255) NOT NULL,
    email VARCHAR(40) NOT NULL,
    date DATETIME DEFAULT NOW(),
    image VARCHAR(255),
    title VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    UNIQUE KEY (name),
    UNIQUE KEY (email)
);

CREATE TABLE article (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(40) NOT NULL,
    content TEXT,
    date DATETIME DEFAULT NOW(),
    image VARCHAR(255),
    blog_user_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (blog_user_id) REFERENCES blog_user(id)
);
CREATE TABLE commentary (
    id INT NOT NULL AUTO_INCREMENT,
    content TEXT,
    date DATETIME DEFAULT NOW(),
    blog_user_id INT,
    article_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (blog_user_id) REFERENCES blog_user(id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);
CREATE TABLE category (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (id),
    UNIQUE KEY (name)
);
CREATE TABLE article_category (
    id INT NOT NULL AUTO_INCREMENT,
    article_id INT,
    category_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (article_id) REFERENCES article(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);