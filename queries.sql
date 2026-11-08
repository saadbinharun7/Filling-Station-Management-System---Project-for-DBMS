-- 1. Fuel Table (Original 5 rows)

CREATE TABLE Fuel (
    Fuel_Id INTEGER PRIMARY KEY,
    Fuel_Name TEXT NOT NULL,
    Price_per_liter DECIMAL(6,2) NOT NULL,
    Status TEXT NOT NULL
);

-- 2. StorageTank Table (30 rows with realistic capacities and stocks)

CREATE TABLE StorageTank (
    Tank_Id INTEGER PRIMARY KEY,
    Fuel_Id INTEGER,
    Capacity INT,
    Stock INT,
    Location VARCHAR(50),
    Pump_Id INT,
    FOREIGN KEY (Fuel_Id) REFERENCES Fuel(Fuel_Id)
);

-- 3. Customer Table (30 rows with realistic names and randomized local phone formats)

CREATE TABLE Customer (
    Customer_Id INTEGER PRIMARY KEY,
    Customer_Name VARCHAR(20) NOT NULL,
    Customer_phone_no VARCHAR(15)
);

-- 4. Vehicle Table (30 rows, supporting multiple vehicles per customer)

CREATE TABLE Vehicle (
    Vehicle_Id INTEGER PRIMARY KEY,
    Vehicle_type VARCHAR(30) NOT NULL,
    Fuel_Id INTEGER,
    Customer_Id INTEGER,
    FOREIGN KEY (Fuel_Id) REFERENCES Fuel(Fuel_Id),
    FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id)
);

-- 5. Sales_transaction Table (30 rows with realistic dates and amounts)

CREATE TABLE Sales_transaction (
    Sale_Id INTEGER PRIMARY KEY,
    Customer_Id INTEGER NOT NULL,
    Sale_date DATE NOT NULL,
    Quantity DECIMAL(20,2),
    Total_amount DECIMAL(20,2),
    FOREIGN KEY (Customer_Id)
        REFERENCES Customer(Customer_Id)
);

-- 6. Payment Table (30 rows)

CREATE TABLE Payment (
    Payment_Id INTEGER PRIMARY KEY,
    Sale_Id INTEGER NOT NULL,
    Payment_Type VARCHAR(20) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Sale_Id)
        REFERENCES Sales_transaction(Sale_Id)
);

-- 7. Sub_Point Table (Original 3 rows)

CREATE TABLE Sub_Point (
    Sub_Point_Id INT PRIMARY KEY AUTO_INCREMENT,
    Sub_Point INT NOT NULL,
    Facility VARCHAR(50)
);

-- 8. Subscription_Plan Table (Original 3 rows)

CREATE TABLE Subscription_Plan (
    Subs_Id INT PRIMARY KEY AUTO_INCREMENT,
    Subs_Plan VARCHAR(20) NOT NULL,
    Sub_Point_Id INT,
    Duration_Months INT NOT NULL,
    FOREIGN KEY (Sub_Point_Id)
        REFERENCES Sub_Point(Sub_Point_Id)
);

-- 9. Subscribers Table (30 rows, mapping multi-vehicle subscriptions)

CREATE TABLE Subscribers (
    Subscriber_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT NOT NULL,
    Subs_Id INT NOT NULL,
    Fuel_Id INT NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (Customer_Id)
        REFERENCES Customer(Customer_Id),

    FOREIGN KEY (Subs_Id)
        REFERENCES Subscription_Plan(Subs_Id),

    FOREIGN KEY (Fuel_Id)
        REFERENCES Fuel(Fuel_Id)

    
);

INSERT INTO Fuel VALUES
(1, 'Octen', 145.00, 'available'),
(2, 'Diesel', 115.00, 'available'),
(3, 'LPG', 70.40, 'available'),
(4, 'Lubricant', 450.00, 'not available'),
(5, 'Petrol / Gasoline', 140.00, 'not available');


