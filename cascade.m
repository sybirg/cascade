function [affected_nodes, A1] = cascade(A0, facet_node, affected_nodes)
%  CASCADE    set of affected nodes by attacking a node(cascade set)
%  Let's think about information flow in a directed network system.
%
%  If an facet node is locked or attacted by an accident,
%  a bunch of nodes would not be received any information flow.
%
%  This program is to find a list of nodes
%  that is affectected by an attact or malfunction of a facet node.
%   
%  Input
%    A0             : adjacency matrix
%    facet_node     : node number to lock or to make malfuncting.
%
%  Output 
%    affected nodes : list of nodes that is affected by locking the facet=cascade set
%  
%    A1             : adjacency matrix after removing out-flow connections
%
%  IMPORTANT!!
%    Please do not INSERT the third input argument when you use.
%    Please do not RECEIVE the second output argement when you use.
%    That is because the third input argument and second output arguments 
%    are only used for a recursive operation of CASCADE function.
%   
%  Example 
%    G = zeros(7,7);
%    G(1,2)=1; G(1,3)=1; G(1,4)=1; G(2,4)=1; G(3,4)=1; G(4,5)=1; G(5,6)=1; G(6,7)=1; G(7,6)=1;
%    affected_nodes = cascade(G,1)
%    cascade number=lengh(affected_nodes)

% Initialize a variable: affected_nodes
if nargin<3, affected_nodes = []; end;
A1 = A0;

% Compute in-degree of the input graph (A0)
indeg_prev       = in_degrees(A0)>0;

% Remove out-flow connections (or arcs) of the facet node
nNode            = length(A0);
A1(facet_node,:) = zeros(1,nNode);

% Compute in-degree after removing affected nodes after locking the facet node
indeg            = in_degrees(A1)>0;

% find differences of the in-degree before and after locking the facet node
bloked_nodes     = find(indeg_prev-indeg);
affected_nodes   = [affected_nodes, bloked_nodes];
affected_nodes   = unique(affected_nodes);  % To avoide duplicated nodes

% Recurssively do the above processes until there is no further out-flow
% connections of the input facet_node (facet_node).
if ~isempty(bloked_nodes),
    Nconnected = length(bloked_nodes);
    for i=1:Nconnected,
        node_i = bloked_nodes(i);
        [affected_nodes, A1] = cascade(A1, node_i, affected_nodes);
    end    
end