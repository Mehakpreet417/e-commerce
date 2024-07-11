CREATE DATABASE IF NOT EXISTS product_db;

USE product_db;

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(255) NOT NULL,
    sale_status VARCHAR(50) NOT NULL,
    description TEXT,
    image_url VARCHAR(255)
);

INSERT INTO products (name, price, category, sale_status, description, image_url) VALUES
('Reckless', 19.99, 'Books', 'On Sale', 'Lauren Robets', 'img/b1.png'),
('Shirt', 29.99, 'Clothing', 'Not On Sale', 'Description', 'img/c1.jpg'),
('Earbuds', 39.99, 'Electronics', 'On Sale', 'Description', 'img/e1.png'),
('The Gruffalo', 49.99, 'Books', 'Not On Sale', 'Julai Dunaldson', 'img/b2.png'),
('Colorfull Shirt', 59.99, 'Clothing', 'On Sale', 'Description', 'img/c2.jpg'),
('Mouse', 69.99, 'Electronics', 'Not On Sale', 'Descriptio', 'img/e2.png'),
('Gulzar', 79.99, 'Books', 'On Sale', 'DhoopAaand', 'img/b3.png'),
('Shirt', 89.99, 'Clothing', 'Not On Sale', 'Description', 'img/c3.jpg'),
('Mouse', 99.99, 'Electronics', 'On Sale', 'Description', 'img/e3.png'),
('Camera', 109.99, 'Electronics', 'Not On Sale', 'Description', 'img/e4.png'),
('Shirt', 119.99, 'Clothing', 'On Sale', 'Description', 'img/c4.jpg'),
('Sudha Murati', 129.99, 'Books', 'Not On Sale', 'Grandmother Stories', 'img/b4.png'),
('Ed finds a Home', 19.99, 'Books', 'On Sale', 'Alia Bhatt', 'img/b5.png'),
('Tee-Shirt', 29.99, 'Clothing', 'Not On Sale', 'Description', 'img/c5.jpg'),
('Mobile', 39.99, 'Electronics', 'On Sale', 'Description', 'img/e5.png'),
('Jacket', 49.99, 'Clothing', 'Not On Sale', 'Description', 'img/c6.jpg'),
('Baby Be Kind', 59.99, 'Books', 'On Sale', 'Jane Coven', 'img/b6.png'),
('Speaker', 69.99, 'Electronics', 'Not On Sale', 'Description', 'img/e6.png'),
('Speaker 7', 79.99, 'Electronics', 'On Sale', 'Description', 'img/e7.png'),
('NCERT', 89.99, 'Books', 'Not On Sale', 'NEET Special', 'img/b7.png'),
('Shirt', 99.99, 'Clothing', 'On Sale', 'Description', 'img/c7.jpg'),
('Shirt', 109.99, 'Clothing', 'Not On Sale', 'Description', 'img/c8.jpg'),
('rosarita', 119.99, 'Books', 'On Sale', 'Anita Desai', 'img/b8.png'),
('Decor-Lights', 129.99, 'Electronics', 'Not On Sale', 'Description', 'img/e8.png'),
('Ramayan', 19.99, 'Books', 'On Sale', 'Duseyanth', 'img/b9.png'),
('Jacket', 29.99, 'Clothing', 'Not On Sale', 'Description', 'img/c9.jpg'),
('Lamp', 39.99, 'Electronics', 'On Sale', 'Description', 'img/e9.png'),
('Top', 49.99, 'Clothing', 'Not On Sale', 'Description', 'img/c10.jpg'),
('Bulb', 59.99, 'Electronics', 'On Sale', 'Description', 'img/e10.png'),
('Harry Potter', 69.99, 'Books', 'Not On Sale', 'J.K. Rowing', 'img/b10.png'),
('Fan', 79.99, 'Electronics', 'On Sale', 'Description', 'img/e11.png'),
('Tee-Shirt', 89.99, 'Clothing', 'Not On Sale', 'Description', 'img/c11.png'),
('That Night', 99.99, 'Books', 'On Sale', 'Nidhi Upadhyay', 'img/b11.png'),
('Top', 109.99, 'Clothing', 'Not On Sale', 'Description', 'img/c12.jpg'),
('Before the coffee gets cold', 119.99, 'Books', 'On Sale', 'Tosikazu', 'img/b12.png');