SELECT
    c.FullName,
    SUM(fs.TotalAmount) AS TotalVentas
FROM
    FactSales AS fs
JOIN
    DimCustomer AS c ON fs.CustomerKey = c.CustomerKey
GROUP BY
    c.FullName
ORDER BY
    TotalVentas DESC;