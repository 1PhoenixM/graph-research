SELECT cast((e.perEdges*2)/(COUNT(v)*(COUNT(v)-1)) as float) AS clustercoeff
FROM Vertices v, getEdgesForVertex e
GROUP BY e.perEdges;