INSERT INTO StorageTank VALUES
(1, 1, 10000, 6450, 'Uttara Sector 3', 201),
(2, 2, 15000, 11200, 'Mirpur 12', 202),
(3, 3, 8000, 4300, 'Gulshan Avenue', 203),
(4, 4, 5000, 1500, 'Banani Road 11', 204),
(5, 5, 12000, 8900, 'Dhanmondi 27', 205),
(6, 1, 10000, 7800, 'Tejgaon Industrial Area', 206),
(7, 2, 14000, 9500, 'Mohakhali DOHS', 207),
(8, 3, 9000, 3100, 'Bashundhara R/A', 208),
(9, 4, 6000, 450, 'Savar Bypass', 209),
(10, 5, 7000, 5100, 'Tongi Station Road', 210),
(11, 1, 8000, 4200, 'Uttara Sector 11', 211),
(12, 2, 5000, 1800, 'Mirpur-10 Circle', 212),
(13, 3, 4000, 2900, 'Pallabi Extension', 213),
(14, 4, 4500, 3100, 'Baridhara DOHS', 214),
(15, 5, 6000, 3700, 'Gulshan-2 Circle', 215),
(16, 1, 5000, 2400, 'Rampura Bridge', 216),
(17, 2, 11000, 6300, 'Malibagh Railgate', 217),
(18, 3, 13000, 10500, 'Signboard Narayanganj', 218),
(19, 4, 10000, 3800, 'Airport Road', 219),
(20, 5, 6000, 4900, 'Khilkhet Overbridge', 220),
(21, 1, 9500, 8100, 'Keraniganj', 221),
(22, 2, 5000, 2250, 'Jatrabari Square', 222),
(23, 3, 4000, 1900, 'Mohammadpur Bus Stand', 223),
(24, 4, 4500, 4000, 'Shyamoli', 224),
(25, 5, 4000, 2100, 'Agargaon', 225),
(26, 1, 3000, 1200, 'Farmgate', 226),
(27, 2, 3500, 2700, 'Karwan Bazar', 227),
(28, 3, 10000, 7600, 'Segunbagicha', 228),
(29, 4, 12000, 9100, 'Motijheel', 229),
(30, 5, 10000, 6800, 'Paltan', 230);


INSERT INTO Customer VALUES
(1, 'Tanvir Ahmed', '01712-458921'),
(2, 'Fariha Tabassum', '01834-902314'),
(3, 'Shahriar Hossain', '01925-671403'),
(4, 'Nusrat Jahan', '01678-234512'),
(5, 'Rakib Hasan', '01552-891043'),
(6, 'Sadia Afrin', '01723-567890'),
(7, 'Imtiaz Mahmud', '01845-123478'),
(8, 'Lamia Islam', '01911-345678'),
(9, 'Zubayer Rahman', '01622-789012'),
(10, 'Farzana Yasmin', '01533-456789'),
(11, 'Mahbub Alam', '01788-901234'),
(12, 'Anika Tasnim', '01899-012345'),
(13, 'Shariful Islam', '01977-234567'),
(14, 'Priya Sarker', '01644-567890'),
(15, 'Sabbir Hossain', '01566-789012'),
(16, 'Mumu Akter', '01733-112233'),
(17, 'Rashed Khan', '01822-445566'),
(18, 'Tania Sultana', '01955-778899'),
(19, 'Al-Amin Mia', '01633-221144'),
(20, 'Bristy Roy', '01544-998877'),
(21, 'Fahim Faisal', '01744-332211'),
(22, 'Nadia Chowdhury', '01866-554433'),
(23, 'Sumon Karmakar', '01988-112244'),
(24, 'Mehedi Hasan', '01611-667788'),
(25, 'Nazmul Haque', '01799-334455'),
(26, 'Sabrina Yesmin', '01877-990011'),
(27, 'Juel Rana', '01966-223344'),
(28, 'Moniruzzaman', '01655-445566'),
(29, 'Rumana Khatun', '01577-889900'),
(30, 'Asif Akbar', '01722-556677');


INSERT INTO Vehicle VALUES
(101, 'Bike', 1, 1),
(102, 'Car', 2, 1),
(103, 'Bus', 3, 1),
(104, 'Truck', 2, 2),
(105, 'Microbus', 5, 2),
(106, 'CNG Auto Rickshaw', 3, 3),
(107, 'Pickup', 2, 3),
(108, 'Van', 1, 4),
(109, 'Jeep', 5, 5),
(110, 'Motorcycle', 1, 6),
(111, 'SUV', 2, 7),
(112, 'Covered Van', 2, 8),
(113, 'Minibus', 2, 9),
(114, 'Taxi Cab', 3, 10),
(115, 'Electric Hybrid Car', 5, 11),
(116, 'Sports Car', 1, 12),
(117, 'Heavy Truck', 2, 13),
(118, 'Delivery Scooter', 1, 14),
(119, 'Private Coach', 2, 15),
(120, 'Ambulance', 5, 16),
(121, 'Fire Service Truck', 2, 17),
(122, 'Police Patrol Car', 1, 18),
(123, 'Micro Truck', 2, 19),
(124, 'Three Wheeler', 3, 20),
(125, 'Tour Bus', 2, 21),
(126, 'Cargo Lorry', 2, 22),
(127, 'Executive Sedan', 1, 23),
(128, 'Cruiser Bike', 1, 24),
(129, 'City Bus', 2, 25),
(130, 'Postal Van', 1, 26);


