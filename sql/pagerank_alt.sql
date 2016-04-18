SELECT ((1-0.85/COUNT(v))+0.85) * p.sum AS pagerank
FROM Vertices v, (SELECT SUM(reciprocal) 
FROM (SELECT cast(1/COUNT(e) as numeric) AS reciprocal
FROM Edges e, Vertices v
WHERE (v.ID = e.vertexFrom OR v.ID = e.vertexTo)
GROUP BY v.ID
) AS sum) p
GROUP BY p.sum;
