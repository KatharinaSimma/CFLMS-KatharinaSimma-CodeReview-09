/*I use the format-button in phpMyAdmin which makes it easier to read for me*/



/* Who works for the Ankh-Morpork Post Office?*/
SELECT
    employee_id,
    first_name,
    last_name
FROM
	employee;

/* Who works for the Ankh-Morpork Post Office and is from Überwald (= name starts with von)?*/
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employee
WHERE
    last_name LIKE "von%";


/* Where do our customers live? */
SELECT
    customer_id,
    first_name,
    last_name,
    address
FROM
    customer
INNER JOIN address ON fk_address_id = address_id;

/* Which customer send a package to which address, when did they drop it off, when was it delivered and which office was in charge of the delivery?*/

SELECT
    customer_id,
    first_name,
    last_name,
    address,
    drop_off_date,
    delivery_date,
    office_id
FROM
    package
JOIN customer ON package.fk_customer_id = customer.customer_id
JOIN address ON package.fk_address_id = address.address_id
JOIN route ON package.fk_route_id = route.route_id
JOIN office ON package.fk_office_id = office.office_id


/* Which employees worked before November 3 and on what route? */
SELECT
    employee_id,
    first_name,
    last_name,
    route_id,
    delivery_date
FROM
    employee
INNER JOIN route ON employee.employee_id = route.route_id
WHERE route.delivery_date < '2020-11-03'
ORDER BY route.delivery_date;

/* List of all packages with the cheapest postage */
SELECT
	package.package_id
FROM
    package
WHERE
	postage = (SELECT min(postage) from package);