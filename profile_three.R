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
#
source(profile_base.R)
#
three_profile_edge <- function(e){#Counts order three edge rooted graphs
	## Input:
	# e: The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies of conected simple graphs over 3 nodes attached to each edge in g
	#
	## Below are functions to plot the graphs considered using the package igraph
	# library(igraph)
	# C3=graph_from_edgelist(t(matrix(c(1,2,2,3,3,1),nrow=2)),F);
		# V(C3)$color = c('red','red','gray')
		# V(C3)$label = c('a','b','')
		# E(C3)$color = c('red','gray','gray')
		# plot(C3);
	# P3=graph_from_edgelist(t(matrix(c(1,2,2,3),nrow=2)),F);
		# V(P3)$color = c('red','red','gray')
		# V(P3)$label = c('a','b','')
		# E(P3)$color = c('red','gray')
		# plot(P3);
	# To Plot all graphs
	# quartz()
	# par(mfrow=c(1,2),
		# oma = c(0,0,0,0) + 0.1,
		# mar = c(0,0,2,0) + 0.1)
		# plot(C3); plot(P3);
	#
	## bais Object
	b <- get.backtrack(e)*1.0;#non-backtracking matrix of g with row and column in specific ordering
		s1 <- seq(1,nrow(b)-1,by=2);#edges in first direction
		s2 <- seq(2,nrow(b),by=2);#edges in reverse direction
		ss <- 1:nrow(b); ss[s1] = s2; ss[s2]=s1;#index to flip direction of all edges
	#
	## Subgraph count
	Y_C3 <- rowSums((b%*%b)*t(b))[s1];
	Y_P3 <- rowSums(b);
	#
	## Output
	return(cbind(Y_P3[s1],Y_P3[s2],Y_C3))
}
#
three_profile_node <- function(e){#Counts order three vertex rooted graphs
	## Input:
	# e : The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies conected rooted graphs over 3 nodes attached to each node in g
	#
	## Basic Objects
	e <- e[do.call(order, lapply(1:ncol(e), function(i) e[, i])),]; #Order e lexicographicaly (g is simple so order is indiferent); this is to match the ordering in profile0 below
	profile0 <- three_profile_edge(e);
	rez <- matrix(0,max(e),3)
	#
	## Subgraph counting
	for (i in 1:nrow(e)){#Count the number of subgraph attached to each vertex by going throug each edges
		rez[e[i,1],] <- rez[e[i,1],]+profile0[i,];
		rez[e[i,2],] <- rez[e[i,2],]+profile0[i,c(2,1,3)];
	}
	#Each subgraph count has been counted d times, where d is the degree of the root vertex in the graph. So we normalize.
	rez[,2:3] <- rez[,2:3]/2;
	#
	## Output
	return(rez)
}
#
three_profile_total <- function(e){#Counts order thee subgraphs
	## Input:
	# e:The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies of all conected graphs over 3 nodes in g
	#
	#
	## Basic Objects
	rez <- colSums(three_profile_edge(e));
	#
	## Subgraph coutning
	#Each subgraph is counted as many times as it has edges, so we normalize and colpse across location of the root nodes.
	rez <- c(nrow(e),(rez[1]+rez[2])/2,rez[3]/3);
	#
	## Output
	return(rez)
}