INSERT INTO Sales_transaction VALUES
(1001, 1, '2026-01-10', 45.00, 6525.00),
(1002, 2, '2026-01-12', 32.50, 3737.50),
(1003, 3, '2026-01-15', 20.00, 1408.00),
(1004, 4, '2026-01-18', 60.00, 6900.00),
(1005, 5, '2026-01-20', 15.50, 2247.50),
(1006, 6, '2026-01-22', 40.00, 4600.00),
(1007, 7, '2026-01-25', 25.00, 2875.00),
(1008, 8, '2026-01-28', 75.00, 8625.00),
(1009, 9, '2026-02-02', 30.00, 4350.00),
(1010, 10, '2026-02-05', 50.00, 3520.00),
(1011, 11, '2026-02-08', 35.00, 5075.00),
(1012, 12, '2026-02-11', 90.00, 10350.00),
(1013, 13, '2026-02-14', 12.00, 1740.00),
(1014, 14, '2026-02-17', 55.00, 6325.00),
(1015, 15, '2026-02-20', 80.00, 9200.00),
(1016, 16, '2026-02-23', 22.00, 3190.00),
(1017, 17, '2026-02-26', 45.00, 5175.00),
(1018, 18, '2026-03-01', 18.50, 1302.40),
(1019, 19, '2026-03-04', 65.00, 7475.00),
(1020, 20, '2026-03-07', 38.00, 5510.00),
(1021, 21, '2026-03-10', 42.00, 4830.00),
(1022, 22, '2026-03-13', 28.00, 3220.00),
(1023, 23, '2026-03-16', 50.00, 5750.00),
(1024, 24, '2026-03-19', 33.00, 4620.00),
(1025, 25, '2026-03-22', 70.00, 8050.00),
(1026, 26, '2026-03-25', 10.00, 1450.00),
(1027, 27, '2026-03-28', 48.00, 5520.00),
(1028, 28, '2026-03-30', 25.00, 2875.00),
(1029, 29, '2026-04-02', 60.00, 8700.00),
(1030, 30, '2026-04-05', 40.00, 4600.00);


INSERT INTO Payment VALUES
(5001, 1001, 'Pre-Paid', 'Paid'),
(5002, 1002, 'Post-Paid', 'Paid'),
(5003, 1003, 'Pre-Paid', 'Paid'),
(5004, 1004, 'Post-Paid', 'Paid'),
(5005, 1005, 'Pre-Paid', 'Pending'),
(5006, 1006, 'Post-Paid', 'Paid'),
(5007, 1007, 'Pre-Paid', 'Paid'),
(5008, 1008, 'Post-Paid', 'Paid'),
(5009, 1009, 'Pre-Paid', 'Paid'),
(5010, 1010, 'Post-Paid', 'Pending'),
(5011, 1011, 'Pre-Paid', 'Paid'),
(5012, 1012, 'Post-Paid', 'Paid'),
(5013, 1013, 'Pre-Paid', 'Paid'),
(5014, 1014, 'Post-Paid', 'Paid'),
(5015, 1015, 'Pre-Paid', 'Pending'),
(5016, 1016, 'Post-Paid', 'Paid'),
(5017, 1017, 'Pre-Paid', 'Paid'),
(5018, 1018, 'Pre-Paid', 'Paid'),
(5019, 1019, 'Pre-Paid', 'Paid'),
(5020, 1020, 'Post-Paid', 'Pending'),
(5021, 1021, 'Pre-Paid', 'Paid'),
(5022, 1022, 'Post-Paid', 'Paid'),
(5023, 1023, 'Pre-Paid', 'Paid'),
(5024, 1024, 'Post-Paid', 'Paid'),
(5025, 1025, 'Pre-Paid', 'Paid'),
(5026, 1026, 'Post-Paid', 'Pending'),
(5027, 1027, 'Pre-Paid', 'Paid'),
(5028, 1028, 'Post-Paid', 'Paid'),
(5029, 1029, 'Pre-Paid', 'Paid'),
(5030, 1030, 'Post-Paid', 'Paid');


