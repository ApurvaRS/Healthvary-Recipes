SQL PROJECT RECIPE MANAGEMENT SYSTEM

Setting environment for using XAMPP for Windows.
APURVA SURYAWANSHI@DESKTOP-9FRGC14 c:\Users\APURVA SURYAWANSHI\Desktop\a xammp
# mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.28-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database project;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> use project;
Database changed
MariaDB [project]> create table diet(Diet_type varchar(20) primary key,Diet_Meals varchar(40) not null);
Query OK, 0 rows affected (0.013 sec)

MariaDB [project]> desc diet;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Diet_type  | varchar(20) | NO   | PRI | NULL    |       |
| Diet_Meals | varchar(40) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.045 sec)

MariaDB [project]> insert into diet values('Chinese','Ginger carrot soup'),('Low Crab','Low fat yoghurt with Bluberries'),('Vegan','Wheat pasta with Lentil salad'),('Mediterranean','Chopped Tomatoes'),('Gluten Free','Bunless Burgers with Grilled Corn');
Query OK, 5 rows affected (0.041 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [project]> select * from diet;
+---------------+-----------------------------------+
| Diet_type     | Diet_Meals                        |
+---------------+-----------------------------------+
| Chinese       | Ginger carrot soup                |
| Gluten Free   | Bunless Burgers with Grilled Corn |
| Low Crab      | Low fat yoghurt with Bluberries   |
| Mediterranean | Chopped Tomatoes                  |
| Vegan         | Wheat pasta with Lentil salad     |
+---------------+-----------------------------------+
5 rows in set (0.043 sec)

MariaDB [project]> create table RecipeSweet (Recipe_ID varchar(20) primary key,Sweetness_Level varchar(20), Diet_type varchar(20),constraint Recipe_ID_C foreign key Recipe_ID_FK(Diet_type) references diet (Diet_type));
Query OK, 0 rows affected (0.021 sec)

MariaDB [project]> desc RecipeSweet;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| Recipe_ID       | varchar(20) | NO   | PRI | NULL    |       |
| Sweetness_Level | varchar(20) | YES  |     | NULL    |       |
| Diet_type       | varchar(20) | YES  | MUL | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
3 rows in set (0.016 sec)

MariaDB [project]> insert into RecipeSweet values( 'R121','Level 1','Gluten Free'),('R122','Level 2','Low Crab');
Query OK, 2 rows affected (0.012 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [project]> select * from RecipeSweet;
+-----------+-----------------+-------------+
| Recipe_ID | Sweetness_Level | Diet_type   |
+-----------+-----------------+-------------+
| R121      | Level 1         | Gluten Free |
| R122      | Level 2         | Low Crab    |
+-----------+-----------------+-------------+
2 rows in set (0.000 sec)

MariaDB [project]> create table RecipeSavoury (Recipe_ID varchar(20) primary key,Spiciness_Level varchar(20), Diet_type varchar(20),constraint Recipe1_ID_C foreign key Recipe1_ID_FK(Diet_type) references diet (Diet_type));
Query OK, 0 rows affected (0.022 sec)

MariaDB [project]> desc RecipeSavoury;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| Recipe_ID       | varchar(20) | NO   | PRI | NULL    |       |
| Spiciness_Level | varchar(20) | YES  |     | NULL    |       |
| Diet_type       | varchar(20) | YES  | MUL | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
3 rows in set (0.017 sec)

MariaDB [project]> insert into RecipeSavoury values( 'R123','Level 1','Chinese'),('R124','Level 2','Mediterranean'),('R125','Level 3','Vegan');
Query OK, 3 rows affected (0.040 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [project]> select * from RecipeSavoury;
+-----------+-----------------+---------------+
| Recipe_ID | Spiciness_Level | Diet_type     |
+-----------+-----------------+---------------+
| R123      | Level 1         | Chinese       |
| R124      | Level 2         | Mediterranean |
| R125      | Level 3         | Vegan         |
+-----------+-----------------+---------------+
3 rows in set (0.000 sec)

MariaDB [project]> create table Ingredient ( Ingredient_ID int  primary key,Ingredient_Name varchar(20) not null, Diet_Meal varchar(40) not null);
Query OK, 0 rows affected (0.052 sec)

MariaDB [project]> desc Ingredient;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| Ingredient_ID   | int(11)     | NO   | PRI | NULL    |       |
| Ingredient_Name | varchar(20) | NO   |     | NULL    |       |
| Diet_Meal       | varchar(40) | NO   |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
3 rows in set (0.017 sec)

MariaDB [project]>  insert into Ingredient values (1001,'Burger Patty','Bunless Burger with Grilled Corn'),(1002,'Salad','Bunless Burger with Grilled Corn'),(1003,'Corn','Bunless Burger with Grilled Corn'),(1004,'Potatoe','Bunless Burger with Grilled Corn'),(1005,'Yoghurt','Low fat yogurt with Blueberries'),(1006,'Blueberries','Low fat yogurt with Blueberries'),(1007,'Almond','Low fat yogurt with Blueberries'),(1008,'Ginger','Ginger carrot soup'),(1009,'Carrot','Ginger carrot soup'),(1010,'Brocooli','Ginger carrot soup'),(1011,'Pepper','Ginger carrot soup'),(1012,'Tomato','Chopped Tomatoes'),(1013,'Chickpeas','Chopped Tomatoes'),(1014,'Olives','Chopped Tomatoes'),(1015,'Feta','Chopped Tomatoes'),(1016,'Pasta','Wheat pasta with Lentil salad'),(1017,'Meatball','Wheat pasta with Lentil salad'),(1018,'Coleslaw','Wheat pasta with Lentil salad');
Query OK, 18 rows affected (0.012 sec)
Records: 18  Duplicates: 0  Warnings: 0

MariaDB [project]> select * from Ingredient;
+---------------+-----------------+----------------------------------+
| Ingredient_ID | Ingredient_Name | Diet_Meal                        |
+---------------+-----------------+----------------------------------+
|          1001 | Burger Patty    | Bunless Burger with Grilled Corn |
|          1002 | Salad           | Bunless Burger with Grilled Corn |
|          1003 | Corn            | Bunless Burger with Grilled Corn |
|          1004 | Potatoe         | Bunless Burger with Grilled Corn |
|          1005 | Yoghurt         | Low fat yogurt with Blueberries  |
|          1006 | Blueberries     | Low fat yogurt with Blueberries  |
|          1007 | Almond          | Low fat yogurt with Blueberries  |
|          1008 | Ginger          | Ginger carrot soup               |
|          1009 | Carrot          | Ginger carrot soup               |
|          1010 | Brocooli        | Ginger carrot soup               |
|          1011 | Pepper          | Ginger carrot soup               |
|          1012 | Tomato          | Chopped Tomatoes                 |
|          1013 | Chickpeas       | Chopped Tomatoes                 |
|          1014 | Olives          | Chopped Tomatoes                 |
|          1015 | Feta            | Chopped Tomatoes                 |
|          1016 | Pasta           | Wheat pasta with Lentil salad    |
|          1017 | Meatball        | Wheat pasta with Lentil salad    |
|          1018 | Coleslaw        | Wheat pasta with Lentil salad    |
+---------------+-----------------+----------------------------------+
18 rows in set (0.000 sec)

MariaDB [project]> create table IngredientRecipeSweet (Ingredient_ID int,constraint Ingredient_ID_C foreign key Ingredient_ID_FK (Ingredient_ID) references Ingredient (Ingredient_ID),Recipe_ID varchar(20),constraint RecipeID_C foreign key RecipeID_FK(Recipe_ID) references RecipeSweet(Recipe_ID));
Query OK, 0 rows affected (0.023 sec)

MariaDB [project]> desc IngredientRecipeSweet;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Ingredient_ID | int(11)     | YES  | MUL | NULL    |       |
| Recipe_ID     | varchar(20) | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
2 rows in set (0.043 sec)

MariaDB [project]>  insert into IngredientRecipeSweet values( 1001,'R121'),(1002,'R121'),(1003,'R121'),(1004,'R121'),(1005,'R122'),(1006,'R122'),(1007,'R122');
Query OK, 7 rows affected (0.040 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [project]> select * from IngredientRecipeSweet;
+---------------+-----------+
| Ingredient_ID | Recipe_ID |
+---------------+-----------+
|          1001 | R121      |
|          1002 | R121      |
|          1003 | R121      |
|          1004 | R121      |
|          1005 | R122      |
|          1006 | R122      |
|          1007 | R122      |
+---------------+-----------+
7 rows in set (0.000 sec)


MariaDB [project]> create table IngredientRecipeSavoury (Ingredient_ID int,constraint Ingredient1_ID_C foreign key Ingredient1_ID_FK (Ingredient_ID) references Ingredient (Ingredient_ID),Recipe_ID varchar(20),constraint RecipeID1_C foreign key RecipeID1_FK(Recipe_ID) references RecipeSavoury(Recipe_ID));
Query OK, 0 rows affected (0.022 sec)

MariaDB [project]> desc IngredientRecipeSavoury;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Ingredient_ID | int(11)     | YES  | MUL | NULL    |       |
| Recipe_ID     | varchar(20) | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
2 rows in set (0.017 sec)

MariaDB [project]> insert into IngredientRecipeSavoury values(1008,'R123'),(1009,'R123'),(1010,'R123'),(1011,'R123'),(1012,'R124'),(1013,'R124'),(1014,'R124'),(1015,'R124'),(1016,'R125'),(1017,'R125'),(1018,'R125');
Query OK, 11 rows affected (0.038 sec)
Records: 11  Duplicates: 0  Warnings: 0

MariaDB [project]> select * from IngredientRecipeSavoury;
+---------------+-----------+
| Ingredient_ID | Recipe_ID |
+---------------+-----------+
|          1008 | R123      |
|          1009 | R123      |
|          1010 | R123      |
|          1011 | R123      |
|          1012 | R124      |
|          1013 | R124      |
|          1014 | R124      |
|          1015 | R124      |
|          1016 | R125      |
|          1017 | R125      |
|          1018 | R125      |
+---------------+-----------+
11 rows in set (0.001 sec)

MariaDB [project]> create table User (User_ID varchar(30) primary key,User_Name varchar(30) not null,User_Password varchar(30) not null,Diet_type varchar(20),constraint Userdiettype_C foreign key Userdiettype_FK(Diet_type) references diet (Diet_type));
Query OK, 0 rows affected (0.051 sec)

MariaDB [project]> desc user;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| User_ID       | varchar(30) | NO   | PRI | NULL    |       |
| User_Name     | varchar(30) | NO   |     | NULL    |       |
| User_Password | varchar(30) | NO   |     | NULL    |       |
| Diet_type     | varchar(20) | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.047 sec)

MariaDB [project]> insert into User values ( 'AB123','Archit Pawar','archit123','Chinese'),('AB456','Prachi Sawant','prachi456','Low Crab'),('AB789','Yash Singh','yash789','Gluten Free'),('AC123','Mohini Banarjee','mohini123','Vegan'),('AC456','Prarthana Koli','prarthana456','Mediterranean'),('AC789','Mihir Mane','mihir789','Vegan'),('AD123','Vishwas Patil','vishwas123','Chinese'),('AD456','Raj Gupta','raj456','Low Crab'),('AD789','Nitara Rawat','nitara789','Gluten Free'),('AE123','Kamaldeep Singh','KDK123','Vegan'),('AE456','Aadya Chopra','aadya456','Mediterranean'),('AE789','Mihir Patil','mihirP789','Vegan'),( 'AF123','Pragat Pawar','pragat123','Chinese'),('AF456','Priya Bapat','priya456','Low Crab'),('AF789','Riya Kapoor','riya789','Gluten Free'),('AG123','Mohini Vaidya','mohini123','Vegan'),('AG456','Samruddhi Karnik','sam456','Mediterranean'),('AG789','Manoj Jain','manoj789','Vegan'),('AH123','Poonam Bisht','poonam123','Chinese'),('AH456','Rajesh Vishwakarma','rajesh456','Low Crab'),('AH789','Karan Rawat','karan789','Gluten Free'),('AI123','Aruna Rajan','Aruna123','Vegan'),('AI456','praneeti Rastogi','praneeti456','Mediterranean'),('AI789','Nahira Sharma','nahira789','Vegan');
Query OK, 24 rows affected (0.045 sec)
Records: 24  Duplicates: 0  Warnings: 0

MariaDB [project]> select * from User;
+---------+--------------------+---------------+---------------+
| User_ID | User_Name          | User_Password | Diet_type     |
+---------+--------------------+---------------+---------------+
| AB123   | Archit Pawar       | archit123     | Chinese       |
| AB456   | Prachi Sawant      | prachi456     | Low Crab      |
| AB789   | Yash Singh         | yash789       | Gluten Free   |
| AC123   | Mohini Banarjee    | mohini123     | Vegan         |
| AC456   | Prarthana Koli     | prarthana456  | Mediterranean |
| AC789   | Mihir Mane         | mihir789      | Vegan         |
| AD123   | Vishwas Patil      | vishwas123    | Chinese       |
| AD456   | Raj Gupta          | raj456        | Low Crab      |
| AD789   | Nitara Rawat       | nitara789     | Gluten Free   |
| AE123   | Kamaldeep Singh    | KDK123        | Vegan         |
| AE456   | Aadya Chopra       | aadya456      | Mediterranean |
| AE789   | Mihir Patil        | mihirP789     | Vegan         |
| AF123   | Pragat Pawar       | pragat123     | Chinese       |
| AF456   | Priya Bapat        | priya456      | Low Crab      |
| AF789   | Riya Kapoor        | riya789       | Gluten Free   |
| AG123   | Mohini Vaidya      | mohini123     | Vegan         |
| AG456   | Samruddhi Karnik   | sam456        | Mediterranean |
| AG789   | Manoj Jain         | manoj789      | Vegan         |
| AH123   | Poonam Bisht       | poonam123     | Chinese       |
| AH456   | Rajesh Vishwakarma | rajesh456     | Low Crab      |
| AH789   | Karan Rawat        | karan789      | Gluten Free   |
| AI123   | Aruna Rajan        | Aruna123      | Vegan         |
| AI456   | praneeti Rastogi   | praneeti456   | Mediterranean |
| AI789   | Nahira Sharma      | nahira789     | Vegan         |
+---------+--------------------+---------------+---------------+
24 rows in set (0.001 sec)

MariaDB [project]> create table Feedback( Comments_No varchar(30) not null,Rating varchar(30) not null,User_ID varchar(30) not null,RecipeSweet_ID varchar(30) not null,RecipeSavoury_ID varchar(30) not null,constraint Comments_No_PK primary key (Comments_No),constraint User_ID_FK foreign key (User_ID) references User(User_ID),constraint RecipeA_ID_FK foreign key (RecipeSweet_ID) references RecipeSweet (Recipe_ID),constraint RecipeB_ID_FK foreign key (RecipeSavoury_ID) references RecipeSavoury(Recipe_ID));
Query OK, 0 rows affected, 1 warning (0.016 sec)

MariaDB [project]> desc feedback;
+------------------+-------------+------+-----+---------+-------+
| Field            | Type        | Null | Key | Default | Extra |
+------------------+-------------+------+-----+---------+-------+
| Comments_No      | varchar(30) | NO   | PRI | NULL    |       |
| Rating           | varchar(30) | NO   |     | NULL    |       |
| User_ID          | varchar(30) | NO   | MUL | NULL    |       |
| RecipeSweet_ID   | varchar(30) | NO   | MUL | NULL    |       |
| RecipeSavoury_ID | varchar(30) | NO   | MUL | NULL    |       |
+------------------+-------------+------+-----+---------+-------+
5 rows in set (0.042 sec)

MariaDB [project]> insert into Feedback values( 'cno 1','4 star','AB123','R121','R123'),( 'cno 2','5 star','AB456','R122','R124'),( 'cno 3','2 star','AB789','R121','R123'),( 'cno 4','3 star','AC123','R122','R125'),( 'cno 5','3 star','AC456','R122','R124'),( 'cno 6','2 star','AC789','R121','R123'),( 'cno 7','5 star','AD123','R122','R125'),( 'cno 8','3 star','AD456','R122','R124'),( 'cno 9','2 star','AD789','R121','R123'),( 'cno 10','4 star','AE123','R122','R125'),( 'cno 11','5 star','AE456','R122','R124'),( 'cno 12','2 star','AE789','R121','R123'),( 'cno 13','4 star','AF123','R122','R125'),( 'cno 14','5 star','AF456','R122','R124'),( 'cno 15','2 star','AF789','R121','R123');
Query OK, 15 rows affected (0.041 sec)
Records: 15  Duplicates: 0  Warnings: 0

MariaDB [project]> select * from feedback;
+-------------+--------+---------+----------------+------------------+
| Comments_No | Rating | User_ID | RecipeSweet_ID | RecipeSavoury_ID |
+-------------+--------+---------+----------------+------------------+
| cno 1       | 4 star | AB123   | R121           | R123             |
| cno 2       | 5 star | AB456   | R122           | R124             |
| cno 3       | 2 star | AB789   | R121           | R123             |
| cno 4       | 3 star | AC123   | R122           | R125             |
| cno 5       | 3 star | AC456   | R122           | R124             |
| cno 6       | 2 star | AC789   | R121           | R123             |
| cno 7       | 5 star | AD123   | R122           | R125             |
| cno 8       | 3 star | AD456   | R122           | R124             |
| cno 9       | 2 star | AD789   | R121           | R123             |
| cno 10      | 4 star | AE123   | R122           | R125             |
| cno 11      | 5 star | AE456   | R122           | R124             |
| cno 12      | 2 star | AE789   | R121           | R123             |
| cno 13      | 4 star | AF123   | R122           | R125             |
| cno 14      | 5 star | AF456   | R122           | R124             |
| cno 15      | 2 star | AF789   | R121           | R123             |
+-------------+--------+---------+----------------+------------------+
15 rows in set (0.001 sec)

CREATE VIEW

MariaDB [project]> create view SavouryMeals as select s.Recipe_ID,s.Spiciness_Level,s.Diet_Type,d.Diet_Meals from RecipeSavoury s, Diet d where s.Diet_Type=d.Diet_Type;
Query OK, 0 rows affected (0.065 sec)

MariaDB [project]> select * from savourymeals;
+-----------+-----------------+---------------+-------------------------------+
| Recipe_ID | Spiciness_Level | Diet_Type     | Diet_Meals                    |
+-----------+-----------------+---------------+-------------------------------+
| R123      | Level 1         | Chinese       | Ginger carrot soup            |
| R124      | Level 2         | Mediterranean | Chopped Tomatoes              |
| R125      | Level 3         | Vegan         | Wheat pasta with Lentil salad |
+-----------+-----------------+---------------+-------------------------------+
3 rows in set (0.046 sec)

MariaDB [project]> create view SweetMeals as select s.Recipe_ID,s.Sweetness_Level,s.Diet_Type,d.Diet_Meals from RecipeSweet s, Diet d where s.Diet_Type=d.Diet_Type;
Query OK, 0 rows affected (0.042 sec)

MariaDB [project]> select * from SweetMeals;
+-----------+-----------------+-------------+-----------------------------------+
| Recipe_ID | Sweetness_Level | Diet_Type   | Diet_Meals                        |
+-----------+-----------------+-------------+-----------------------------------+
| R121      | Level 1         | Gluten Free | Bunless Burgers with Grilled Corn |
| R122      | Level 2         | Low Crab    | Low fat yoghurt with Bluberries   |
+-----------+-----------------+-------------+-----------------------------------+
2 rows in set (0.002 sec)


MariaDB [project]> create view DietIngredients as select d.Diet_Type,d.Diet_Meals,i.Ingredient_ID,i.Ingredient_Name from Diet d, Ingredient i where d.Diet_Meals=i.Diet_Meal;
Query OK, 0 rows affected (0.042 sec)

MariaDB [project]> select * from DietIngredients;
+---------------+-------------------------------+---------------+-----------------+
| Diet_Type     | Diet_Meals                    | Ingredient_ID | Ingredient_Name |
+---------------+-------------------------------+---------------+-----------------+
| Chinese       | Ginger carrot soup            |          1008 | Ginger          |
| Chinese       | Ginger carrot soup            |          1009 | Carrot          |
| Chinese       | Ginger carrot soup            |          1010 | Brocooli        |
| Chinese       | Ginger carrot soup            |          1011 | Pepper          |
| Mediterranean | Chopped Tomatoes              |          1012 | Tomato          |
| Mediterranean | Chopped Tomatoes              |          1013 | Chickpeas       |
| Mediterranean | Chopped Tomatoes              |          1014 | Olives          |
| Mediterranean | Chopped Tomatoes              |          1015 | Feta            |
| Vegan         | Wheat pasta with Lentil salad |          1016 | Pasta           |
| Vegan         | Wheat pasta with Lentil salad |          1017 | Meatball        |
| Vegan         | Wheat pasta with Lentil salad |          1018 | Coleslaw        |
+---------------+-------------------------------+---------------+-----------------+
11 rows in set (0.041 sec)


MariaDB [project]> create view UserDiet as select u.User_ID,u.User_Name,d.Diet_Type,d.Diet_Meals from User u,Diet d where u.Diet_Type=d.Diet_Type;
Query OK, 0 rows affected (0.045 sec)

MariaDB [project]> select * from UserDiet;
+---------+--------------------+---------------+-----------------------------------+
| User_ID | User_Name          | Diet_Type     | Diet_Meals                        |
+---------+--------------------+---------------+-----------------------------------+
| AB123   | Archit Pawar       | Chinese       | Ginger carrot soup                |
| AD123   | Vishwas Patil      | Chinese       | Ginger carrot soup                |
| AF123   | Pragat Pawar       | Chinese       | Ginger carrot soup                |
| AH123   | Poonam Bisht       | Chinese       | Ginger carrot soup                |
| AB789   | Yash Singh         | Gluten Free   | Bunless Burgers with Grilled Corn |
| AD789   | Nitara Rawat       | Gluten Free   | Bunless Burgers with Grilled Corn |
| AF789   | Riya Kapoor        | Gluten Free   | Bunless Burgers with Grilled Corn |
| AH789   | Karan Rawat        | Gluten Free   | Bunless Burgers with Grilled Corn |
| AB456   | Prachi Sawant      | Low Crab      | Low fat yoghurt with Bluberries   |
| AD456   | Raj Gupta          | Low Crab      | Low fat yoghurt with Bluberries   |
| AF456   | Priya Bapat        | Low Crab      | Low fat yoghurt with Bluberries   |
| AH456   | Rajesh Vishwakarma | Low Crab      | Low fat yoghurt with Bluberries   |
| AC456   | Prarthana Koli     | Mediterranean | Chopped Tomatoes                  |
| AE456   | Aadya Chopra       | Mediterranean | Chopped Tomatoes                  |
| AG456   | Samruddhi Karnik   | Mediterranean | Chopped Tomatoes                  |
| AI456   | praneeti Rastogi   | Mediterranean | Chopped Tomatoes                  |
| AC123   | Mohini Banarjee    | Vegan         | Wheat pasta with Lentil salad     |
| AC789   | Mihir Mane         | Vegan         | Wheat pasta with Lentil salad     |
| AE123   | Kamaldeep Singh    | Vegan         | Wheat pasta with Lentil salad     |
| AE789   | Mihir Patil        | Vegan         | Wheat pasta with Lentil salad     |
| AG123   | Mohini Vaidya      | Vegan         | Wheat pasta with Lentil salad     |
| AG789   | Manoj Jain         | Vegan         | Wheat pasta with Lentil salad     |
| AI123   | Aruna Rajan        | Vegan         | Wheat pasta with Lentil salad     |
| AI789   | Nahira Sharma      | Vegan         | Wheat pasta with Lentil salad     |
+---------+--------------------+---------------+-----------------------------------+
24 rows in set (0.040 sec)


SUBQUERIES

DISPLAY THE NAME OF CUSTOMER WHO HAS GIVEN COMMENT AND RATINGS AS FEEDBACK.

MariaDB [project]> select User.User_ID,User.User_Name,Feedback.Comments_No,Feedback.Rating from User,Feedback where User.User_ID=Feedback.User_ID order by Rating Desc;
+---------+-----------------+-------------+--------+
| User_ID | User_Name       | Comments_No | Rating |
+---------+-----------------+-------------+--------+
| AB456   | Prachi Sawant   | cno 2       | 5 star |
| AD123   | Vishwas Patil   | cno 7       | 5 star |
| AE456   | Aadya Chopra    | cno 11      | 5 star |
| AF456   | Priya Bapat     | cno 14      | 5 star |
| AB123   | Archit Pawar    | cno 1       | 4 star |
| AF123   | Pragat Pawar    | cno 13      | 4 star |
| AE123   | Kamaldeep Singh | cno 10      | 4 star |
| AD456   | Raj Gupta       | cno 8       | 3 star |
| AC456   | Prarthana Koli  | cno 5       | 3 star |
| AC123   | Mohini Banarjee | cno 4       | 3 star |
| AB789   | Yash Singh      | cno 3       | 2 star |
| AC789   | Mihir Mane      | cno 6       | 2 star |
| AE789   | Mihir Patil     | cno 12      | 2 star |
| AF789   | Riya Kapoor     | cno 15      | 2 star |
| AD789   | Nitara Rawat    | cno 9       | 2 star |
+---------+-----------------+-------------+--------+
15 rows in set (0.038 sec)

DISPLAY NAME OF INGREDIENT WHERE ALL TYPES OF MEALS ARE SERVED.


MariaDB [project]> select Diet.Diet_type,Diet.Diet_Meals,Ingredient.Ingredient_ID,Ingredient.Ingredient_Name from Diet,Ingredient where Diet.Diet_Meals=Ingredient.Diet_Meal;
+---------------+-------------------------------+---------------+-----------------+
| Diet_type     | Diet_Meals                    | Ingredient_ID | Ingredient_Name |
+---------------+-------------------------------+---------------+-----------------+
| Chinese       | Ginger carrot soup            |          1008 | Ginger          |
| Chinese       | Ginger carrot soup            |          1009 | Carrot          |
| Chinese       | Ginger carrot soup            |          1010 | Brocooli        |
| Chinese       | Ginger carrot soup            |          1011 | Pepper          |
| Mediterranean | Chopped Tomatoes              |          1012 | Tomato          |
| Mediterranean | Chopped Tomatoes              |          1013 | Chickpeas       |
| Mediterranean | Chopped Tomatoes              |          1014 | Olives          |
| Mediterranean | Chopped Tomatoes              |          1015 | Feta            |
| Vegan         | Wheat pasta with Lentil salad |          1016 | Pasta           |
| Vegan         | Wheat pasta with Lentil salad |          1017 | Meatball        |
| Vegan         | Wheat pasta with Lentil salad |          1018 | Coleslaw        |
+---------------+-------------------------------+---------------+-----------------+
11 rows in set (0.039 sec)

DISPLAY CUSTOMERS WHO HAVE NOT GIVEN 5 STAR RATING

MariaDB [project]> select User_Name,User_ID,Diet_type from User where User_ID not in(select user_ID from feedback where rating='5star' );
+--------------------+---------+---------------+
| User_Name          | User_ID | Diet_type     |
+--------------------+---------+---------------+
| Archit Pawar       | AB123   | Chinese       |
| Prachi Sawant      | AB456   | Low Crab      |
| Yash Singh         | AB789   | Gluten Free   |
| Mohini Banarjee    | AC123   | Vegan         |
| Prarthana Koli     | AC456   | Mediterranean |
| Mihir Mane         | AC789   | Vegan         |
| Vishwas Patil      | AD123   | Chinese       |
| Raj Gupta          | AD456   | Low Crab      |
| Nitara Rawat       | AD789   | Gluten Free   |
| Kamaldeep Singh    | AE123   | Vegan         |
| Aadya Chopra       | AE456   | Mediterranean |
| Mihir Patil        | AE789   | Vegan         |
| Pragat Pawar       | AF123   | Chinese       |
| Priya Bapat        | AF456   | Low Crab      |
| Riya Kapoor        | AF789   | Gluten Free   |
| Mohini Vaidya      | AG123   | Vegan         |
| Samruddhi Karnik   | AG456   | Mediterranean |
| Manoj Jain         | AG789   | Vegan         |
| Poonam Bisht       | AH123   | Chinese       |
| Rajesh Vishwakarma | AH456   | Low Crab      |
| Karan Rawat        | AH789   | Gluten Free   |
| Aruna Rajan        | AI123   | Vegan         |
| praneeti Rastogi   | AI456   | Mediterranean |
| Nahira Sharma      | AI789   | Vegan         |
+--------------------+---------+---------------+
24 rows in set (0.001 sec)


DISPLAY DIET WHICH IS SPICIEST.

MariaDB [project]> select Diet_type,Diet_meals from Diet where Diet_type in (select Diet_type from RecipeSavoury where Spiciness_Level='Level 3');
+-----------+-------------------------------+
| Diet_type | Diet_meals                    |
+-----------+-------------------------------+
| Vegan     | Wheat pasta with Lentil salad |
+-----------+-------------------------------+
1 row in set (0.001 sec)

joins..........

DISPLAY RATING AND COMMENTS ASSOCIATED WITH VARIOUS DIETS

MariaDB [project]> select Feedback.Rating,Feedback.Comments_No,User.Diet_type from Feedback right join User on Feedback.User_ID= User.User_ID;
+--------+-------------+---------------+
| Rating | Comments_No | Diet_type     |
+--------+-------------+---------------+
| 4 star | cno 1       | Chinese       |
| 5 star | cno 7       | Chinese       |
| 4 star | cno 13      | Chinese       |
| NULL   | NULL        | Chinese       |
| 2 star | cno 3       | Gluten Free   |
| 2 star | cno 9       | Gluten Free   |
| 2 star | cno 15      | Gluten Free   |
| NULL   | NULL        | Gluten Free   |
| 5 star | cno 2       | Low Crab      |
| 3 star | cno 8       | Low Crab      |
| 5 star | cno 14      | Low Crab      |
| NULL   | NULL        | Low Crab      |
| 3 star | cno 5       | Mediterranean |
| 5 star | cno 11      | Mediterranean |
| NULL   | NULL        | Mediterranean |
| NULL   | NULL        | Mediterranean |
| 3 star | cno 4       | Vegan         |
| 2 star | cno 6       | Vegan         |
| 4 star | cno 10      | Vegan         |
| 2 star | cno 12      | Vegan         |
| NULL   | NULL        | Vegan         |
| NULL   | NULL        | Vegan         |
| NULL   | NULL        | Vegan         |
| NULL   | NULL        | Vegan         |
+--------+-------------+---------------+
24 rows in set (0.039 sec)

DISPLAY ALL THE SWEET AND SAVOURY RECIPES.

MariaDB [project]> select RecipeSweet.Recipe_ID,RecipeSweet.Sweetness_Level,RecipeSweet.Diet_type,RecipeSavoury.Recipe_ID,RecipeSavoury.Spiciness_Level,RecipeSavoury.Diet_type from RecipeSweet right join RecipeSavoury on RecipeSweet.Recipe_ID=RecipeSavoury.Recipe_ID UNION select RecipeSweet.Recipe_ID,RecipeSweet.Sweetness_Level,RecipeSweet.Diet_type,RecipeSavoury.Recipe_ID,RecipeSavoury.Spiciness_Level,RecipeSavoury.Diet_type from RecipeSweet left join RecipeSavoury on RecipeSweet.Recipe_ID=RecipeSavoury.Recipe_ID;
+-----------+-----------------+-------------+-----------+-----------------+---------------+
| Recipe_ID | Sweetness_Level | Diet_type   | Recipe_ID | Spiciness_Level | Diet_type     |
+-----------+-----------------+-------------+-----------+-----------------+---------------+
| NULL      | NULL            | NULL        | R123      | Level 1         | Chinese       |
| NULL      | NULL            | NULL        | R124      | Level 2         | Mediterranean |
| NULL      | NULL            | NULL        | R125      | Level 3         | Vegan         |
| R121      | Level 1         | Gluten Free | NULL      | NULL            | NULL          |
| R122      | Level 2         | Low Crab    | NULL      | NULL            | NULL          |
+-----------+-----------------+-------------+-----------+-----------------+---------------+
5 rows in set (0.040 sec)


DISPLAY ENTRIES OF CUSTOMERS WHO HAVE SUBMITTED/NOT SUBMITTED RATINGS AND COMMENTS.

MariaDB [project]> select Feedback.Rating,Feedback.Comments_No,User.Diet_type,User.User_Name,User.User_ID from Feedback right join User on Feedback.User_ID= User.User_ID UNION select Feedback.Rating,Feedback.Comments_No,User.Diet_type,User.User_Name,User.User_ID from Feedback right join User on Feedback.User_ID= User.User_ID;
+--------+-------------+---------------+--------------------+---------+
| Rating | Comments_No | Diet_type     | User_Name          | User_ID |
+--------+-------------+---------------+--------------------+---------+
| 4 star | cno 1       | Chinese       | Archit Pawar       | AB123   |
| 5 star | cno 2       | Low Crab      | Prachi Sawant      | AB456   |
| 2 star | cno 3       | Gluten Free   | Yash Singh         | AB789   |
| 3 star | cno 4       | Vegan         | Mohini Banarjee    | AC123   |
| 3 star | cno 5       | Mediterranean | Prarthana Koli     | AC456   |
| 2 star | cno 6       | Vegan         | Mihir Mane         | AC789   |
| 5 star | cno 7       | Chinese       | Vishwas Patil      | AD123   |
| 3 star | cno 8       | Low Crab      | Raj Gupta          | AD456   |
| 2 star | cno 9       | Gluten Free   | Nitara Rawat       | AD789   |
| 4 star | cno 10      | Vegan         | Kamaldeep Singh    | AE123   |
| 5 star | cno 11      | Mediterranean | Aadya Chopra       | AE456   |
| 2 star | cno 12      | Vegan         | Mihir Patil        | AE789   |
| 4 star | cno 13      | Chinese       | Pragat Pawar       | AF123   |
| 5 star | cno 14      | Low Crab      | Priya Bapat        | AF456   |
| 2 star | cno 15      | Gluten Free   | Riya Kapoor        | AF789   |
| NULL   | NULL        | Vegan         | Mohini Vaidya      | AG123   |
| NULL   | NULL        | Mediterranean | Samruddhi Karnik   | AG456   |
| NULL   | NULL        | Vegan         | Manoj Jain         | AG789   |
| NULL   | NULL        | Chinese       | Poonam Bisht       | AH123   |
| NULL   | NULL        | Low Crab      | Rajesh Vishwakarma | AH456   |
| NULL   | NULL        | Gluten Free   | Karan Rawat        | AH789   |
| NULL   | NULL        | Vegan         | Aruna Rajan        | AI123   |
| NULL   | NULL        | Mediterranean | praneeti Rastogi   | AI456   |
| NULL   | NULL        | Vegan         | Nahira Sharma      | AI789   |
+--------+-------------+---------------+--------------------+---------+
24 rows in set (0.002 sec)


