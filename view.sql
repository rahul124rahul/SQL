-- views

select * from stud_score;

create view view1 as
select name , rollno, marks from stud_score
order by marks desc
limit 3;

select * from view1;

drop view view1;

create view view1 as
select name , rollno, marks from stud_score;
select * from view1;

select * from view1
where rollno%2=1;