INSERT INTO Sub_Point (Sub_Point_Id, Sub_Point, Facility) VALUES
(1, 100, 'Car Wash'),
(2, 200, 'Free Oil change'),
(3, 300, 'Discount');


INSERT INTO Subscription_Plan
(Subs_Id, Subs_Plan, Sub_Point_Id, Duration_Months)
VALUES
(1, '3 month', 1, 3),
(2, '2 month', 2, 2),
(3, '1 month', 3, 1);



INSERT INTO Subscribers
(Subscriber_Id, Customer_Id, Subs_Id, Fuel_Id,  Quantity)
VALUES
(1, 1, 1, 1, 50.00),  -- Customer 1 (Tanvir) - 1st Vehicle (Bike)
(2, 1, 2, 1, 30.00),  -- Customer 1 (Tanvir) - 2nd Vehicle (Car)
(3, 1, 3, 2,  100.00), -- Customer 1 (Tanvir) - 3rd Vehicle (Bus)
(4, 2, 1, 2,  120.00), -- Customer 2 (Fariha) - 1st Vehicle (Truck)
(5, 2, 2, 5,  80.00),  -- Customer 2 (Fariha) - 2nd Vehicle (Microbus)
(6, 3, 3, 3, 40.00),   -- Customer 3 (Shahriar)
(7, 3, 1, 2, 90.00),   -- Customer 3 (Shahriar)
(8, 4, 2, 1, 60.00),   -- Customer 4 (Nusrat)
(9, 5, 1, 5, 75.00),   -- Customer 5 (Rakib)
(10, 6, 3, 1, 25.00),  -- Customer 6 (Sadia)
(11, 7, 2, 2, 110.00), -- Customer 7 (Imtiaz)
(12, 8, 1, 2, 130.00), -- Customer 8 (Lamia)
(13, 9, 3, 2, 85.00),  -- Customer 9 (Zubayer)
(14, 10, 2, 3, 45.00), -- Customer 10 (Farzana)
(15, 11, 1, 5, 55.00), -- Customer 11 (Mahbub)
(16, 12, 3, 1, 35.00), -- Customer 12 (Anika)
(17, 13, 2, 2, 150.00),-- Customer 13 (Shariful)
(18, 14, 1, 1, 20.00), -- Customer 14 (Priya)
(19, 15, 3, 2, 95.00), -- Customer 15 (Sabbir)
(20, 16, 2, 5, 50.00), -- Customer 16 (Mumu)
(21, 17, 1, 2, 125.00),-- Customer 17 (Rashed)
(22, 18, 3, 1, 40.00), -- Customer 18 (Tania)
(23, 19, 2, 2, 100.00),-- Customer 19 (Al-Amin)
(24, 20, 1, 3, 30.00), -- Customer 20 (Bristy)
(25, 21, 3, 2, 140.00),-- Customer 21 (Fahim)
(26, 22, 2, 2, 115.00),-- Customer 22 (Nadia)
(27, 23, 1, 1, 45.00), -- Customer 23 (Sumon)
(28, 24, 3, 1, 25.00), -- Customer 24 (Mehedi)
(29, 25, 2, 2, 105.00),-- Customer 25 (Nazmul)
(30, 26, 1, 1, 35.00); -- Customer 26 (Sabrina)







-- 1. WHERE - Find Available Fuels
-- Available Fuel গুলো দেখাবে
-- so we will check where is status is available or not based on it we will make this table.
SELECT * FROM Fuel
WHERE Status = 'available';


-- 2. ORDER BY - Sort Fuel Prices
-- Fuel-এর দাম ছোট থেকে বড় সাজাবে
SELECT * FROM Fuel
ORDER BY Price_per_liter ASC;


-- 3. LIKE - Search Customer by Name
-- যেসব Customer-এর নাম T দিয়ে শুরু তাদের দেখাবে
SELECT * FROM Customer
WHERE Customer_Name LIKE 'T%';


-- 4. BETWEEN - Find Sales Within Price Range
-- ৩০০০ থেকে ৭০০০ টাকার মধ্যে Sales দেখাবে
SELECT * FROM Sales_transaction
WHERE Total_amount BETWEEN 3000 AND 7000;


-- 5. OR - Find Pre-Paid or Pending Payments
-- Pre-Paid অথবা Pending Payment দেখাবে
SELECT * FROM Payment
WHERE Payment_Type = 'Pre-Paid'
OR Status = 'Pending';


