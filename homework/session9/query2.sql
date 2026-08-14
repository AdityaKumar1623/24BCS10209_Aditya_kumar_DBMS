SELECT cuisine,
SUM(CASE WHEN category = 'Non veg' THEN price ELSE 0 END) as Non_Veg_Price 
FROM Orders
GROUP BY 1;
