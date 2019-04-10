function id = in_degrees(CIJ)
%IN_DEGREES        Indegree
%
%   id = in_degrees(CIJ);
%
%   The indegree is the number of inward links.
%
%   Input:      CIJ,    directed (binary/weighted) connection matrix
%   Output:     id,     node indegree
%
%   Notes:  Inputs are assumed to be on the columns of the CIJ matrix.
%           Weight information is discarded.
%

% ensure CIJ is binary...
CIJ = double(CIJ~=0);

% compute degrees
id = sum(CIJ,1);    % indegree = column sum of CIJ