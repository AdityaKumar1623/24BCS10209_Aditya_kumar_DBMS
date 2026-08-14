



-- Delete John Doe's details from the Customers table
DELETE FROM Customers WHERE customer_name = 'John Doe';

-- Or, check the changes in the Orders table (after ON DELETE SET NULL)
SELECT * FROM Orders;
