DROP TABLE IF EXISTS Edges;
DROP TABLE IF EXISTS Vertices;

CREATE TABLE Vertices(
	id int primary key
);

CREATE TABLE Edges(
	vertexFrom int references Vertices(id),
	vertexTo int references Vertices(id)
);