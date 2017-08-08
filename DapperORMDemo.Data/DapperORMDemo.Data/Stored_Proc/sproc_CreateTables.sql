use FoodWars

GO
CREATE PROC sproc_CreateTables
AS
BEGIN
	IF NOT EXISTS(select object_id from sys.tables where name = 'FoodType')
	BEGIN
		CREATE TABLE FoodType
		(
			[Id] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
			[Name] varchar(255) NOT NULL,
			[DateAdded] datetime2(7) NULL
		)
		INSERT FoodType (Name, DateAdded) 
			VALUES ('Fruit'		,'2017-07-09 21:46:09.9600000'),
					('Pasta'	,'2017-07-09 21:46:09.9600000'),
					('Drink'	,'2017-07-09 21:46:09.9600000'),
					('Dessert'	,'2017-07-09 21:46:09.9600000'),
					('Soup'		,'2017-07-09 21:46:09.9600000'),
					('Meat'		,'2017-07-09 21:46:09.9600000'),
					('Cheese'	,'2017-07-09 21:46:09.9600000')		
	END	
	IF NOT EXISTS(select object_id from sys.tables where name = 'Food')
	BEGIN
		CREATE TABLE Food
		(
			[Id] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
			[FK_FoodTypeId] int NOT NULL,
			[Name] varchar(255) NOT NULL,
			[Calories] int NULL,
			[DateCreated] datetime2(7) NOT NULL,
			[DateUpdated] datetime2(7) NOT NULL,
			[AllergenRisk] bit NULL DEFAULT (0),
			[Description] varchar(255) NULL
		)
		INSERT Food (FK_FoodTypeId, Name, Calories, DateCreated, DateUpdated, AllergenRisk, Description)
			VALUES (1	,'Orange'			,60		,'2017-07-04 15:17:22.6400000'	,'2017-07-09 22:35:38.6100000'	,0	,'A delicious citrus fruit that is rich in vitamin C'),
					(2	,'Spaghetti'		,250	,'2017-07-04 15:18:55.4300000'	,'2017-07-04 15:18:55.4300000'	,0	,'A pasta dish that originated in Italy and a staple in the homeland which contains base tomato sauce covering noodle or stringy typical milled wheat'),
					(3	,'Milk'				,200	,'2017-07-04 15:18:55.4300000'	,'2017-07-06 22:54:21.5170000'	,1	,'A white liquid consumption that are harvested from cows that provides a good source of vitamin D'),
					(4	,'Ice Cream'		,250	,'2017-07-04 15:18:55.4300000'	,'2017-07-04 15:18:55.4300000'	,1	,'Best served during the summer, a byproduct of milk mixed with sugar and different types of flavor to bring treats that serves as a dessert or a treat'),
					(5	,'Tomato Bistro'	,200	,'2017-07-04 15:18:55.4300000'	,'2017-07-04 15:18:55.4300000'	,1	,'Soup form of tomatoes, best served with cheese croutons. Delicious!')
	END
END

