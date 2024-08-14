-- Write a query to output the names of those students whose best friends got offered a higher salary than them. 

-- Names must be ordered by the salary amount offered to the best friends. 
-- It is guaranteed that no two students got same salary offer.

--If we want to know everything in detail 
Select s.*,s1.name as Friend_Name,p.salary as Salary,p1.salary as Friend_Salary
from Students s
join friends f
on s.id=f.id
join students s1
on f.friend_id=s1.id
join packages p
on s.id=p.id
join packages p1
on s1.id=p1.id
where p1.salary>p.salary
order by p1.salary;
-- Just student name 
Select s.name
from Students s
join friends f
on s.id=f.id
join packages p
on s.id=p.id
join packages p1
on f.friend_id=p1.id
where p1.salary>p.salary
order by p1.salary;
