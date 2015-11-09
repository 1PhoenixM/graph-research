SELECT cast((e.perEdges*2)/(COUNT(v)*(COUNT(v)-1)) as float) AS clustercoeff
FROM Vertices v, (SELECT COUNT(e) AS perEdges
FROM Edges e, Vertices v
WHERE 
(e.vertexFrom = v.ID
OR e.vertexTo = v.ID)
AND v.ID = 1)  e
GROUP BY e.perEdges;
