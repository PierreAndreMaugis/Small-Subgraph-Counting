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
source(profile_base.R)
#
four_profile_edge <- function(e){#Counts order four edge rooted graphs
	## Input:
	# e: The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies of conected simple graphs over 4 nodes attached to each edge in g
	#
	## Below are functions to plot the graphs considered using the package igraph
	# library(igraph)
	# F1=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1),nrow=2)),F);
		# F11 = F1;
			# V(F11)$color = c('red','red','gray','gray')
			# V(F11)$label = c('1','2','','')
			# E(F11)$color = c('red','gray','gray','gray')
			# plot(F11);
	# F2=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4),nrow=2)),F);
		# F21=F2;
			# V(F21)$color = c('red','red','gray','gray')
			# V(F21)$label = c('1','2','','')
			# E(F21)$color = c('red','gray','gray')
			# plot(F21);
		# F22=F2;
			# V(F22)$color = c('red','red','gray','gray')
			# V(F22)$label = c('2','1','','')
			# E(F22)$color = c('red','gray','gray')
			# plot(F22);
		# F23=F2;
			# V(F23)$color = c('gray','red','red','gray')
			# V(F23)$label = c('','1','2','')
			# E(F23)$color = c('gray','red','gray')
			# plot(F23);
	# F3=graph_from_edgelist(t(matrix(c(1,2,1,3,1,4),nrow=2)),F)
		# F31=F3;
			# V(F31)$color = c('red','red','gray','gray')
			# V(F31)$label = c('1','2','','')
			# E(F31)$color = c('red','gray','gray')
			# plot(F31);
		# F32=F3;
			# V(F32)$color = c('red','red','gray','gray')
			# V(F32)$label = c('2','1','','')
			# E(F32)$color = c('red','gray','gray')
			# plot(F32);
	# F4=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,2),nrow=2)),F);
		# F41=F4;
			# V(F41)$color = c('red','red','gray','gray')
			# V(F41)$label = c('1','2','','')
			# E(F41)$color = c('red','gray','gray','gray')
			# plot(F41);
		# F42=F4;
			# V(F42)$color = c('red','red','gray','gray')
			# V(F42)$label = c('2','1','','')
			# E(F42)$color = c('red','gray','gray','gray')
			# plot(F42);
		# F43=F4;
			# V(F43)$color = c('gray','gray','red','red')
			# V(F43)$label = c('','','1','2')
			# E(F43)$color = c('gray','gray','red','gray')
			# plot(F43);
		# F44=F4;
			# V(F44)$color = c('gray','red','red','gray')
			# V(F44)$label = c('','2','1','')
			# E(F44)$color = c('gray','red','gray','gray')
			# plot(F44);
		# F45=F4;
			# V(F45)$color = c('gray','red','red','gray')
			# V(F45)$label = c('','1','2','')
			# E(F45)$color = c('gray','red','gray','gray')
			# plot(F45);
	# F5=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1,1,3),nrow=2)),F); plot(F5);
		# F51=F5;
			# V(F51)$color = c('red','gray','red','gray')
			# V(F51)$label = c('1','','2','')
			# E(F51)$color = c('gray','gray','gray','gray','red')
			# plot(F51);
		# F52=F5;
			# V(F52)$color = c('red','red','gray','gray')
			# V(F52)$label = c('2','1','','')
			# E(F52)$color = c('red','gray','gray','gray','gray')
			# plot(F52);
		# F53=F5;
			# V(F53)$color = c('red','red','gray','gray')
			# V(F53)$label = c('1','2','','')
			# E(F53)$color = c('red','gray','gray','gray','gray')
			# plot(F53);
	# F61=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1,1,3,2,4),nrow=2)),F);
			# V(F61)$color = c('red','red','gray','gray')
			# V(F61)$label = c('1','2','','')
			# E(F61)$color = c('red','gray','gray','gray','gray','gray')
			# plot(F61);
	# ##Loop To Plot all graphs
	# quartz()
	# m = c(1,3,2,5,3,1)
	# par(mfrow=c(3,5),
		# oma = c(0,0,0,0) + 0.1,
		# mar = c(0,0,2,0) + 0.1)
	# for (k in 1:6){
		# for (l in 1:m[k]){
		# titl = paste('F',k,l,sep='');
		# pol = 'sans'
		# eval(parse(text=paste('plot(F',k,l,',main=titl,layout = layout.circle(F',k,l,'),vertex.size=70,edge.width=2,vertex.label.family=pol)',sep='')));
	# }}
	#
	## Basic Objects
	b <- get.backtrack(e)*1.0;#non-backtracking matrix of g with row and column in specific ordering
		s1 <- seq(1,nrow(b)-1,by=2);#edges in first direction
		s2 <- seq(2,nrow(b),by=2);#edges in reverse direction
		ss <- 1:nrow(b); ss[s1] = s2; ss[s2]=s1;#index to flip direction of all edges
	b2 <- b%*%b;
	b_sq <- b2*t(b2);#b_sq[e,e']=1 if there exists e_1 and e_2 such that ee_1e'e_2 is a closed non-backtracking walk of length 4 (i.e. induce a square)
	#
	## Subgraph counting
	X1  <- rowSums(b_sq);
	X21 <- rowSums(b2)-rowSums(b2*t(b));
	  X22 <- X21[ss];
	  X23 <- rowSums(b)*rowSums(b[ss,])-rowSums(b2*t(b));
	X31 <- choose(rowSums(b),2);
	  X32 <- X31[ss];
	X41 <- rowSums(b2*b2[,ss])/2;
	  X42 <- X41[ss];
	  X43 <- colSums(b2*b2[,ss]);
	  X44 <- rowSums(b2*t(b))*(rowSums(b)-1);
	  X45 <- X44[ss];
	X51 <- choose(rowSums(b2*t(b)),2);
	  X52 <- rowSums(b_sq*b2[,ss]);
	  X53 <- X52[ss];
	X6  <- rowSums(b_sq*b_sq[,ss])/2;
	#
	## Output
	return(cbind(X1,X21,X22,X23,X31,X32,X41,X42,X43,X44,X45,X51,X52,X53,X6)[s1,])
}
#
four_profile_node <- function(e){#Counts order four node vertex graphs
	## Input:
	#e :The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies conected rooted graphs over 4 nodes attached to each node in g
	#
	## Below are functions to plot the graphs considered using the package igraph
	# library(igraph)
	# F1=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1),nrow=2)),F);
		# F11 = F1; V(F11)$color = 'gray'; V(F11)$color[1] = 'red'; plot(F11);
	# F2=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4),nrow=2)),F);
		# F21 = F2; V(F21)$color = 'gray'; V(F21)$color[1] = 'red'; plot(F21);
		# F22 = F2; V(F22)$color = 'gray'; V(F22)$color[2] = 'red'; plot(F22);
	# F3=graph_from_edgelist(t(matrix(c(1,2,1,3,1,4),nrow=2)),F)
		# F31 = F3; V(F31)$color = 'gray'; V(F31)$color[1] = 'red'; plot(F31);
		# F32 = F3; V(F32)$color = 'gray'; V(F32)$color[2] = 'red'; plot(F32);
	# F4=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,2),nrow=2)),F);
		# F41 = F4; V(F41)$color = 'gray'; V(F41)$color[1] = 'red'; plot(F41);
		# F42 = F4; V(F42)$color = 'gray'; V(F42)$color[2] = 'red'; plot(F42);
		# F43 = F4; V(F43)$color = 'gray'; V(F43)$color[3] = 'red'; plot(F43);
	# F5=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1,1,3),nrow=2)),F); plot(F5);
		# F51 = F5; V(F51)$color = 'gray'; V(F51)$color[1] = 'red'; plot(F51);
		# F52 = F5; V(F52)$color = 'gray'; V(F52)$color[2] = 'red'; plot(F52);
	# F61=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1,1,3,2,4),nrow=2)),F);
		# F61 = F6; V(F61)$color = 'gray'; V(F61)$color[1] = 'red'; plot(F61);
	# ##Loop To Plot all graphs
	# quartz()
	# m = c(1,2,2,3,2,1)
	# par(mfrow=c(3,4),
		# oma = c(0,0,0,0) + 0.1,
		# mar = c(0,0,2,0) + 0.1)
	# for (k in 1:6){
		# for (l in 1:m[k]){
		# titl = paste('F',k,l,sep='');
		# pol = 'sans'
		# eval(parse(text=paste('plot(F',k,l,',main=titl,layout = layout.circle(F',k,l,'),vertex.size=70,edge.width=2,vertex.label=NA)',sep='')));	}}
	#
	## Basic Objects
	e <- e[do.call(order, lapply(1:ncol(e), function(i) e[, i])),]; #Order e lexicographicaly (g is simple so order is indiferent); this is to match the ordering in profile0 below.
	profile0 <- four_profile_edge(e);
	rez <- matrix(0,max(e),11);
	#
	## Subgrah counting
	for (i in 1:nrow(e)){#Count the number of subgraph attached to each node by going throug each edges
		rez[e[i,1],] <- rez[e[i,1],]+profile0[i,c(1,2,3,5,6,7,8,9,12,14,15)];
		rez[e[i,1],c(3,8,7,10)] <- rez[e[i,1],c(3,8,7,10)]+profile0[i,c(4,10,11,13)];
		rez[e[i,2],] <- rez[e[i,2],]+profile0[i,c(1,3,2,6,5,8,7,9,12,13,15)];
		rez[e[i,2],c(3,7,8,10)] <- rez[e[i,2],c(3,7,8,10)]+profile0[i,c(4,10,11,14)];
	}
	#Each subgraph count has been counted d times, where d is the degree of the root node in the graph. So we normalize.
	rez[, 1]<-rez[, 1]/2;
	rez[, 3]<-rez[, 3]/2;
	rez[, 5]<-rez[, 5]/3;
	rez[, 7]<-rez[, 7]/3;
	rez[, 8]<-rez[, 8]/2;
	rez[, 9]<-rez[, 9]/3;
	rez[,10]<-rez[,10]/2;
	rez[,11]<-rez[,11]/4;
	#
	## Output
	return(rez)
}
#
four_profile_total <- function(e){#Counts order four subgraphs
	## Input:
	# e : The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies of all conected graphs over 4 nodes in g
	#
	## Basic object
	rez <- colSums(four_profile_edge(e))
	#
	## Subgraph counting
	#Each subgraph is counted as many times as it has edges, so we normalize and colpse across location of the root nodes.
	rez <- c(rez[1]/4, sum(rez[2:4])/3, sum(rez[5:6])/3, sum(rez[7:11])/4, sum(rez[12:14])/5, rez[15]/6);
	#
	## Output
	return(rez)
}