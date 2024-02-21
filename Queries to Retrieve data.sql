-- 1. Retrieve the names of  10 blood donors ordered by their registration dates
SELECT bd_name
FROM Blood_Donor
ORDER BY bd_reg_date limit 10;


-- 2. Retrieve the names of recipients who are male, aged between 20 and 80, and need blood of type 'B+' or 'AB+'.
SELECT reci_name 
FROM Recipient 
WHERE reci_sex = 'M' 
AND reci_age BETWEEN 20 AND 80 
AND (reci_Brgp = 'B+' OR reci_Brgp = 'AB+');

-- 3. Retrieve the names of recipients who have a blood quantity greater than 1 and are from cities other than 'Irving'.
SELECT reci_name 
FROM Recipient 
WHERE reci_Bqnty > 1 
AND City_ID NOT IN (SELECT City_ID FROM City WHERE City_name = 'Irving');

-- 4. Retrieve the  10 names of recipients along with the hospitals they are associated with, ordered by the quantity of blood needed in descending order.
SELECT distinct  r.reci_name, hi.hosp_name, r.reci_Bqnty 
FROM Recipient r 
JOIN Hospital_Info_1 hi ON r.City_ID = hi.City_ID 
ORDER BY r.reci_Bqnty DESC limit 10;

-- 5. Find the names and ages of all recipients who are registered in hospitals located in cities other than Houston.
SELECT distinct r.reci_name, r.reci_age
FROM Recipient r
JOIN Hospital_Info_1 hi ON r.M_id = hi.M_id
JOIN City c ON hi.City_ID = c.City_ID
WHERE c.City_name <> 'Houston' limit 8;


-- 6. List the hospitals along with their names and the corresponding city they are located in ?

SELECT DISTINCT h.hosp_name, c.City_name 
FROM Hospital_Info_1 h
JOIN City c ON h.City_ID = c.City_ID;

-- 7.  List the blood groups along with the total quantity needed in each hospital.

SELECT DISTINCT hosp_name, hosp_needed_Bgrp, SUM(hosp_needed_qnty) AS Total_Quantity
FROM Hospital_Info_2
GROUP BY hosp_name, hosp_needed_Bgrp LIMIT 10;


-- 8. Find Recipients with Blood Quantity Greater Than a Specified BLOOD QUANTITY > 2:
SELECT reci_name, reci_Bqnty
FROM Recipient
WHERE reci_Bqnty > 1.5;

-- 9. Find Blood Donors Who are Female and Aged Between 30 and 40:

SELECT bd_name, bd_age, bd_sex
FROM Blood_Donor
WHERE bd_sex = 'F' AND bd_age BETWEEN 30 AND 40;