-- 6. COUNT - Count Total Customers and Calculate Total Sales
-- মোট Customer সংখ্যা দেখাবে and সব Sales-এর মোট Amount দেখাবে
SELECT
    C.Total_Customers,
    S.Total_Sales
FROM
    (SELECT COUNT(*) AS Total_Customers
     FROM Customer) AS C
CROSS JOIN
    (SELECT SUM(Total_amount) AS Total_Sales
     FROM Sales_transaction) AS S;



-- 7. HAVING - Find Fuel Used by More Than 5 Vehicles
-- ৫টির বেশি Vehicle-এ ব্যবহৃত Fuel দেখাবে
SELECT F.Fuel_Id, F.Fuel_Name,
       COUNT(V.Vehicle_Id) AS Total_Vehicles
FROM Vehicle V
INNER JOIN Fuel F
ON V.Fuel_Id = F.Fuel_Id
GROUP BY F.Fuel_Id, F.Fuel_Name
HAVING COUNT(V.Vehicle_Id) > 5;


-- 8. CASE WHEN - Categorize Fuel Prices
-- Fuel-এর দাম অনুযায়ী Category তৈরি করবে
SELECT Fuel_Name, Price_per_liter,
CASE
    WHEN Price_per_liter < 100 THEN 'Cheap'
    WHEN Price_per_liter <= 200 THEN 'Medium'
    ELSE 'Expensive'
END AS Price_Category
FROM Fuel;


-- 9. INNER JOIN - Customer and Vehicle Information
-- Customer-এর নাম ও Vehicle-এর তথ্য দেখাবে
SELECT Customer.Customer_Name,
       Vehicle.Vehicle_type
FROM Customer
RIGHT JOIN Vehicle
ON Customer.Customer_Id = Vehicle.Customer_Id;


-- 10. MULTIPLE JOIN - Customer, Sales and Payment
-- Customer-এর নাম, Sales Amount ও Payment Status দেখাবে
SELECT Customer.Customer_Name,
       Sales_transaction.Total_amount,
       Payment.Payment_Type,
       Payment.Status
FROM Customer
INNER JOIN Sales_transaction
ON Customer.Customer_Id = Sales_transaction.Customer_Id
INNER JOIN Payment
ON Sales_transaction.Sale_Id = Payment.Sale_Id;


-- 11. SUBQUERY - Find Fuels Above Average Price
-- গড় দামের চেয়ে বেশি দামের Fuel দেখাবে
SELECT Fuel_Name, Price_per_liter
FROM Fuel
WHERE Price_per_liter >
(
    SELECT AVG(Price_per_liter)
    FROM Fuel
);


-- 12. GROUP BY + HAVING + JOIN + ORDER BY
-- যেসব Customer-এর মোট Sales ৫০০০ টাকার বেশি তাদের দেখাবে
SELECT Customer.Customer_Name,
       SUM(Sales_transaction.Total_amount) AS Total_Sales
FROM Customer
INNER JOIN Sales_transaction
ON Customer.Customer_Id = Sales_transaction.Customer_Id
GROUP BY Customer.Customer_Id, Customer.Customer_Name
HAVING SUM(Sales_transaction.Total_amount) > 5000
ORDER BY Total_Sales DESC;


-- 13. SELF JOIN
-- একই Fuel ব্যবহার করে এমন Vehicle গুলো দেখাবে।

SELECT V1.Vehicle_type, V2.Vehicle_type, V1.Fuel_Id
FROM Vehicle V1
JOIN Vehicle V2
ON V1.Fuel_Id = V2.Fuel_Id
WHERE V1.Vehicle_Id < V2.Vehicle_Id;



-- 14. UNION
-- Available এবং Not Available Fuel একসাথে আলাদা Category সহ দেখাবে।

SELECT Fuel_Name, 'Available' AS Category
FROM Fuel
WHERE Status = 'available'

UNION

SELECT Fuel_Name, 'Not Available' AS Category
FROM Fuel
WHERE Status = 'not available';



-- SELECT * FROM Fuel;
-- SELECT * FROM StorageTank;
-- SELECT * FROM Customer;
-- SELECT * FROM Vehicle;
-- SELECT * FROM Sales_transaction;
-- SELECT * FROM Payment;
-- SELECT * FROM Sub_Point;
-- SELECT * FROM Subscription_Plan;
-- SELECT * FROM Subscribers;