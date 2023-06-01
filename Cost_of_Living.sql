-- COST OF LIVING AROUND THE WORLD

-- x1	Meal, Inexpensive Restaurant (USD)
-- x2	Meal for 2 People, Mid-range Restaurant, Three-course (USD)
-- x3	McMeal at McDonalds (or Equivalent Combo Meal) (USD)
-- x4	Domestic Beer (0.5 liter draught, in restaurants) (USD)
-- x5	Imported Beer (0.33 liter bottle, in restaurants) (USD)
-- x6	Cappuccino (regular, in restaurants) (USD)
-- x7	Coke/Pepsi (0.33 liter bottle, in restaurants) (USD)
-- x8	Water (0.33 liter bottle, in restaurants) (USD)
-- x9	Milk (regular), (1 liter) (USD)
-- x10	Loaf of Fresh White Bread (500g) (USD)
-- x11	Rice (white), (1kg) (USD)
-- x12	Eggs (regular) (12) (USD)
-- x13	Local Cheese (1kg) (USD)
-- x14	Chicken Fillets (1kg) (USD)
-- x15	Beef Round (1kg) (or Equivalent Back Leg Red Meat) (USD)
-- x16	Apples (1kg) (USD)
-- x17	Banana (1kg) (USD)
-- x18	Oranges (1kg) (USD)
-- x19	Tomato (1kg) (USD)
 -- 20	Potato (1kg) (USD)
-- x21	Onion (1kg) (USD)
-- x22	Lettuce (1 head) (USD)
-- x23	Water (1.5 liter bottle, at the market) (USD)
-- x24	Bottle of Wine (Mid-Range, at the market) (USD)
-- x25	Domestic Beer (0.5 liter bottle, at the market) (USD)
-- x26	Imported Beer (0.33 liter bottle, at the market) (USD)
-- x27	Cigarettes 20 Pack (Marlboro) (USD)
-- x28	One-way Ticket (Local Transport) (USD)
-- x29	Monthly Pass (Regular Price) (USD)
-- x30	Taxi Start (Normal Tariff) (USD)
-- x31	Taxi 1km (Normal Tariff) (USD)
-- x32	Taxi 1hour Waiting (Normal Tariff) (USD)
-- x33	Gasoline (1 liter) (USD)
-- x34	Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car) (USD)
-- x35	Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car) (USD)
-- x36	Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment (USD)
-- x37	1 min. of Prepaid Mobile Tariff Local (No Discounts or Plans) (USD)
-- x38	Internet (60 Mbps or More, Unlimited Data, Cable/ADSL) (USD)
-- x39	Fitness Club, Monthly Fee for 1 Adult (USD)
-- x40	Tennis Court Rent (1 Hour on Weekend) (USD)
-- x41	Cinema, International Release, 1 Seat (USD)
-- x42	Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child (USD)
-- x43	International Primary School, yearly for 1 Child (USD)
-- x44	1 Pair of Jeans (Levis 501 Or Similar) (USD)
-- x45	1 Summer Dress in a Chain Store (Zara, H&M, …) (USD)
-- x46	1 Pair of Nike Running Shoes (Mid-Range) (USD)
-- x47	1 Pair of Men Leather Business Shoes (USD)
-- x48	Apartment (1 bedroom) in City Centre (USD)
-- x49	Apartment (1 bedroom) Outside of Centre (USD)
-- x50	Apartment (3 bedrooms) in City Centre (USD)
-- x51	Apartment (3 bedrooms) Outside of Centre (USD)
-- x52	Price per Square Meter to Buy Apartment in City Centre (USD)
-- x53	Price per Square Meter to Buy Apartment Outside of Centre (USD)
-- x54	Average Monthly Net Salary (After Tax) (USD)
-- x55	Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate
-- data_quality	0 if Numbeo considers that more contributors are needed to increase data quality, else 1 

