SELECT
    p.Artist,
    SUM(fs.TotalAmount) AS TotalVentas
FROM
    FactSales AS fs
JOIN
    DimProduct AS p ON fs.ProductKey = p.ProductKey
GROUP BY
    p.Artist
ORDER BY
    TotalVentas DESC;