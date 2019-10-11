use db_zooTest
go

/* drill one */

select * from tbl_habitat;

/* drill two */

select * from tbl_species where species_order = 3;

/* drill three */

select * from tbl_nutrition where nutrition_cost <= 600;

/* drill four */

select * from tbl_nutrition where nutrition_id >=2202 and nutrition_id <=2206;

/* drill five */

SELECT
		a1.species_name as 'Species Name:',	a2.nutrition_type as 'Nutrition Type:'
		FROM tbl_species a1
		INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
		
	;

/* drill six */

SELECT
		a3.specialist_fname, a3.specialist_lname, a3.specialist_contact

		FROM tbl_species a1
		INNER JOIN tbl_care a2 ON a2.care_id = a1.species_care
		INNER JOIN tbl_specialist a3 on a3.specialist_id = a2.care_specialist
		WHERE species_name = 'penguin'
	;
	
/* drill seven */


CREATE DATABASE db_nbaPlayers;

USE db_nbaPlayers;

CREATE TABLE tbl_nbaPlayers (
	nbaPlayers_id INT PRIMARY KEY not null IDENTITY (1,1),
	nbaPlayers_fname varchar(50) not null,
	nbaPlayers_lname varchar(50) not null
);

INSERT INTO tbl_nbaPlayers 
	(nbaPlayers_fname, nbaPlayers_lname)
	VALUES
	('LeBron', 'James'),
	('Damian', 'Lillard'),
	('Kevin', 'Durant')
;


CREATE TABLE tbl_teamInfo (
	team_id INT PRIMARY KEY not null IDENTITY (1,1),
	team_jersey VARCHAR(50) not null,
	team_pos VARCHAR(50) not null
);

INSERT INTO tbl_teamInfo
	(team_jersey, team_pos)
	VALUES
	('23', 'Small Forward'),
	('0', 'Point Guard'),
	('35', 'Small Forward')
;

select * from tbl_teamInfo;


CREATE TABLE tbl_roster (
	roster_id int primary key not null identity (1,1),
	roster_team varchar(50) not null,
	roster_player int not null constraint fk_player_id foreign key references tbl_nbaPlayers(nbaPlayers_id) on update cascade on delete cascade,
	roster_info int not null constraint fk_team_id foreign key references tbl_teamInfo(team_id) on update cascade on delete cascade,
);

INSERT INTO tbl_roster
	(roster_team, roster_player, roster_info)
	VALUES
	('Los Angelese Lakers', 1, 1),
	('Portland Trail Blazers', 2, 2),
	('Golden State Warriors', 3, 3)
;

SELECT
		a1.roster_team, a2.nbaPlayers_fname, a2.nbaPlayers_lname, a3.team_jersey, a3.team_pos

		FROM tbl_roster a1
		INNER JOIN tbl_nbaPlayers a2 ON a2.nbaPlayers_id = a1.roster_player
		INNER JOIN tbl_teamInfo a3 on a3.team_id = a1.roster_info
		WHERE roster_team = 'Portland Trail Blazers'
	;
