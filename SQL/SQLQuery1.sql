use db_zoo;

Create table tbl_anamalia (
	anamalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	anamalia_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_anamalia
	(anamalia_type)
	VALUES
	('vertebrate'),
	('Invertebrate')
;

SELECT * FROM tbl_anamalia;

create table tbl_class (
	class_id int primary key not null identity (100,1),
	class_type varchar(50) not null
);
select * from tbl_class

insert into tbl_class
	(class_type)
	Values
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;
select * from tbl_class

update tbl_class set class_type = 'bird' where class_type = 'birds';

select replace(class_type, 'bird', 'birds') from tbl_class;

select upper(class_type) from tbl_class where class_type = 'bird';

create table tbl_persons (
	persons_id int primary key not null identity (1,1),
	persons_fname varchar(50) not null,
	persons_lname varchar(50) not null,
	persons_contact varchar(50) not null
);

insert into tbl_persons
	(persons_fname, persons_lname, persons_contact)
	values
	('bob', 'smith', '242-345-4546'),
	('mary', 'brown', '555-334-2323'),
	('john', 'grreen', '232-424-1233'),
	('bill', 'jones', '654-585-2312'),
	('joe', 'black', '576-998-3346')
;

update tbl_persons set persons_fname = 'mars' where persons_fname = 'bob';

select * from tbl_persons;

select persons_fname as 'Firstname', persons_lname as 'Lastname', persons_contact as 'Phone' from tbl_persons where persons_fname like 'm%' order by persons_lname desc;

delete from tbl_persons where persons_lname = 'smith';

drop table tbl_persons;

select * from tbl_class;

create table tbl_order (
	order_id int primary key not null identity (1,1),
	order_type varchar(50) not null
)

create table tbl_care (
	care_id varchar(50) primary key not null,
	care_type varchar(50) not null,
	care_specialist int not null
);

create table tbl_nutrition (
	nutrition_id int primary key not null identity (2200,1),
	nutrition_type varchar(50) not null,
	nutrition_cost money not null
);

create table tbl_habitat (
	habitat_id int primary key not null identity (5000,1),
	habitat_type varchar(50) not null,
	habitat_cost money not null
);

create table tbl_specialist (
	specialist_id int primary key not null identity (1,1),
	specialist_fname varchar(50) not null,
	specialist_lname varchar(50) not null,
	specialist_contact varchar(50) not null
);

insert into tbl_order
	(order_type)
	values
	('carnivore'),
	('herbivore'),
	('ominvore')
;
select * from tbl_order;

insert into tbl_care
	(care_id, care_type, care_specialist)
	values
	('care_0', 'replace the straw', 1),
	('care_1', 'repair or replace broken toys', 4),
	('care_2', 'bottle feed vitamins', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to excercise pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;
select * from tbl_care;

insert into tbl_nutrition
	(nutrition_type, nutrition_cost)
	values
	('raw fish', 1500),
	('living rodents', 600),
	('mixture of fruit and rice', 800),
	('warm bottle of milk', 600),
	('syringe feed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitamins and marrow', 3500)
;

select * from tbl_nutrition;

insert into tbl_habitat
	(habitat_type, habitat_cost)
	values
	('tundra', 40000),
	('grassy gnoll with trees', 12000),
	('10ft pond and rocks', 30000),
	('icy aquarium with snowy facade', 50000),
	('short grass, shade, and moat', 50000),
	('netted forest atrium', 10000),
	('jungle vines and winding branchs', 15000),
	('cliff with shaded cave', 15000)
;

select * from tbl_habitat

insert into tbl_specialist
	(specialist_fname, specialist_lname, specialist_contact)
	values
	('margret', 'nyguen', '384-576-2899'),
	('mary', 'fischer', '384-784-4856'),
	('arnold', 'holden', '385-475-3944'),
	('ken', 'byesan', '384-485-4855'),
	('delmonte', 'fyedo', '768-288-3749')
;
select * from tbl_specialist;

create table tbl_species (
	species_id int primary key not null identity (1,1),
	species_name varchar(50) not null,
	species_anamalia int not null constraint fk_anamalia_id foreign key references tbl_anamalia(anamalia_id) on update cascade on delete cascade,
	species_class int not null constraint fk_class_id foreign key references tbl_class(class_id) on update cascade on delete cascade,
	species_order int not null constraint fk_order_id foreign key references tbl_order(order_id) on update cascade on delete cascade,
	species_habitat int not null constraint fk_habitat_id foreign key references tbl_habitat(habitat_id) on update cascade on delete cascade,
	species_nutrition int not null constraint fk_nutrition_id foreign key references tbl_nutrition(nutrition_id) on update cascade on delete cascade,
	species_care varchar(50) not null constraint fk_care_id foreign key references tbl_care(care_id) on update cascade on delete cascade
);
select * from tbl_species;

insert into tbl_species
	(species_name, species_anamalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	values
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
	('ghost bar', 1, 102, 1, 5007, 2204, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5006, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
	('grey worlf', 1, 102, 1, 5000, 2201, 'care_4')
;
select * from tbl_species;

select * from tbl_nutrition;

select * from tbl_species where species_name = 'chicken';

select
	a1.species_name, a2.anamalia_type,
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type,a7.care_type
	from tbl_species a1
	inner join tbl_anamalia a2 on a2.anamalia_id = a1.species_anamalia
	inner join tbl_class a3 on a3.class_id = a1.species_class
	inner join tbl_order a4 on a4.order_id = a1.species_order
	inner join tbl_habitat a5 on a5.habitat_id = a1.species_habitat
	inner join tbl_nutrition a6 on a6.nutrition_id = a1.species_nutrition
	inner join tbl_care a7 on a7.care_id = a1.species_care
	where species_name = 'ghost bat'
;

update tbl_species set species_name = 'ghost bar' where species_name = 'ghost bat';

select * from tbl_species;

create table tbl_species (
	species_id int primary key not null identity (1,1),
	species_name varchar(50) not null,
	species_anamalia int not null constraint fk_anamalia_id foreign key references tbl_anamalia(anamalia_id) on update cascade on delete cascade,
	species_class int not null constraint fk_class_id foreign key references tbl_class(class_id) on update cascade on delete cascade,
	species_order int not null constraint fk_order_id foreign key references tbl_order(order_id) on update cascade on delete cascade,
	species_habitat int not null constraint fk_habitat_id foreign key references tbl_habitat(habitat_id) on update cascade on delete cascade,
	species_nutrition int not null constraint fk_nutrition_id foreign key references tbl_nutrition(nutrition_id) on update cascade on delete cascade,
	species_care varchar(50) not null constraint fk_care_id foreign key references tbl_care(care_id) on update cascade on delete cascade
);


insert into tbl_species
	(species_name, species_anamalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	values
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
	('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5006, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
	('grey worlf', 1, 102, 1, 5000, 2201, 'care_4')
;

select
	a1.species_name, a2.anamalia_type,
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type,a7.care_type
	from tbl_species a1
	inner join tbl_anamalia a2 on a2.anamalia_id = a1.species_anamalia
	inner join tbl_class a3 on a3.class_id = a1.species_class
	inner join tbl_order a4 on a4.order_id = a1.species_order
	inner join tbl_habitat a5 on a5.habitat_id = a1.species_habitat
	inner join tbl_nutrition a6 on a6.nutrition_id = a1.species_nutrition
	inner join tbl_care a7 on a7.care_id = a1.species_care
	where species_name = 'ghost bat'
;

select
	a1.species_name, a2.habitat_type, a2.habitat_cost,
	a3.nutrition_type, a3.nutrition_cost
	from tbl_species a1
	inner join tbl_habitat a2 on a2.habitat_id = a1.species_habitat
	inner join tbl_nutrition a3 on a3.nutrition_id = a1.species_nutrition
	where species_name = 'ghost bat'
;