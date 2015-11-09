SELECT AVG(ecount.count) FROM
(SELECT COUNT(e)
FROM Edges e, Vertices v
WHERE (v.ID = e.vertexFrom OR v.ID = e.vertexTo)
GROUP BY v.ID
ORDER BY v.ID) ecount;