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
five_profile_edge <- function(e){#Counts order five edge rooted graphs
	## Input:
	# e: The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies of conected simple graphs over 5 nodes attached to each edge in g.
	#
	## Below are functions to plot the graphs considered using the package igraph
	# library(igraph)
	# F2=graph_from_edgelist(t(matrix(c(1,2,1,3,1,4,4,5),nrow=2)),F); plot(F2);
		# F21 = F2;
			# V(F21)$color = c('red','red','gray','gray','gray')
			# V(F21)$label = c('2','1','','','')
			# E(F21)$color = c('red','gray','gray','gray')
			# plot(F21);
		# F22 = F2;
			# V(F22)$color = c('red','red','gray','gray','gray')
			# V(F22)$label = c('1','2','','','')
			# E(F22)$color = c('red','gray','gray','gray')
			# plot(F22);
		# F23 = F2;
			# V(F23)$color = c('red','gray','gray','red','gray')
			# V(F23)$label = c('2','','','1','')
			# E(F23)$color = c('gray','gray','red','gray')
			# plot(F23);
		# F24 = F2;
			# V(F24)$color = c('red','gray','gray','red','gray')
			# V(F24)$label = c('1','','','2','')
			# E(F24)$color = c('gray','gray','red','gray')
			# plot(F24);
		# F25 = F2;
			# V(F25)$color = c('gray','gray','gray','red','red')
			# V(F25)$label = c('','','','2','1')
			# E(F25)$color = c('gray','gray','gray','red')
			# plot(F25);
		# F26 = F2;
			# V(F26)$color = c('gray','gray','gray','red','red')
			# V(F26)$label = c('','','','1','2')
			# E(F26)$color = c('gray','gray','gray','red')
			# plot(F26);
	# F3=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5),nrow=2)),F); plot(F3);
		# F31 = F3;
			# V(F31)$color = c('red','red','gray','gray','gray')
			# V(F31)$label = c('1','2','','','')
			# E(F31)$color = c('red','gray','gray','gray')
			# plot(F31);
		# F32 = F3;
			# V(F32)$color = c('red','red','gray','gray','gray')
			# V(F32)$label = c('2','1','','','')
			# E(F32)$color = c('red','gray','gray','gray')
			# plot(F32);
		# F33 = F3;
			# V(F33)$color = c('gray','red','red','gray','gray')
			# V(F33)$label = c('','1','2','','')
			# E(F33)$color = c('gray','red','gray','gray')
			# plot(F33);
		# F34 = F3;
			# V(F34)$color = c('gray','red','red','gray','gray')
			# V(F34)$label = c('','2','1','','')
			# E(F34)$color = c('gray','red','gray','gray')
			# plot(F34);
	# F4=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2),nrow=2)),F); plot(F4);
		# F41 = F4;
			# V(F41)$color = c('red','red','gray','gray','gray')
			# V(F41)$label = c('1','2','','','')
			# E(F41)$color = c('red','gray','gray','gray','gray')
			# plot(F41);
		# F42 = F4;
			# V(F42)$color = c('red','red','gray','gray','gray')
			# V(F42)$label = c('2','1','','','')
			# E(F42)$color = c('red','gray','gray','gray','gray')
			# plot(F42);
		# F43 = F4;
			# V(F43)$color = c('gray','red','red','gray','gray')
			# V(F43)$label = c('','1','2','','')
			# E(F43)$color = c('gray','red','gray','gray','gray')
			# plot(F43);
		# F44 = F4;
			# V(F44)$color = c('gray','red','red','gray','gray')
			# V(F44)$label = c('','2','1','','')
			# E(F44)$color = c('gray','red','gray','gray','gray')
			# plot(F44);
		# F45 = F4;
			# V(F45)$color = c('gray','gray','gray','red','red')
			# V(F45)$label = c('','','','1','2')
			# E(F45)$color = c('gray','gray','gray','red','gray')
			# plot(F45);
		# F46 = F4;
			# V(F46)$color = c('gray','gray','gray','red','red')
			# V(F46)$label = c('','','','2','1')
			# E(F46)$color = c('gray','gray','gray','red','gray')
			# plot(F46);
	# F5=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,2,2,5),nrow=2)),F); plot(F5);
		# F51 = F5;
			# V(F51)$color = c('red','red','gray','gray','gray')
			# V(F51)$label = c('2','1','','','')
			# E(F51)$color = c('red','gray','gray','gray','gray')
			# plot(F51);
		# F52 = F5;
			# V(F52)$color = c('red','red','gray','gray','gray')
			# V(F52)$label = c('1','2','','','')
			# E(F52)$color = c('red','gray','gray','gray','gray')
			# plot(F52);
		# F53 = F5;
			# V(F53)$color = c('gray','red','red','gray','gray')
			# V(F53)$label = c('','2','1','','')
			# E(F53)$color = c('gray','red','gray','gray','gray')
			# plot(F53);
		# F54 = F5;
			# V(F54)$color = c('gray','red','red','gray','gray')
			# V(F54)$label = c('','1','2','','')
			# E(F54)$color = c('gray','red','gray','gray','gray')
			# plot(F54);
		# F55 = F5;
			# V(F55)$color = c('gray','gray','red','red','gray')
			# V(F55)$label = c('','','1','2','')
			# E(F55)$color = c('gray','gray','red','gray','gray')
			# plot(F55);
	# F6=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,1),nrow=2)),F); plot(F6);
		# F61 = F6
			# V(F61)$color = c('red','red','gray','gray','gray')
			# V(F61)$label = c('1','2','','','')
			# E(F61)$color = c('red','gray','gray','gray','gray')
			# plot(F61);
	# F7=make_full_graph(5); plot(F7);
		# F71 = F7
			# V(F71)$color = c('red','red','gray','gray','gray')
			# V(F71)$label = c('1','2','','','')
			# E(F71)$color = c('red',rep('gray',9))
			# plot(F71);
	# F8=make_full_graph(5)-edge(10); plot(F8);
		# F81 = F8;
			# V(F81)$color = c('red','red','gray','gray','gray')
			# V(F81)$label = c('1','2','','','')
			# E(F81)$color = c('red',rep('gray',8))
			# plot(F81);
		# F82 = F8;
			# V(F82)$color = c('gray','gray','red','red','gray')
			# V(F82)$label = c('','','1','2','')
			# E(F82)$color = c(rep('gray',7),'red','gray')
			# plot(F82);
		# F83 = F8;
			# V(F83)$color = c('gray','gray','red','red','gray')
			# V(F83)$label = c('','','2','1','')
			# E(F83)$color = c(rep('gray',7),'red','gray')
			# plot(F83);
	# F9=make_full_graph(4)+vertex(5)+edge(c(3,5,4,5)); plot(F9);
		# F91 = F9;
			# V(F91)$color = c('red','red','gray','gray','gray')
			# V(F91)$label = c('1','2','','','')
			# E(F91)$color = c('red',rep('gray',7))
			# plot(F91);
		# F92 = F9;
			# V(F92)$color = c('red','gray','red','gray','gray')
			# V(F92)$label = c('1','','2','','')
			# E(F92)$color = c(rep('gray',1),'red',rep('gray',6))
			# plot(F92);
		# F93 = F9;
			# V(F93)$color = c('red','gray','red','gray','gray')
			# V(F93)$label = c('2','','1','','')
			# E(F93)$color = c(rep('gray',1),'red',rep('gray',6))
			# plot(F93);
		# F94 = F9;
			# V(F94)$color = c('gray','gray','red','red','gray')
			# V(F94)$label = c('','','1','2','')
			# E(F94)$color = c(rep('gray',5),'red',rep('gray',2))
			# plot(F94);
		# F95 = F9;
			# V(F95)$color = c('gray','gray','gray','red','red')
			# V(F95)$label = c('','','','2','1')
			# E(F95)$color = c(rep('gray',7),'red')
			# plot(F95);
		# F96 = F9;
			# V(F96)$color = c('gray','gray','gray','red','red')
			# V(F96)$label = c('','','','1','2')
			# E(F96)$color = c(rep('gray',7),'red')
			# plot(F96);
	# F10=make_full_graph(5)-edge(1,8); plot(F10);
		# F101 = F10;
			# V(F101)$color = c('red','gray','red','gray','gray')
			# V(F101)$label = c('1','','2','','')
			# E(F101)$color = c('red',rep('gray',7))
			# plot(F101);
		# F102 = F10;
			# V(F102)$color = c('red','gray','gray','gray','red')
			# V(F102)$label = c('2','','','','1')
			# E(F102)$color = c(rep('gray',2),'red',rep('gray',5))
			# plot(F102);
		# F103 = F10;
			# V(F103)$color = c('red','gray','gray','gray','red')
			# V(F103)$label = c('1','','','','2')
			# E(F103)$color = c(rep('gray',2),'red',rep('gray',5))
			# plot(F103);
	# F11=make_full_graph(4)+vertex(5)+edge(c(1,5)); plot(F11);
		# F111 = F11;
			# V(F111)$color = c('red','red','gray','gray','gray')
			# V(F111)$label = c('1','2','','','')
			# E(F111)$color = c('red',rep('gray',6))
			# plot(F111);
		# F112 = F11;
			# V(F112)$color = c('red','red','gray','gray','gray')
			# V(F112)$label = c('2','1','','','')
			# E(F112)$color = c('red',rep('gray',6))
			# plot(F112);
		# F113 = F11;
			# V(F113)$color = c('red','gray','gray','gray','red')
			# V(F113)$label = c('1','','','','2')
			# E(F113)$color = c(rep('gray',6),'red')
			# plot(F113);
		# F114 = F11;
			# V(F114)$color = c('red','gray','gray','gray','red')
			# V(F114)$label = c('2','','','','1')
			# E(F114)$color = c(rep('gray',6),'red')
			# plot(F114);
		# F115 = F11;
			# V(F115)$color = c('gray','gray','red','red','gray')
			# V(F115)$label = c('','','1','2','')
			# E(F115)$color = c(rep('gray',5),'red',rep('gray',1))
			# plot(F115);
	# F12=make_ring(4)+vertex(5)+edge(c(1,5,2,5,3,5)); plot(F12);
		# F121 = F12;
			# V(F121)$color = c('red','red','gray','gray','gray')
			# V(F121)$label = c('1','2','','','')
			# E(F121)$color = c('red',rep('gray',6))
			# plot(F121);
		# F122 = F12;
			# V(F122)$color = c('red','red','gray','gray','gray')
			# V(F122)$label = c('2','1','','','')
			# E(F122)$color = c('red',rep('gray',6))
			# plot(F122);
		# F123 = F12;
			# V(F123)$color = c('gray','red','gray','gray','red')
			# V(F123)$label = c('','1','','','2')
			# E(F123)$color = c(rep('gray',5),'red','gray')
			# plot(F123);
		# F124 = F12;
			# V(F124)$color = c('gray','gray','red','red','gray')
			# V(F124)$label = c('','','1','2','')
			# E(F124)$color = c(rep('gray',2),'red',rep('gray',4))
			# plot(F124);
		# F125 = F12;
			# V(F125)$color = c('gray','gray','red','red','gray')
			# V(F125)$label = c('','','2','1','')
			# E(F125)$color = c(rep('gray',2),'red',rep('gray',4))
			# plot(F125);
	# F13=make_ring(5)+edge(c(1,3,1,4)); plot(F13);
		# F131 = F13;
			# V(F131)$color = c('red','red','gray','gray','gray')
			# V(F131)$label = c('1','2','','','')
			# E(F131)$color = c('red',rep('gray',6))
			# plot(F131);
		# F132 = F13;
			# V(F132)$color = c('red','red','gray','gray','gray')
			# V(F132)$label = c('2','1','','','')
			# E(F132)$color = c('red',rep('gray',6))
			# plot(F132);
		# F133 = F13;
			# V(F133)$color = c('red','gray','red','gray','gray')
			# V(F133)$label = c('1','','2','','')
			# E(F133)$color = c(rep('gray',5),'red',rep('gray',1))
			# plot(F133);
		# F134 = F13;
			# V(F134)$color = c('red','gray','red','gray','gray')
			# V(F134)$label = c('2','','1','','')
			# E(F134)$color = c(rep('gray',5),'red',rep('gray',1))
			# plot(F134);
		# F135 = F13;
			# V(F135)$color = c('gray','red','red','gray','gray')
			# V(F135)$label = c('','2','1','','')
			# E(F135)$color = c(rep('gray',1),'red',rep('gray',5))
			# plot(F135);
		# F136 = F13;
			# V(F136)$color = c('gray','red','red','gray','gray')
			# V(F136)$label = c('','1','2','','')
			# E(F136)$color = c(rep('gray',1),'red',rep('gray',5))
			# plot(F136);
		# F137 = F13;
			# V(F137)$color = c('gray','gray','red','red','gray')
			# V(F137)$label = c('','','1','2','')
			# E(F137)$color = c(rep('gray',2),'red',rep('gray',4))
			# plot(F137);
	# F14=graph_from_edgelist(t(matrix(c(1,2,2,3,3,1,1,4,4,2,1,5,5,2),nrow=2)),F); plot(F14);
		# F141 = F14;
			# V(F141)$color = c('red','red','gray','gray','gray')
			# V(F141)$label = c('1','2','','','')
			# E(F141)$color = c('red',rep('gray',6))
			# plot(F141);
		# F142 = F14;
			# V(F142)$color = c('gray','red','red','gray','gray')
			# V(F142)$label = c('','1','2','','')
			# E(F142)$color = c('gray','red',rep('gray',5))
			# plot(F142);
		# F143 = F14;
			# V(F143)$color = c('gray','red','red','gray','gray')
			# V(F143)$label = c('','2','1','','')
			# E(F143)$color = c('gray','red',rep('gray',5))
			# plot(F143);
	# F15=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,2,2,5,5,1),nrow=2)),F); plot(F15);
		# F151 = F15;
			# V(F151)$color = c('red','red','gray','gray','gray')
			# V(F151)$label = c('1','2','','','')
			# E(F151)$color = c('red',rep('gray',5))
			# plot(F151);
		# F152 = F15;
			# V(F152)$color = c('red','red','gray','gray','gray')
			# V(F152)$label = c('2','1','','','')
			# E(F152)$color = c('red',rep('gray',5))
			# plot(F152);
		# F153 = F15;
			# V(F153)$color = c('gray','gray','red','red','gray')
			# V(F153)$label = c('','','1','2','')
			# E(F153)$color = c(rep('gray',2),'red',rep('gray',3))
			# plot(F153);
	# F16=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2,5,3),nrow=2)),F); plot(F16);
		# F161 = F16;
			# V(F161)$color = c('red','red','gray','gray','gray')
			# V(F161)$label = c('2','1','','','')
			# E(F161)$color = c('red',rep('gray',5))
			# plot(F161);
		# F162 = F16;
			# V(F162)$color = c('red','red','gray','gray','gray')
			# V(F162)$label = c('1','2','','','')
			# E(F162)$color = c('red',rep('gray',5))
			# plot(F162);
		# F163 = F16;
			# V(F163)$color = c('gray','red','red','gray','gray')
			# V(F163)$label = c('','2','1','','')
			# E(F163)$color = c(rep('gray',1),'red',rep('gray',4))
			# plot(F163);
		# F164 = F16;
			# V(F164)$color = c('gray','red','red','gray','gray')
			# V(F164)$label = c('','1','2','','')
			# E(F164)$color = c(rep('gray',1),'red',rep('gray',4))
			# plot(F164);
		# F165 = F16;
			# V(F165)$color = c('gray','gray','red','red','gray')
			# V(F165)$label = c('','','2','1','')
			# E(F165)$color = c(rep('gray',2),'red',rep('gray',3))
			# plot(F165);
		# F166 = F16;
			# V(F166)$color = c('gray','gray','red','red','gray')
			# V(F166)$label = c('','','1','2','')
			# E(F166)$color = c(rep('gray',2),'red',rep('gray',3))
			# plot(F166);
		# F167 = F16;
			# V(F167)$color = c('gray','gray','red','gray','red')
			# V(F167)$label = c('','','1','','2')
			# E(F167)$color = c(rep('gray',5),'red')
			# plot(F167);
	# F17=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2,2,4),nrow=2)),F); plot(F17);
		# F171 = F17;
			# V(F171)$color = c('red','red','gray','gray','gray')
			# V(F171)$label = c('1','2','','','')
			# E(F171)$color = c('red',rep('gray',5))
			# plot(F171);
		# F172 = F17;
			# V(F172)$color = c('red','red','gray','gray','gray')
			# V(F172)$label = c('2','1','','','')
			# E(F172)$color = c('red',rep('gray',5))
			# plot(F172);
		# F173 = F17;
			# V(F173)$color = c('gray','red','red','gray','gray')
			# V(F173)$label = c('','1','2','','')
			# E(F173)$color = c(rep('gray',1),'red',rep('gray',4))
			# plot(F173);
		# F174 = F17;
			# V(F174)$color = c('gray','red','red','gray','gray')
			# V(F174)$label = c('','2','1','','')
			# E(F174)$color = c(rep('gray',1),'red',rep('gray',4))
			# plot(F174);
		# F175 = F17;
			# V(F175)$color = c('gray','gray','red','red','gray')
			# V(F175)$label = c('','','1','2','')
			# E(F175)$color = c(rep('gray',2),'red',rep('gray',3))
			# plot(F175);
		# F176 = F17;
			# V(F176)$color = c('gray','gray','red','red','gray')
			# V(F176)$label = c('','','2','1','')
			# E(F176)$color = c(rep('gray',2),'red',rep('gray',3))
			# plot(F176);
		# F177 = F17;
			# V(F177)$color = c('gray','red','gray','red','gray')
			# V(F177)$label = c('','1','','2','')
			# E(F177)$color = c(rep('gray',5),'red')
			# plot(F177);
		# F178 = F17;
			# V(F178)$color = c('gray','red','gray','red','gray')
			# V(F178)$label = c('','2','','1','')
			# E(F178)$color = c(rep('gray',5),'red')
			# plot(F178);
	# F18=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,1,2,5),nrow=2)),F); plot(F18);
		# F181 = F18;
			# V(F181)$color = c('red','red','gray','gray','gray')
			# V(F181)$label = c('2','1','','','')
			# E(F181)$color = c('red',rep('gray',5))
			# plot(F181);
		# F182 = F18;
			# V(F182)$color = c('red','red','gray','gray','gray')
			# V(F182)$label = c('1','2','','','')
			# E(F182)$color = c('red',rep('gray',5))
			# plot(F182);
		# F183 = F18;
			# V(F183)$color = c('gray','red','red','gray','gray')
			# V(F183)$label = c('','1','2','','')
			# E(F183)$color = c(rep('gray',1),'red',rep('gray',4))
			# plot(F183);
		# F184 = F18;
			# V(F184)$color = c('gray','red','red','gray','gray')
			# V(F184)$label = c('','2','1','','')
			# E(F184)$color = c(rep('gray',1),'red',rep('gray',4))
			# plot(F184);
		# F185 = F18;
			# V(F185)$color = c('gray','gray','red','red','gray')
			# V(F185)$label = c('','','1','2','')
			# E(F185)$color = c(rep('gray',2),'red',rep('gray',3))
			# plot(F185);
		# F186 = F18;
			# V(F186)$color = c('gray','red','gray','gray','red')
			# V(F186)$label = c('','1','','','2')
			# E(F186)$color = c(rep('gray',5),'red')
			# plot(F186);
	# F19=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1,5,1,3,5),nrow=2)),F); plot(F19);
		# F191 = F19;
			# V(F191)$color = c('red','red','gray','gray','gray')
			# V(F191)$label = c('1','2','','','')
			# E(F191)$color = c('red',rep('gray',5))
			# plot(F191);
		# F192 = F19;
			# V(F192)$color = c('red','red','gray','gray','gray')
			# V(F192)$label = c('2','1','','','')
			# E(F192)$color = c('red',rep('gray',5))
			# plot(F192);
	# F20=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,3),nrow=2)),F); plot(F20);
		# F201 = F20;
			# V(F201)$color = c('red','red','gray','gray','gray')
			# V(F201)$label = c('2','1','','','')
			# E(F201)$color = c('red',rep('gray',4))
			# plot(F201);
		# F202 = F20;
			# V(F202)$color = c('red','red','gray','gray','gray')
			# V(F202)$label = c('1','2','','','')
			# E(F202)$color = c('red',rep('gray',4))
			# plot(F202);
		# F203 = F20;
			# V(F203)$color = c('gray','red','red','gray','gray')
			# V(F203)$label = c('','2','1','','')
			# E(F203)$color = c(rep('gray',1),'red',rep('gray',3))
			# plot(F203);
		# F204 = F20;
			# V(F204)$color = c('gray','red','red','gray','gray')
			# V(F204)$label = c('','1','2','','')
			# E(F204)$color = c(rep('gray',1),'red',rep('gray',3))
			# plot(F204);
		# F205 = F20;
			# V(F205)$color = c('gray','gray','red','red','gray')
			# V(F205)$label = c('','','2','1','')
			# E(F205)$color = c(rep('gray',2),'red',rep('gray',2))
			# plot(F205);
		# F206 = F20;
			# V(F206)$color = c('gray','gray','red','red','gray')
			# V(F206)$label = c('','','1','2','')
			# E(F206)$color = c(rep('gray',2),'red',rep('gray',2))
			# plot(F206);
		# F207 = F20;
			# V(F207)$color = c('gray','gray','gray','red','red')
			# V(F207)$label = c('','','','1','2')
			# E(F207)$color = c(rep('gray',3),'red','gray')
			# plot(F207);
	# F1=graph_from_edgelist(t(matrix(c(1,2,1,3,1,4,1,5),nrow=2)),F); plot(F1);
		# F11 = F1;
			# V(F11)$color = c('red','red','gray','gray','gray')
			# V(F11)$label = c('1','2','','','')
			# E(F11)$color = c('red','gray','gray','gray')
			# plot(F11);
		# F12 = F1;
			# V(F12)$color = c('red','red','gray','gray','gray')
			# V(F12)$label = c('2','1','','','')
			# E(F12)$color = c('red','gray','gray','gray')
			# plot(F12);
	# # ##Loop To Plot all graphs
	# quartz()
	# m = c(2,6,4,6,5,1,1,3,6,3,5,5,7,3,3,7,8,6,2,7)
	# par(mfrow=c(9,10),
		# oma = c(0,0,0,0) + 0.1,
		# mar = c(0,0,2,0) + 0.1)
	# for (k in 1:20){
		# for (l in 1:m[k]){
			# if (k<10) {
				# titl = paste('F0',k,l,sep='');
			# } else {
				# titl = paste('F',k,l,sep='');
			# }
			# eval(parse(text=paste('plot(F',k,l,',main=titl,layout = layout.circle(F',k,l,'),vertex.size=70,edge.width=2,vertex.label.family=2)',sep=''))); 
			# eval(title(titl));
	# }}
	#
	## Basic Objects
	b <- get.backtrack(e)*1.0;
		s1 <- seq(1,nrow(b)-1,by=2);#edges in first direction
		s2 <- seq(2,nrow(b),by=2);#edges in reverse direction
	ss <- 1:nrow(b); ss[s1] = s2; ss[s2]=s1;
	Rb   <- rowSums(b)
	b2   <- b%*%b;
	b3   <- b2%*%b;
	b4   <- b3%*%b;
	b_p3 <- b2*(1-t(b));#P3
	b_p4 <- b3*(1-t(b));#P4
	b_ar <- b2*b2[ss,];#Arrow (disconected edges)
	b_tr <- b2*t(b);#Triangle
	b_sq <- b2*t(b2);#Square (disconected edges)
	b_cl <- b_sq*b_sq[,ss];#4 Clique (disconected edges)
	b_bf <- b_ar%*%b_tr[ss,];#Buterfly (oposite edges)
	#
	## Subgraph counting
	X11 <- choose(Rb[ss],3);
		X12 <- X11[ss];
	X21 <- rowSums(b_p3)*(Rb-1)-rowSums(b%*%b_tr-b_tr);
		X22 <- X21[ss];
		X23 <- choose(Rb,2)*Rb[ss]-rowSums(b_tr)*(Rb-1);
		X24 <- X23[ss];
		X25 <- c(b%*%choose(Rb,2)-rowSums(b_ar));
		X26 <- X25[ss];
	X31 <- rowSums(b3*(1-t(b))*(1-diag(nrow(b)))*(1-b[ss,])*(1-b[,ss]));
		X32 <- X31[ss];
		X33 <- rowSums(b_p3)*Rb[ss]-rowSums(b_sq)-rowSums(b_ar);
		X34 <- X33[ss];
	X41 <- rowSums(b_p4*(1-b[ss,])*(1-b[,ss])*b2[,ss])/2;
		X42 <- X41[ss];
		X43 <- rowSums(b_sq)*(Rb[ss]-1)-rowSums(b_sq*b2[ss,]);
		X44 <- X43[ss];
		X45 <- colSums(b_p4*(1-b[ss,])*(1-b[,ss])*b2[,ss]);
		X46 <- X45[ss];
	X51 <- colSums(b_ar)*(Rb[ss]-2)/2;
		X52 <- X51[ss];
		X53 <- rowSums(b_tr)*choose(Rb-1,2);
		X54 <- X53[ss];
		X55 <- rowSums(b_ar%*%b[ss,]-2*b_ar)/2;
	X61 <- rowSums(b4*t(b));
	X71 <- rowSums(b_cl*b_bf)/6;
	X81 <- rowSums(b_cl*(b_ar%*%b))/2;
		X82 <- colSums(b_cl*(b_ar%*%b))/2;
		X83 <- X82[ss];
	X91 <- (rowSums(b_cl%*%b_tr)-2*rowSums(b_cl))/2;
		X92 <- rowSums((b_cl%*%b_sq)*b);
		X93 <- X92[ss];
		X94 <- rowSums(b_cl)*(rowSums(b_tr)-2)/2;
		X95 <- (colSums(b_cl%*%b_tr)-2*rowSums(b_cl))/2;
		X96 <- X95[ss];
	X101 <- rowSums(b_sq*b_bf);
		X102 <- rowSums(Schoose2((b_tr%*%b_tr[ss,])*t(b)));
		X103 <- X102[ss];
	X111 <- rowSums(b_cl)*(Rb[ss]-2)/2;
		X112 <- X111[ss];
		X113 <- (colSums(b_cl%*%b)-2*colSums(b_cl))/6;
		X114 <- X113[ss];
		X115 <- rowSums(b_cl%*%b)-2*colSums(b_cl);
	X121 <- colSums((b3-1)*(b_tr%*%b_tr[ss,])*t(b));
		X122 <- X121[ss];
		X123 <- colSums((b_sq%*%b_tr)*b2)/2;
		X124 <- colSums(b_sq*(b_ar%*%b))/2;
		X125 <- X124[ss];
	X131 <- rowSums((b_sq%*%b_sq)*t(b));
		X132 <- X131[ss];
		X133 <- rowSums(b_sq*b2[ss,])*(rowSums(b_tr)-1)-rowSums(b_cl);
		X134 <- X133[ss];
		X135 <- rowSums((b_sq*b2[ss,])%*%b_tr)-rowSums(b_sq*b2[ss,])-rowSums(b_cl);
		X136 <- X135[ss];
		X137 <- rowSums((b3*b2*t(b))%*%b_tr)-rowSums((b3*b2*t(b)))-rowSums(b_cl);
	X141 <- choose(rowSums(b_tr),3);
		X142 <- c(b_tr%*%choose(rowSums(b_tr)-1,2));
		X143 <- X142[ss];
	X151 <- colSums((b_ar%*%b_tr)*(1-b)*(1-b[ss,]))/2;
		X152 <- X151[ss];
		X153 <- rowSums((b_ar%*%b_tr)*(1-b)*(1-b[ss,]))/2;
	X161 <- (colSums((b_sq*b2[,ss])%*%b[ss,])-colSums(b_cl)-colSums(b_sq*b2[,ss]))/2;
		X162 <- X161[ss];
		X163 <- rowSums(b_sq*b2[ss,])*(Rb-1)-rowSums(b_cl);
		X164 <- X163[ss];
		X165 <- rowSums(((b_sq*b2[,ss])%*%b[ss,])*(1-b[,ss]))-rowSums(b_cl);
		X166 <- X165[ss];
		X167 <- (rowSums(b_tr)-1)*rowSums(b_ar)-rowSums(b_cl);
	X171 <- c(b%*%choose(rowSums(b_tr),2)-rowSums(b_sq*b2[,ss]));
		X172 <- X171[ss];
		X173 <- rowSums(b_sq*b2[,ss])*(Rb-2);
		X174 <- X173[ss];
		X175 <- rowSums(((b_sq*b2[,ss])%*%b)*(1-b[,ss])*(1-t(b)));
		X176 <- X175[ss];
		X177 <- choose(rowSums(b_tr),2)*(Rb-2);
		X178 <- X177[ss];
	X181 <- rowSums((b_tr%*%b_sq)*(1-b[,ss])*(1-b));
		X182 <- X181[ss];
		X183 <- rowSums(((b3*t(b))%*%b_tr)*(1-b))-rowSums(b_sq*b2[ss,]);
		X184 <- X183[ss];
		X185 <- colSums((b_tr%*%b_sq)*(1-b[,ss])*(1-b));
		X186 <- rowSums(b_tr)*rowSums(b_sq)-rowSums(b_sq*(b2[,ss]+b2[ss,]));
	X191 <- colSums(Schoose2(b3*t(b)));
		X192 <-X191[ss];
	X201 <- colSums((b_ar%*%b)*(1-b)*(1-b[ss,])*(1-b[,ss])*(1-t(b)))/2;
		X202 <- X201[ss];
		X203 <- colSums(b_ar)*Rb/2-rowSums(b_sq*b2[ss,]);
		X204 <- X203[ss];
		X205 <- rowSums(b_tr)*rowSums(b_p3)-rowSums(b_ar)-rowSums(b_sq*b2[,ss]);
		X206 <- X205[ss];
		X207 <- rowSums((b_ar%*%b)*(1-b)*(1-b[ss,])*(1-b[,ss])*(1-t(b)));
	#
	## Construction of output
	m = c(2,6,4,6,5,1,1,3,6,3,5,5,7,3,3,7,8,6,2,7);
	rez = c();
	for (k in 1:20){
		for (l in 1:m[k]){
			eval(parse(text=paste(
				'rez=cbind(rez,X',k,l,')',
				sep=''))); 
	}}
	return(rez)
}
#
five_profile_node <- function(e){#Counts order five vertex rooted graphs
	## Input:
	# e: The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies of conected simple graphs over 5 nodes attached to each node in g
	#
	##Below are functions to plot the graphs considered using the package igraph
	# library(igraph)
	# F2=graph_from_edgelist(t(matrix(c(1,2,1,3,1,4,4,5),nrow=2)),F); plot(F2);
		# F21 = F2; V(F21)$color = 'gray'; V(F21)$color[1] = 'red'; plot(F21);
		# F22 = F2; V(F22)$color = 'gray'; V(F22)$color[2] = 'red'; plot(F22);
		# F23 = F2; V(F23)$color = 'gray'; V(F23)$color[4] = 'red'; plot(F23);
		# F24 = F2; V(F24)$color = 'gray'; V(F24)$color[5] = 'red'; plot(F24);
	# F3=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5),nrow=2)),F); plot(F3);
		# F31 = F3; V(F31)$color = 'gray'; V(F31)$color[1] = 'red'; plot(F31);
		# F32 = F3; V(F32)$color = 'gray'; V(F32)$color[2] = 'red'; plot(F32);
		# F33 = F3; V(F33)$color = 'gray'; V(F33)$color[3] = 'red'; plot(F33);
	# F4=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2),nrow=2)),F); plot(F4);
		# F41 = F4; V(F41)$color = 'gray'; V(F41)$color[1] = 'red'; plot(F41);
		# F42 = F4; V(F42)$color = 'gray'; V(F42)$color[2] = 'red'; plot(F42);
		# F43 = F4; V(F43)$color = 'gray'; V(F43)$color[3] = 'red'; plot(F43);
		# F44 = F4; V(F44)$color = 'gray'; V(F44)$color[4] = 'red'; plot(F44);
	# F5=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,2,2,5),nrow=2)),F); plot(F5);
		# F51 = F5; V(F51)$color = 'gray'; V(F51)$color[1] = 'red'; plot(F51);
		# F52 = F5; V(F52)$color = 'gray'; V(F52)$color[2] = 'red'; plot(F52);
		# F53 = F5; V(F53)$color = 'gray'; V(F53)$color[3] = 'red'; plot(F53);
	# F6=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,1),nrow=2)),F); plot(F6);
		# F61 = F6; V(F61)$color = 'gray'; V(F61)$color[1] = 'red'; plot(F61);
	# F7=make_full_graph(5); plot(F7);
		# F71 = F7; V(F71)$color = 'gray'; V(F71)$color[1] = 'red'; plot(F71);
	# F8=make_full_graph(5)-edge(10); plot(F8);
		# F81 = F8; V(F81)$color = 'gray'; V(F81)$color[1] = 'red'; plot(F81);
		# F82 = F8; V(F82)$color = 'gray'; V(F82)$color[4] = 'red'; plot(F82);
	# F9=make_full_graph(4)+vertex(5)+edge(c(3,5,4,5)); plot(F9);
		# F91 = F9; V(F91)$color = 'gray'; V(F91)$color[1] = 'red'; plot(F91);
		# F92 = F9; V(F92)$color = 'gray'; V(F92)$color[3] = 'red'; plot(F92);
		# F93 = F9; V(F93)$color = 'gray'; V(F93)$color[5] = 'red'; plot(F93);
	# F10=make_full_graph(5)-edge(1,8); plot(F10);
		# F101 = F10; V(F101)$color = 'gray'; V(F101)$color[1] = 'red'; plot(F101);
		# F102 = F10; V(F102)$color = 'gray'; V(F102)$color[5] = 'red'; plot(F102);
	# F11=make_full_graph(4)+vertex(5)+edge(c(1,5)); plot(F11);
		# F111 = F11; V(F111)$color = 'gray'; V(F111)$color[1] = 'red'; plot(F111);
		# F112 = F11; V(F112)$color = 'gray'; V(F112)$color[2] = 'red'; plot(F112);
		# F113 = F11; V(F113)$color = 'gray'; V(F113)$color[5] = 'red'; plot(F113);
	# F12=make_ring(4)+vertex(5)+edge(c(1,5,2,5,3,5)); plot(F12);
		# F121 = F12; V(F121)$color = 'gray'; V(F121)$color[1] = 'red'; plot(F121);
		# F122 = F12; V(F122)$color = 'gray'; V(F122)$color[2] = 'red'; plot(F122);
		# F123 = F12; V(F123)$color = 'gray'; V(F123)$color[4] = 'red'; plot(F123);
	# F13=make_ring(5)+edge(c(1,3,1,4)); plot(F13);
		# F131 = F13; V(F131)$color = 'gray'; V(F131)$color[1] = 'red'; plot(F131);
		# F132 = F13; V(F132)$color = 'gray'; V(F132)$color[2] = 'red'; plot(F132);
		# F133 = F13; V(F133)$color = 'gray'; V(F133)$color[3] = 'red'; plot(F133);
	# F14=graph_from_edgelist(t(matrix(c(1,2,2,3,3,1,1,4,4,2,1,5,5,2),nrow=2)),F); plot(F14);
		# F141 = F14; V(F141)$color = 'gray'; V(F141)$color[1] = 'red'; plot(F141);
		# F142 = F14; V(F142)$color = 'gray'; V(F142)$color[3] = 'red'; plot(F142);
	# F15=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,2,2,5,5,1),nrow=2)),F); plot(F15);
		# F151 = F15; V(F151)$color = 'gray'; V(F151)$color[1] = 'red'; plot(F151);
		# F152 = F15; V(F152)$color = 'gray'; V(F152)$color[2] = 'red'; plot(F152);
	# F16=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2,5,3),nrow=2)),F); plot(F16);
		# F161 = F16; V(F161)$color = 'gray'; V(F161)$color[1] = 'red'; plot(F161);
		# F162 = F16; V(F162)$color = 'gray'; V(F162)$color[2] = 'red'; plot(F162);
		# F163 = F16; V(F163)$color = 'gray'; V(F163)$color[3] = 'red'; plot(F163);
		# F164 = F16; V(F164)$color = 'gray'; V(F164)$color[4] = 'red'; plot(F164);
	# F17=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2,2,4),nrow=2)),F); plot(F17);
		# F171 = F17; V(F171)$color = 'gray'; V(F171)$color[1] = 'red'; plot(F171);
		# F172 = F17; V(F172)$color = 'gray'; V(F172)$color[2] = 'red'; plot(F172);
		# F173 = F17; V(F173)$color = 'gray'; V(F173)$color[3] = 'red'; plot(F173);
		# F174 = F17; V(F174)$color = 'gray'; V(F174)$color[4] = 'red'; plot(F174);
	# F18=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,1,2,5),nrow=2)),F); plot(F18);
		# F181 = F18; V(F181)$color = 'gray'; V(F181)$color[1] = 'red'; plot(F181);
		# F182 = F18; V(F182)$color = 'gray'; V(F182)$color[2] = 'red'; plot(F182);
		# F183 = F18; V(F183)$color = 'gray'; V(F183)$color[3] = 'red'; plot(F183);
	# F19=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1,5,1,3,5),nrow=2)),F); plot(F19);
		# F191 = F19; V(F191)$color = 'gray'; V(F191)$color[1] = 'red'; plot(F191);
		# F192 = F19; V(F192)$color = 'gray'; V(F192)$color[2] = 'red'; plot(F192);
	# F20=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,3),nrow=2)),F); plot(F20);
		# F201 = F20; V(F201)$color = 'gray'; V(F201)$color[1] = 'red'; plot(F201);
		# F202 = F20; V(F202)$color = 'gray'; V(F202)$color[2] = 'red'; plot(F202);
		# F203 = F20; V(F203)$color = 'gray'; V(F203)$color[3] = 'red'; plot(F203);
		# F204 = F20; V(F204)$color = 'gray'; V(F204)$color[4] = 'red'; plot(F204);	
	# F1=graph_from_edgelist(t(matrix(c(1,2,1,3,1,4,1,5),nrow=2)),F); plot(F1);
		# F11 = F1; V(F11)$color = 'gray'; V(F11)$color[1] = 'red'; plot(F11);
		# F12 = F1; V(F12)$color = 'gray'; V(F12)$color[2] = 'red'; plot(F12);
	# # ##Loop To Plot all graphs
	# quartz()
	# m = c(2,4,3,4,3,1,1,2,3,2,3,3,3,2,2,4,4,3,2,4)
	# par(mfrow=c(7,8),
		# oma = c(0,0,0,0) + 0.1,
		# mar = c(0,0,2,0) + 0.1)
	# for (k in 1:20){
		# for (l in 1:m[k]){
			# if (k<10) {
				# titl = paste('F0',k,l,sep='');
			# } else {
				# titl = paste('F',k,l,sep='');
			# }
			# eval(parse(text=paste('plot(F',k,l,',main=titl,',
				# 'vertex.label=NA,vertex.size=70,edge.width=2,layout=layout.circle)',sep=''))); 
			# #eval(title());
	# }}
	#
	## Basic objects
	e <- e[do.call(order, lapply(1:ncol(e), function(i) e[, i])),];
	e_dir <- matrix(0,2*nrow(e),2);
		e_dir[seq(1,2*nrow(e)-1,by=2),] <- e;
		e_dir[seq(2,2*nrow(e),by=2),] <- e[,c(2,1)];
	profile0 = five_profile_edge(e);
	m = c(2,4,3,4,3,1,1,2,3,2,3,3,3,2,2,4,4,3,2,4);
	n = max(e);
	for (k in 1:20){
		for (l in 1:m[k]){
			eval(parse(text=paste('X',k,l,'<-array(0,n)',sep=''))); 
	}}
	#
	## Subgraphs counting
	for (i in 1:n){
		for (j in which(e_dir[,1]==i)){#One has to divide by the number of isomorphic edges conected to the node
			X11[i] <- X11[i]+profile0[j,'X11']/4;
				X12[i] <- X12[i]+profile0[j,'X12'];
			X21[i] <- X21[i]+profile0[j,'X22']/2;
				X22[i] <- X22[i]+profile0[j,'X21'];
				X23[i] <- X23[i]+profile0[j,'X23'];
				X24[i] <- X24[i]+profile0[j,'X25'];
			X31[i] <- X31[i]+profile0[j,'X31'];
				X32[i] <- X32[i]+profile0[j,'X32'];
				X33[i] <- X33[i]+profile0[j,'X34']/2;
			X41[i] <- X41[i]+profile0[j,'X41'];
				X42[i] <- X42[i]+profile0[j,'X43']/2;
				X43[i] <- X43[i]+profile0[j,'X44'];
				X44[i] <- X44[i]+profile0[j,'X45']/2;
			X51[i] <- X51[i]+profile0[j,'X52'];
				X52[i] <- X52[i]+profile0[j,'X51']/2;
				X53[i] <- X53[i]+profile0[j,'X53'];
			X61[i] <- X61[i]+profile0[j,'X61']/2;
			X71[i] <- X71[i]+profile0[j,'X71']/4;
			X81[i] <- X81[i]+profile0[j,'X81']/2;
				X82[i] <- X82[i]+profile0[j,'X83']/3;
			X91[i] <- X91[i]+profile0[j,'X91'];
				X92[i] <- X92[i]+profile0[j,'X96'];
				X93[i] <- X93[i]+profile0[j,'X95']/2;
			X101[i] <- X101[i]+profile0[j,'X101']/2;
				X102[i] <- X102[i]+profile0[j,'X102']/4;
			X111[i] <- X111[i]+profile0[j,'X111']/3;
				X112[i] <- X112[i]+profile0[j,'X112'];
				X113[i] <- X113[i]+profile0[j,'X114'];
			X121[i] <- X121[i]+profile0[j,'X121']/2;
				X122[i] <- X122[i]+profile0[j,'X122']/2;
				X123[i] <- X123[i]+profile0[j,'X125']/2;
			X131[i] <- X131[i]+profile0[j,'X131']/2;
				X132[i] <- X132[i]+profile0[j,'X132'];
				X133[i] <- X133[i]+profile0[j,'X134'];
			X141[i] <- X141[i]+profile0[j,'X141'];
				X142[i] <- X142[i]+profile0[j,'X143']/2;
			X151[i] <- X151[i]+profile0[j,'X151'];
				X152[i] <- X152[i]+profile0[j,'X152']/4;
			X161[i] <- X161[i]+profile0[j,'X162'];
				X162[i] <- X162[i]+profile0[j,'X161'];
				X163[i] <- X163[i]+profile0[j,'X163'];
				X164[i] <- X164[i]+profile0[j,'X165']/2;
			X171[i] <- X171[i]+profile0[j,'X171'];
				X172[i] <- X172[i]+profile0[j,'X172'];
				X173[i] <- X173[i]+profile0[j,'X175'];
				X174[i] <- X174[i]+profile0[j,'X176']/2;
			X181[i] <- X181[i]+profile0[j,'X182']/2;
				X182[i] <- X182[i]+profile0[j,'X181'];
				X183[i] <- X183[i]+profile0[j,'X184'];
			X191[i] <- X191[i]+profile0[j,'X191']/3;
				X192[i] <- X192[i]+profile0[j,'X192']/2;
			X201[i] <- X201[i]+profile0[j,'X202'];
				X202[i] <- X202[i]+profile0[j,'X201'];
				X203[i] <- X203[i]+profile0[j,'X203'];
				X204[i] <- X204[i]+profile0[j,'X205'];
	}}
	#
	## Output construction
	rez = c();
	for (k in 1:20){
		for (l in 1:m[k]){
			eval(parse(text=paste(
				'rez=cbind(rez,X',k,l,')',
				sep=''))); 
	}}
	return(rez)
}
#
five_profile_total <- function(e){#Countes order five graphs
	## Input:
	# e: The edgelist of a simple graph g
	#
	## Output:
	# The number of isomorphic copies of conected simple graphs over 5 nodes in g
	#
	#Below are functions to plot the graphs considered using the package igraph
	# library(igraph)
	# F2=graph_from_edgelist(t(matrix(c(1,2,1,3,1,4,4,5),nrow=2)),F); plot(F2);
	# F3=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5),nrow=2)),F); plot(F3);
	# F4=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2),nrow=2)),F); plot(F4);
	# F5=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,2,2,5),nrow=2)),F); plot(F5);
	# F6=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,1),nrow=2)),F); plot(F6);
	# F7=make_full_graph(5); plot(F7);
	# F8=make_full_graph(5)-edge(10); plot(F8);
	# F9=make_full_graph(4)+vertex(5)+edge(c(3,5,4,5)); plot(F9);
	# F10=make_full_graph(5)-edge(1,8); plot(F10);
	# F11=make_full_graph(4)+vertex(5)+edge(c(1,5)); plot(F11);
	# F12=make_ring(4)+vertex(5)+edge(c(1,5,2,5,3,5)); plot(F12);
	# F13=make_ring(5)+edge(c(1,3,1,4)); plot(F13);
	# F14=graph_from_edgelist(t(matrix(c(1,2,2,3,3,1,1,4,4,2,1,5,5,2),nrow=2)),F); plot(F14);
	# F15=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,2,2,5,5,1),nrow=2)),F); plot(F15);
	# F16=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2,5,3),nrow=2)),F); plot(F16);
	# F17=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,2,2,4),nrow=2)),F); plot(F17);
	# F18=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,1,2,5),nrow=2)),F); plot(F18);
	# F19=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,1,5,1,3,5),nrow=2)),F); plot(F19);
	# F20=graph_from_edgelist(t(matrix(c(1,2,2,3,3,4,4,5,5,3),nrow=2)),F); plot(F20);
	# F1=graph_from_edgelist(t(matrix(c(1,2,1,3,1,4,1,5),nrow=2)),F); plot(F1);
	# ##Loop To Plot all graphs
	# quartz()
	# par(mfrow=c(5,4),
		# oma = c(0,0,0,0) + 0.1,
		# mar = c(0,0,2,0) + 0.1)
	# for (k in 1:20){
			# titl = paste('F',k,sep='');
			# eval(parse(text=paste('plot(F',k,',main=titl,',
				# 'vertex.label=NA,layout=layout.circle)',sep=''))); 
			# eval(title());
	# }
	#
	## Basic Objects
	profile0 = five_profile_node(e);
	#
	## Subgraph counting
	X1 = sum(profile0[,'X11']);
	X2 = sum(profile0[,'X21']);
	X3 = sum(profile0[,'X33']);
	X4 = sum(profile0[,'X41']);
	X5 = sum(profile0[,'X52']);
	X6 = sum(profile0[,'X61'])/5;
	X7 = sum(profile0[,'X71'])/5;
	X8 = sum(profile0[,'X81'])/3;
	X9 = sum(profile0[,'X93']);
	X10 = sum(profile0[,'X102']);
	X11 = sum(profile0[,'X113']);
	X12 = sum(profile0[,'X123']);
	X13 = sum(profile0[,'X131']);
	X14 = sum(profile0[,'X141'])/2;
	X15 = sum(profile0[,'X152']);
	X16 = sum(profile0[,'X161']);	
	X17 = sum(profile0[,'X171']);
	X18 = sum(profile0[,'X181']);
	X19 = sum(profile0[,'X191'])/2;
	X20 = sum(profile0[,'X201']);
	#
	## Output construction
	return(c( X1, X2, X3, X4, X5, X6, X7, X8, X9, X10,
		  X11,X12,X13,X14,X15,X16,X17,X18,X19,X20))
}