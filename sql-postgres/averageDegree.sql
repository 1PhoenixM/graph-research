DROP FUNCTION IF EXISTS averageDegree();

CREATE OR REPLACE FUNCTION averageDegree() RETURNS FLOAT AS
$$
DECLARE
   v Vertices%rowtype;
   vertexCount INTEGER;
   edgeCount INTEGER;
   secondaryEdgeCount INTEGER;
   finalEdgeCount INTEGER;
   degreeTotal INTEGER = 0;
BEGIN
    select into vertexCount COUNT(id) from Vertices;	
    FOR v IN SELECT * FROM Vertices
    LOOP
       select into edgeCount COUNT(vertexFrom) from Edges where vertexFrom = v.id;
       select into secondaryEdgeCount COUNT(vertexTo) from Edges where vertexTo = v.id;
       finalEdgeCount = edgeCount + secondaryEdgeCount;
       degreeTotal = degreeTotal + finalEdgeCount;
    END LOOP;
    RETURN degreeTotal / vertexCount;
END;
$$ 
LANGUAGE PLPGSQL;

select averageDegree();