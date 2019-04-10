# cascade

Collection of MATLAP source codes for implementing cascade algorithm
For more information, please see the publication: Identification of critical connectors in the directed reaction-centric graphs of microbial metabolic networks

Last update: 2019-04-10

This repository is administered by Sung Ho Yoon (syoon@konkuk.ac.kr), Department of Bioscience and Biotechnology, Konkuk University, Seoul, Republic of Korea

## Installation
### Required software:
* A functional Matlab installation (R2015a or higher).

### Required MATLAL source files 
(Locate following two files in the same folder which is set to be the working directory in MATLAB.)
* in_degrees.m : For calculating the in-degree of each node
* cascade.m : For calculating the cascade set of a given node

### Example MATLAB data files:
* directed_adjacency_matrix_of_ecoli_reaction_graph.mat : Adjacency matrix of the reaction graph converted from the metabolic network model of E.coli (iJO1366)
* rxn_list.mat : Reaction list of the E. coli reaction graph corresponding to the adjacency matrix

## Examples of MATLAB codes for calculating cascade numbers

### [Example 1] 
% Toy model in the paper "Identification of critical connectors in local connectivity and between modules in the directed biological network" 

% 1-1. To get a cascade number of a specific node: 

G = zeros(7,7);

G(1,2)=1; G(1,3)=1; G(1,4)=1; G(2,4)=1; G(3,4)=1; G(4,5)=1; G(5,6)=1; G(6,7)=1; G(7,6)=1;

affected_nodes = cascade(G,1)

cascade_number=length(affected_nodes)

 

% 1-2. To get all the cascade numbers of all nodes: 


list_of_cascade_number=zeros(1,7);

for i=1:7

	affected_nodes = cascade(G,i);
	
	list_of_cascade_number(1,i)=length(affected_nodes);
	
end

list_of_cascade_number

### [Example 2] 
% To get the list of the cascade numbers of all nodes of the reaction graph converted from the metabolic network model of E.coli (iJO1366). 

load('rxn_list.mat');

load('directed_adjacency_matrix_of_ecoli_reaction_graph.mat');

list_of_cascade_number=zeros(1,1251);

for i=1:1251

	affected_nodes = cascade(ijo1366_diadjBIG3,i);
	
	list_of_cascade_number(1,i)=length(affected_nodes);
	
end

list_of_cascade_number


## Contributors
* Eun-Youn Kim (eunykim@hanbat.ac.kr), Hanbat National University, Daejeon, Republic of Korea
* Daniel Ashlock (dashlock@uoguelph.ca), University of Guelph, Ontario, Canada
* Sung Ho Yoon (syoon@konkuk.ac.kr), Konkuk University, Seoul, Republic of Korea
