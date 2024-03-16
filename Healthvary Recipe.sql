create database project;

use project;

create table diet(Diet_type varchar(20) primary key,Diet_Meals varchar(40) not null);

desc diet;

insert into diet values('Chinese','Ginger carrot soup'),('Low Crab','Low fat yoghurt with Bluberries'),('Vegan','Wheat pasta with Lentil salad'),('Mediterranean','Chopped Tomatoes'),('Gluten Free','Bunless Burgers with Grilled Corn');


select * from diet;


create table RecipeSweet (Recipe_ID varchar(20) primary key,Sweetness_Level varchar(20), Diet_type varchar(20),constraint Recipe_ID_C foreign key Recipe_ID_FK(Diet_type) references diet (Diet_type));

desc RecipeSweet;

insert into RecipeSweet values( 'R121','Level 1','Gluten Free'),('R122','Level 2','Low Crab');

select * from RecipeSweet;


create table RecipeSavoury (Recipe_ID varchar(20) primary key,Spiciness_Level varchar(20), Diet_type varchar(20),constraint Recipe1_ID_C foreign key Recipe1_ID_FK(Diet_type) references diet (Diet_type));


desc RecipeSavoury;

insert into RecipeSavoury values( 'R123','Level 1','Chinese'),('R124','Level 2','Mediterranean'),('R125','Level 3','Vegan');


select * from RecipeSavoury;


create table Ingredient ( Ingredient_ID int  primary key,Ingredient_Name varchar(20) not null, Diet_Meal varchar(40) not null);


desc Ingredient;

insert into Ingredient values (1001,'Burger Patty','Bunless Burger with Grilled Corn'),(1002,'Salad','Bunless Burger with Grilled Corn'),(1003,'Corn','Bunless Burger with Grilled Corn'),(1004,'Potatoe','Bunless Burger with Grilled Corn'),(1005,'Yoghurt','Low fat yogurt with Blueberries'),(1006,'Blueberries','Low fat yogurt with Blueberries'),(1007,'Almond','Low fat yogurt with Blueberries'),(1008,'Ginger','Ginger carrot soup'),(1009,'Carrot','Ginger carrot soup'),(1010,'Brocooli','Ginger carrot soup'),(1011,'Pepper','Ginger carrot soup'),(1012,'Tomato','Chopped Tomatoes'),(1013,'Chickpeas','Chopped Tomatoes'),(1014,'Olives','Chopped Tomatoes'),(1015,'Feta','Chopped Tomatoes'),(1016,'Pasta','Wheat pasta with Lentil salad'),(1017,'Meatball','Wheat pasta with Lentil salad'),(1018,'Coleslaw','Wheat pasta with Lentil salad');


select * from Ingredient;


create table IngredientRecipeSweet (Ingredient_ID int,constraint Ingredient_ID_C foreign key Ingredient_ID_FK (Ingredient_ID) references Ingredient (Ingredient_ID),Recipe_ID varchar(20),constraint RecipeID_C foreign key RecipeID_FK(Recipe_ID) references RecipeSweet(Recipe_ID));


desc IngredientRecipeSweet;


insert into IngredientRecipeSweet values( 1001,'R121'),(1002,'R121'),(1003,'R121'),(1004,'R121'),(1005,'R122'),(1006,'R122'),(1007,'R122');


select * from IngredientRecipeSweet;


create table IngredientRecipeSavoury (Ingredient_ID int,constraint Ingredient1_ID_C foreign key Ingredient1_ID_FK (Ingredient_ID) references Ingredient (Ingredient_ID),Recipe_ID varchar(20),constraint RecipeID1_C foreign key RecipeID1_FK(Recipe_ID) references RecipeSavoury(Recipe_ID));


desc IngredientRecipeSavoury;


insert into IngredientRecipeSavoury values(1008,'R123'),(1009,'R123'),(1010,'R123'),(1011,'R123'),(1012,'R124'),(1013,'R124'),(1014,'R124'),(1015,'R124'),(1016,'R125'),(1017,'R125'),(1018,'R125');


select * from IngredientRecipeSavoury;

create table User (User_ID varchar(30) primary key,User_Name varchar(30) not null,User_Password varchar(30) not null,Diet_type varchar(20),constraint Userdiettype_C foreign key Userdiettype_FK(Diet_type) references diet (Diet_type));


desc user;