SELECT * FROM project.costofliving
ORDER BY MyUnknownColumn DESC; 
-- Deleting Empty cells and creating a new table Called COF
CREATE TABLE COF(
SELECT*
FROM costofliving
WHERE  'x1,x2,x3,x4,x5,x6, x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,X26,x27,x28,x29,x30,x31,x32,x33,x34,x35,X36,x37,X38,X39,x40,X41,X42,x43,X44,x45,x46,x47,x48,x49,X50,x51,x52,x53,x54x55,'IS NOT NULL
);

SELECT*
FROM COF;
 
 DESCRIBE COF;
-- Adding a new Column to the TABLE
 ALTER TABLE COF ADD CityN INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ADD PRIMARY KEY (CItyN);
   
-- Deleting Data_qualityTable
ALTER TABLE COF
DROP data_quality;

-- Renaming the Column I need for this analysis
-- x7	Coke/Pepsi (0.33 liter bottle, in restaurants) (USD)
ALTER TABLE COF
RENAME COLUMN cokeOrpepsi TO Coke_Pepsi;
-- x9	Milk (regular), (1 liter) (USD)
ALTER TABLE COF
RENAME COLUMN x9 TO Milk,
RENAME COLUMN X10 TO Bread,
RENAME COLUMN x11 TO Rice,
RENAME COLUMN x12 TO Eggs,
RENAME COLUMN x16 TO Apple,
RENAME COLUMN x17 TO Banana,
RENAME COLUMN x18 TO Oranges,
RENAME COLUMN x19 TO Tomato,
RENAME COLUMN x20 TO Potato,
RENAME COLUMN x21 TO Onion,
RENAME COLUMN x23 TO Water,
RENAME COLUMN x24 TO Wine,
RENAME COLUMN x33 TO Gasoline,
RENAME COLUMN x38 TO Internet,
RENAME COLUMN x54 TO AVGSalary;

-- Average of Products
SELECT 
    AVG(Coke_Pepsi) , AVG(Milk),
    AVG(Bread), AVG(Rice),
    AVG(Eggs), AVG(Apple),
    AVG(Banana), AVG(Oranges),
    AVG(Tomato), AVG(Potato),
    AVG(Onion), AVG(Water),
    AVG(Wine), AVG(Gasoline),
    AVG(Internet), AVG(AVGSalary)
FROM COF;
-- selecting the City with the Highest Salary
SELECT City , AVGSalary
 FROM COF
 WHERE AVGSalary =(
 SELECT MAX(AVGSalary)
 FROM COF);
 -- Selecting the City With the Lowerest Salary
 SELECT City , AVGSalary
 FROM COF
 WHERE AVGSalary =(
 SELECT MIN(AVGSalary)
 FROM COF);
 
 SELECT*
FROM cof;

SELECT CityN AS NumberOfCity, city ,
country,Coke_Pepsi  ,Milk, Rice,
Eggs,Apple, Banana,Oranges,
Tomato,Potato,Onion,Water,
Wine,Gasoline, Internet,AVGSalary
FROM COF;
 
 -- Find the Number of Country
 WITH CTE_Country AS( SELECT
 DISTINCT(Country) 
 FROM COF)
 SELECT COUNT(country) AS NumberOfCountry
 FROM CTE_country;
 
 -- Finding Number of Country
SELECT COUNT(City)
FROM COF;

-- Finding the Names of country
SELECT country, City
FROM COF
ORDER BY Country;

-- Renaming Colunm
ALTER TABLE COF
RENAME COLUMN X48 TO One_bedroom_in_the_City,
RENAME COLUMN X49 TO One_bedroom_outside_the_City;

-- Finding the average 	price of One Bedroom apartment by City
SELECT City,(One_bedroom_in_the_City + One_bedroom_outside_the_City)/2 AS AVG_Price_Of_One_Bedroom
FROM COF
ORDER BY City;

-- Renaming Column x50 and x51
ALTER TABLE COF
RENAME COLUMN X50 TO Three_Bedroom_in_the_City,
RENAME COLUMN X51 TO Three_Bedroom_Outside_the_City;

-- Finding the average 	price of Three Bedroom apartment by City
SELECT City,(Three_Bedroom_in_the_City+Three_Bedroom_Outside_the_City)/2 AS AVG_Price_Of_Three_Bedroom
FROM COF
ORDER BY City;

