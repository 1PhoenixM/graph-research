DROP FUNCTION IF EXISTS clusteringCoeffecient(int);

CREATE OR REPLACE FUNCTION clusteringCoeffecient(int) RETURNS FLOAT AS
$$
DECLARE
   vertexID int    := $1;
   vertexCount INTEGER;
   edgeCount INTEGER;
   secondaryEdgeCount INTEGER;
   finalEdgeCount INTEGER;
BEGIN
      select into vertexCount COUNT(id) from Vertices;
      select into edgeCount COUNT(vertexFrom) from Edges where vertexFrom = vertexID;
      select into secondaryEdgeCount COUNT(vertexTo) from Edges where vertexTo = vertexID;
      finalEdgeCount = edgeCount + secondaryEdgeCount;
      return (finalEdgeCount*2)/(vertexCount*(vertexCount-1));
END;
$$ 
LANGUAGE PLPGSQL;

select clusteringCoeffecient(1);