insert into User values ( 'AB123','Archit Pawar','archit123','Chinese'),('AB456','Prachi Sawant','prachi456','Low Crab'),('AB789','Yash Singh','yash789','Gluten Free'),('AC123','Mohini Banarjee','mohini123','Vegan'),('AC456','Prarthana Koli','prarthana456','Mediterranean'),('AC789','Mihir Mane','mihir789','Vegan'),('AD123','Vishwas Patil','vishwas123','Chinese'),('AD456','Raj Gupta','raj456','Low Crab'),('AD789','Nitara Rawat','nitara789','Gluten Free'),('AE123','Kamaldeep Singh','KDK123','Vegan'),('AE456','Aadya Chopra','aadya456','Mediterranean'),('AE789','Mihir Patil','mihirP789','Vegan'),( 'AF123','Pragat Pawar','pragat123','Chinese'),('AF456','Priya Bapat','priya456','Low Crab'),('AF789','Riya Kapoor','riya789','Gluten Free'),('AG123','Mohini Vaidya','mohini123','Vegan'),('AG456','Samruddhi Karnik','sam456','Mediterranean'),('AG789','Manoj Jain','manoj789','Vegan'),('AH123','Poonam Bisht','poonam123','Chinese'),('AH456','Rajesh Vishwakarma','rajesh456','Low Crab'),('AH789','Karan Rawat','karan789','Gluten Free'),('AI123','Aruna Rajan','Aruna123','Vegan'),('AI456','praneeti Rastogi','praneeti456','Mediterranean'),('AI789','Nahira Sharma','nahira789','Vegan');

select * from User;

create table Feedback( Comments_No varchar(30) not null,Rating varchar(30) not null,User_ID varchar(30) not null,RecipeSweet_ID varchar(30) not null,RecipeSavoury_ID varchar(30) not null,constraint Comments_No_PK primary key (Comments_No),constraint User_ID_FK foreign key (User_ID) references User(User_ID),constraint RecipeA_ID_FK foreign key (RecipeSweet_ID) references RecipeSweet (Recipe_ID),constraint RecipeB_ID_FK foreign key (RecipeSavoury_ID) references RecipeSavoury(Recipe_ID));


desc feedback;


insert into Feedback values( 'cno 1','4 star','AB123','R121','R123'),( 'cno 2','5 star','AB456','R122','R124'),( 'cno 3','2 star','AB789','R121','R123'),( 'cno 4','3 star','AC123','R122','R125'),( 'cno 5','3 star','AC456','R122','R124'),( 'cno 6','2 star','AC789','R121','R123'),( 'cno 7','5 star','AD123','R122','R125'),( 'cno 8','3 star','AD456','R122','R124'),( 'cno 9','2 star','AD789','R121','R123'),( 'cno 10','4 star','AE123','R122','R125'),( 'cno 11','5 star','AE456','R122','R124'),( 'cno 12','2 star','AE789','R121','R123'),( 'cno 13','4 star','AF123','R122','R125'),( 'cno 14','5 star','AF456','R122','R124'),( 'cno 15','2 star','AF789','R121','R123');


select * from feedback;


create view SavouryMeals as select s.Recipe_ID,s.Spiciness_Level,s.Diet_Type,d.Diet_Meals from RecipeSavoury s, Diet d where s.Diet_Type=d.Diet_Type;


select * from savourymeals;

create view SweetMeals as select s.Recipe_ID,s.Sweetness_Level,s.Diet_Type,d.Diet_Meals from RecipeSweet s, Diet d where s.Diet_Type=d.Diet_Type;


select * from SweetMeals;


create view DietIngredients as select d.Diet_Type,d.Diet_Meals,i.Ingredient_ID,i.Ingredient_Name from Diet d, Ingredient i where d.Diet_Meals=i.Diet_Meal;


select * from DietIngredients;


create view UserDiet as select u.User_ID,u.User_Name,d.Diet_Type,d.Diet_Meals from User u,Diet d where u.Diet_Type=d.Diet_Type;


select * from UserDiet;


select User.User_ID,User.User_Name,Feedback.Comments_No,Feedback.Rating from User,Feedback where User.User_ID=Feedback.User_ID order by Rating Desc;


select Diet.Diet_type,Diet.Diet_Meals,Ingredient.Ingredient_ID,Ingredient.Ingredient_Name from Diet,Ingredient where Diet.Diet_Meals=Ingredient.Diet_Meal;


select User_Name,User_ID,Diet_type from User where User_ID not in(select user_ID from feedback where rating='5star' );


select Diet_type,Diet_meals from Diet where Diet_type in (select Diet_type from RecipeSavoury where Spiciness_Level='Level 3');


select Feedback.Rating,Feedback.Comments_No,User.Diet_type from Feedback right join User on Feedback.User_ID= User.User_ID;


select RecipeSweet.Recipe_ID,RecipeSweet.Sweetness_Level,RecipeSweet.Diet_type,RecipeSavoury.Recipe_ID,RecipeSavoury.Spiciness_Level,RecipeSavoury.Diet_type from RecipeSweet right join RecipeSavoury on RecipeSweet.Recipe_ID=RecipeSavoury.Recipe_ID UNION select RecipeSweet.Recipe_ID,RecipeSweet.Sweetness_Level,RecipeSweet.Diet_type,RecipeSavoury.Recipe_ID,RecipeSavoury.Spiciness_Level,RecipeSavoury.Diet_type from RecipeSweet left join RecipeSavoury on RecipeSweet.Recipe_ID=RecipeSavoury.Recipe_ID;


select Feedback.Rating,Feedback.Comments_No,User.Diet_type,User.User_Name,User.User_ID from Feedback right join User on Feedback.User_ID= User.User_ID UNION select Feedback.Rating,Feedback.Comments_No,User.Diet_type,User.User_Name,User.User_ID from Feedback right join User on Feedback.User_ID= User.User_ID;


