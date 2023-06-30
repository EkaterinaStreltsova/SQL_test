-- Создаем и наполняем семпловые таблицы:
-- Users

CREATE TABLE Users (
    userId INTEGER,
    age INTEGER
);

INSERT INTO Users (userId, age) VALUES
    (1, 18),
    (2, 22),
    (3, 25),
    (4, 32),
    (5, 35),
    (6, 43),
    (7, 50);

-- Purchases

CREATE TABLE Purchases (
    purchaseId VARCHAR(20), 
    userId INTEGER,
    itemId VARCHAR(20),
    date DATE
);

INSERT INTO Purchases (purchaseId, userId, itemId, date) VALUES
    ('123klm', 1, 'yellow duck', '2022-01-01'),
    ('567klm', 1, 'easy game', '2022-02-12'),
    ('568klm', 2, 'purple pear', '2022-03-08'),
    ('569klm', 3, 'brown bear', '2022-01-25'),
    ('589klm', 4, 'pink flamingo', '2022-02-15'),
    ('611klm', 5, 'yellow duck', '2022-01-21'),
    ('619klm', 5, 'pink flamingo', '2022-02-23'),
    ('620klm', 6, 'easy game', '2022-03-16'),
    ('649klm', 7, 'pink flamingo', '2022-02-01'),
    ('690klm', 7, 'brown bear', '2022-02-10'),
    ('631klm', 5, 'yellow duck', '2022-01-09');

-- Items

CREATE TABLE Items (
    itemId VARCHAR(20),
    price INTEGER
);

INSERT INTO Items (itemId, price) VALUES
    ('yellow duck', 450),
    ('easy game', 300),
    ('purple pear', 290),
    ('brown bear', 700),
    ('pink flamingo', 500);
