create schema trading_platform;

use trading_platform;

create table trader_login(
LoginId			int,
TraderId		int,
Username		varchar(25),
Password		varchar(25));

create table trader(
TraderId		int,
FirstName		varchar(25),
LastName		varchar(25),
Email			varchar(50),
DateOfBirth		date,
Address			varchar(100),
City			varchar(25),
State			varchar(25),
Zipcode			int
);

create table employee_login(
LoginId			int,
EmployeeId		int,
Username		varchar(25),
Password		varchar(25));

create table employee(
EmployeeId			int,
FirstName		varchar(25),
LastName		varchar(25),
Email			varchar(50),
DepartmentId	integer,
DateOfBirth		date,
DateOfJoining	date,
Address			varchar(100),
City			varchar(25),
State			varchar(25),
Zipcode			int);

create table department(
DepartmentId	integer,
DpartmentName	varchar(50));

create table portfolio(
PortfolioId			integer,
UserId				integer,
DateOfCreation		date,
DateOfLastUpdate	date,
TotalInvestment		decimal(15,2),
NumberOfStocks		integer
);

create table portfolio_item(
PortfolioItemId		integer,
PortfolioId			integer,
StockId				integer,
Quantity			integer,
Price				decimal(15,2),
DateOfPurchase		date);

create table company(
CompanyId			integer,
CompanyName			varchar(25),
DateOfRegistration	date,
NumberOfStocks		integer);

create table stock(
StockId				integer,
CompanyId			integer,
StockName			varchar(25),
StockTypeId			integer,
PriceOfListing		decimal(15,2),
DateOfListing		date,
Quantity			integer
);

create table stock_type(
StockTypeId			integer,
StockTypeName		varchar(20)
);

create table stock_price(
StockPriceId		integer,
StockId				integer,
PriceCurrent		decimal(15,2),
PriceHigh		decimal(15,2),
PriceLow		decimal(15,2),
PriceOpen		decimal(15,2),
PriceClose		decimal(15,2),
DateOfTrade		date,
Quantity		integer
);

create table stock_order(
OrderId				integer,
UserId				integer,
DateOfOrder			date,
OrderStatus			ENUM('active', 'inactive', 'completed', 'failed'),
TotalAmount			integer,
IsPartialAllowed	boolean);

create table stock_order_item(
OrderItemId		integer,
OrderId			integer,
Quantity		integer,
PriceAsked		decimal(15,2),
Margin			decimal(15,2),
PricePlaced		decimal(15,2),
OrderItemStatus			ENUM('active', 'inactive', 'complete', 'failed'));

-- Insert Dummy Data

INSERT INTO trader_login (LoginId, TraderId, Username, Password) VALUES
(1, 1, 'trader1', 'pass1234'),
(2, 2, 'trader2', 'pass1234'),
(3, 3, 'trader3', 'pass1234'),
(4, 4, 'trader4', 'pass1234'),
(5, 5, 'trader5', 'pass1234');

INSERT INTO trader (TraderId, FirstName, LastName, Email, DateOfBirth, Address, City, State, Zipcode) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '1980-01-01', '123 Street', 'CityName', 'StateName', 12345),
(2, 'Jane', 'Doe', 'jane.doe@email.com', '1981-02-02', '456 Avenue', 'CityName', 'StateName', 23456),
(3, 'Jim', 'Beam', 'jim.beam@email.com', '1982-03-03', '789 Boulevard', 'CityName', 'StateName', 34567),
(4, 'Jack', 'Daniels', 'jack.daniels@email.com', '1983-04-04', '1011 Drive', 'CityName', 'StateName', 45678),
(5, 'Josie', 'Wales', 'josie.wales@email.com', '1984-05-05', '1213 Lane', 'CityName', 'StateName', 56789);

INSERT INTO employee_login (LoginId, EmployeeId, Username, Password) VALUES
(1, 1, 'employee1', 'epass1234'),
(2, 2, 'employee2', 'epass1234'),
(3, 3, 'employee3', 'epass1234'),
(4, 4, 'employee4', 'epass1234'),
(5, 5, 'employee5', 'epass1234');

