CREATE DATABASE my_expenses;
USE my_expenses;

CREATE TABLE categories (
    cat_id INT AUTO_INCREMENT PRIMARY KEY,
    cat_name VARCHAR(50) NOT NULL
);

CREATE TABLE expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    category_id INT,
    expense_date DATE NOT NULL,
    description TEXT,
    payment_mode VARCHAR(20),
    FOREIGN KEY (category_id) REFERENCES categories(cat_id)
);

INSERT INTO categories (cat_name) VALUES
('Food'),
('Travel'),
('Shopping'),
('Entertainment'),
('Bills'),
('Other');

INSERT INTO expenses (amount, category_id, expense_date, description, payment_mode) VALUES
(250, 1, '2024-10-05', 'Pizza with friends', 'UPI'),
(120, 1, '2024-10-08', 'Lunch at canteen', 'Cash'),
(500, 2, '2024-10-10', 'Metro card recharge', 'UPI'),
(2000, 3, '2024-10-12', 'New headphones', 'Card'),
(150, 4, '2024-10-15', 'Movie ticket', 'UPI'),
(1800, 5, '2024-10-20', 'Mobile bill', 'Card'),
(80, 1, '2024-10-22', 'Coffee', 'Cash'),
(300, 2, '2024-10-25', 'Cab to station', 'UPI'),
(450, 4, '2024-10-28', 'Weekend party', 'Cash'),
(1000, 5, '2024-10-30', 'Electricity bill', 'UPI');

SELECT * FROM expenses;

SELECT SUM(amount) AS total_spent FROM expenses;

SELECT c.cat_name, SUM(e.amount) AS total
FROM expenses e
JOIN categories c ON e.category_id = c.cat_id
GROUP BY c.cat_name
ORDER BY total DESC;

SELECT description, amount, expense_date 
FROM expenses 
ORDER BY amount DESC 
LIMIT 1;

SELECT AVG(amount) AS avg_per_expense FROM expenses;