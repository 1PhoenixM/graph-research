# Melissa Iori
# This module uses the NetworkX library to generate graphs and output them as text
import sys
import networkx as nx

# If less than three arguments, exit
# User can specify whether they want a bintree or a preferential attachment graph, followed by height (for bintree) OR number of vertices (for graph)
# Must specify the maximum number of edges one node can have in a graph, for bintree this value can be 0
# Finally, the output file name like out.txt
if(len(sys.argv) < 3):
    print('Usage: graphFileGenerator.py bintree | graph <height | # of nodes> <edges> output-file-name')
    sys.exit()
    
# If bintree, generate bintree of the specified height
if(sys.argv[1] == 'bintree'):
    G = nx.balanced_tree(2,int(sys.argv[2]));
# Otherwise, generate preferential attachment graph (nodes with many edges will get more edges) with the specified number of vertices and edge limit
else:
    G = nx.barabasi_albert_graph(int(sys.argv[2]), int(sys.argv[3])); 
 
# Get the nodes and edges of the graph in list form
nodes = G.nodes()
edges = G.edges()

# Open the output file   
file = open(sys.argv[4], 'w+');

# Write each node to the file
for x in range (0, len(nodes)):
    file.write(str(nodes[x]) + '\n');
	
# Write a separator
file.write('***');
file.write('\n');

# Write each edge to the file
for x in range (0, len(edges)):
    file.write(str(edges[x]) + '\n');
	
# Close the file
file.close();

# Tell the user we're done and where to find the output
print('Done, wrote to ' + sys.argv[4]);