INSERT INTO employee (EmployeeId, FirstName, LastName, Email, DepartmentId, DateOfBirth, DateOfJoining, Address, City, State, Zipcode) VALUES
(1, 'Ella', 'Fitzgerald', 'ella.fitzgerald@email.com', 1, '1985-06-06', '2005-01-01', '123 Work Street', 'WorkCity', 'WorkState', 67890),
(2, 'Louis', 'Armstrong', 'louis.armstrong@email.com', 2, '1986-07-07', '2006-02-02', '456 Work Avenue', 'WorkCity', 'WorkState', 78901),
(3, 'Duke', 'Ellington', 'duke.ellington@email.com', 3, '1987-08-08', '2007-03-03', '789 Work Boulevard', 'WorkCity', 'WorkState', 89012),
(4, 'Miles', 'Davis', 'miles.davis@email.com', 4, '1988-09-09', '2008-04-04', '1011 Work Drive', 'WorkCity', 'WorkState', 90123),
(5, 'John', 'Coltrane', 'john.coltrane@email.com', 5, '1989-10-10', '2009-05-05', '1213 Work Lane', 'WorkCity', 'WorkState', 12345);

INSERT INTO department (DepartmentId, DpartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Operations');

INSERT INTO portfolio (PortfolioId, UserId, DateOfCreation, DateOfLastUpdate, TotalInvestment, NumberOfStocks) VALUES
(1, 1, '2023-01-01', '2023-01-02', 10000.00, 10),
(2, 2, '2023-02-01', '2023-02-02', 20000.00, 20),
(3, 3, '2023-03-01', '2023-03-02', 30000.00, 30),
(4, 4, '2023-04-01', '2023-04-02', 40000.00, 40),
(5, 5, '2023-05-01', '2023-05-02', 50000.00, 50);

INSERT INTO portfolio_item (PortfolioItemId, PortfolioId, StockId, Quantity, Price, DateOfPurchase) VALUES
(1, 1, 1, 10, 100.00, '2023-01-01'),
(2, 2, 2, 20, 200.00, '2023-02-01'),
(3, 3, 3, 30, 300.00, '2023-03-01'),
(4, 4, 4, 40, 400.00, '2023-04-01'),
(5, 5, 5, 50, 500.00, '2023-05-01');

INSERT INTO company (CompanyId, CompanyName, DateOfRegistration, NumberOfStocks) VALUES
(1, 'Company A', '2010-01-01', 100000),
(2, 'Company B', '2011-02-02', 200000),
(3, 'Company C', '2012-03-03', 300000),
(4, 'Company D', '2013-04-04', 400000),
(5, 'Company E', '2014-05-05', 500000);

INSERT INTO stock (StockId, CompanyId, StockName, StockTypeId, PriceOfListing, DateOfListing, Quantity) VALUES
(1, 1, 'Stock A', 1, 10.00, '2023-01-01', 1000),
(2, 2, 'Stock B', 2, 20.00, '2023-02-01', 2000),
(3, 3, 'Stock C', 3, 30.00, '2023-03-01', 3000),
(4, 4, 'Stock D', 4, 40.00, '2023-04-01', 4000),
(5, 5, 'Stock E', 5, 50.00, '2023-05-01', 5000);

INSERT INTO stock_type (StockTypeId, StockTypeName) VALUES
(1, 'Common'),
(2, 'Preferred'),
(3, 'Convertible'),
(4, 'Exchange-Traded'),
(5, 'Derivative');

INSERT INTO stock_price (StockPriceId, StockId, PriceCurrent, PriceHigh, PriceLow, PriceOpen, PriceClose, DateOfTrade, Quantity) VALUES
(1, 1, 10.50, 11.00, 10.00, 10.50, 10.75, '2023-01-01', 100),
(2, 2, 20.50, 21.00, 20.00, 20.50, 20.75, '2023-02-01', 200),
(3, 3, 30.50, 31.00, 30.00, 30.50, 30.75, '2023-03-01', 300),
(4, 4, 40.50, 41.00, 40.00, 40.50, 40.75, '2023-04-01', 400),
(5, 5, 50.50, 51.00, 50.00, 50.50, 50.75, '2023-05-01', 500);

INSERT INTO stock_order (OrderId, UserId, DateOfOrder, OrderStatus, TotalAmount, IsPartialAllowed) VALUES
(1, 1, '2023-01-01', 'active', 1000, TRUE),
(2, 2, '2023-02-02', 'completed', 2000, FALSE),
(3, 3, '2023-03-03', 'failed', 3000, TRUE),
(4, 4, '2023-04-04', 'inactive', 4000, FALSE),
(5, 5, '2023-05-05', 'active', 5000, TRUE);

INSERT INTO stock_order_item (OrderItemId, OrderId, Quantity, PriceAsked, Margin, PricePlaced, OrderItemStatus) VALUES
(1, 1, 10, 100.00, 1.00, 99.00, 'active'),
(2, 2, 20, 200.00, 2.00, 198.00, 'inactive'),
(3, 3, 30, 300.00, 3.00, 297.00, 'complete'),
(4, 4, 40, 400.00, 4.00, 396.00, 'failed'),
(5, 5, 50, 500.00, 5.00, 495.00, 'active');
