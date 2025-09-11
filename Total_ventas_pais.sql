SELECT
    c.Country,
    SUM(fs.TotalAmount) AS TotalVentas
FROM
    FactSales AS fs
JOIN
    DimCustomer AS c ON fs.CustomerKey = c.CustomerKey
GROUP BY
    c.Country
ORDER BY
    TotalVentas DESC;