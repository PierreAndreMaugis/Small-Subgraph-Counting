#   Copyright (C) 2017 Pierre-André MAUGIS (arXiv:1701.00177)
#   This code comes with ABSOLUTELY NO WARRANTY.
#   This is free software, and you are welcome to redistribute it
#   under certain conditions; see attached LICENSE file for details.
#
#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 2 of the License, or (at
#     your option) any later version.
# 
#     This program is distributed in the hope that it will be useful, but
#     WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#     General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program; if not, write to the Free Software
#     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
#     02110-1301 USA.
#
#
library(Matrix)
#
Schoose2 <- function(M){return(M*(M-1)/2)};#choose(M,2) for sparse matrix
#
Schoose3 <- function(M){return(M*(M-1)*(M-2)/6)};#choose(M,3) for sparse matrix
#
get.backtrack <- function(e){#Creates the non-backtracking matrix of a graph from its edgelist.
	## Input:
	# e: The edgelist of a simple graph g, nodes are assumed to be labeled by succecive numbers starting from 1
	#
	## Output:
	# The non-backtrakcing matrix of g
	#
	#
	## Constructed directed edgelist
	e <- e[do.call(order, lapply(1:ncol(e), function(i) e[, i])),]; #Order e lexicographicaly (g is simple so order is indiferent)
	e_dir <- matrix(0,2*nrow(e),2); #create a directed edge-list where if ij is an undirected edge in e, then ji suceeds ij in e_dir
		e_dir[seq(1,2*nrow(e)-1,by=2),] <- e;
		e_dir[seq(2,2*nrow(e),by=2),] <- e[,c(2,1)];
	ord <- do.call(order, lapply(1:ncol(e_dir), function(i) e_dir[, i]));#e_ord is e_dir ordered lexicographicaly. The permutation is saved for future use.
		e_ord <- e_dir[ord,];
	#
	## Inputing non-backtracking matrix
	d <- apply(matrix(1:max(e),1),2,function(x){length(which(e==x))}); #compute the degree of each vertex
	dind <- c(0,cumsum(d));
	if (nrow(e)<500) {b <- b_dir <- matrix(0,nrow(e_dir),nrow(e_dir))} else {b <- b_dir <- Matrix(0,nrow(e_dir),nrow(e_dir))}; #Creates output matrix
	for (i in 1:nrow(e_ord)){#Loop over each edge and uses the degree of the tail vertex to efficiently imput entries in b
		j <- e_ord[i,2]; #label of the tail node
		c <- dind[j]+(1:d[j]); #vertices connected to j
		cnb <- c[e_ord[c,2]!=e_ord[i,1]]; #vertices connected to j that are not i
		if (length(cnb)!=0){b[i,cnb]<-as.double(1.0)}; #input matrix b
	}
	b_dir[ord,ord] <- b; #Reorders the rows and column of b to be as as that of e_dir
	#
	## Output
	return(b_dir)
}