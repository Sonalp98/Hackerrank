-- If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

-- Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 

-- If there is more than one project that have the same number of completion days, then order by the start date of the project.

select start_date,end_date from
(select min(start_date) as start_date,max(end_date) as end_date,count(*)  as no_of_days from
(select *, start_date - row_number()over(order by start_date)  as grp from projects) s group by grp) s1 
order by no_of_days,start_date

-- It can be narrowed down to 

select min(start_date) as start_date,max(end_date) as end_date from
(select *, start_date - row_number()over(order by start_date)  as grp from projects) s 
group by grp
order by max(end_date)-min(start_date)
