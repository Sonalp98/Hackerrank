-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

--select f.x,f.y
from functions f
join functions f1
on f.x=f1.y and f.y=f1.x
where f.x<=f.y
group by f.x,f.y
having count(f.x)>1 or f.x<f.y
order by f.x
