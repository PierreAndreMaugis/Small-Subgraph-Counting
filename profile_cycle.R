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
cycle_counts <- function(e) {# Count cycles in a graph
	## Input:
	# e: The edgelist of a simple graph g, nodes are assumed to be labeled by succecive numbers starting from 1
	#
	## Output:
	# A vector containing the number of cyles of sizes 3 to 10 in g, as well as the other 83 subgraphs that can b induced by a non-backtracking tailleles walk of length less than 10.
	#
	#
	# Base Objects
	b <- get.backtrack(e) * 1.00;
		s1 <- seq(1, nrow(b) - 1, by = 2);
		s2 <- seq(2, nrow(b), by = 2);
		ss <- 1:nrow(b);
		ss[s1] <- s2;
		ss[s2] <- s1;
	b2 <- b %*% b;
	b3 <- b %*% b2;
	b4 <- b %*% b3;
	b5 <- b %*% b4;
	b_tr <- b * t(b2);
	b_tr2 <- b2 * t(b);
	b_sq <- b2 * t(b2);
	b_sq2 <- b * t(b3);
	b_pn <- b2 * t(b3);
	b_pn2 <- b * t(b4);
	b_ar <- b2 * b2[ss, ];
	b_st <- (b_sq %*% b) * b2[ss, ];
	b_sd <- b_sq * b2[, ss];
	b_bf <- b_ar %*% b_tr[ss, ];
	b_bf2 <- b_ar %*% b_tr2[ss, ];
	b_p3 <- b2 * (1 - t(b));
	b_p4 <- b3 * (1 - t(b));
	b_p4s <- (b_p3 %*% b) * (1 - t(b));
	b_p5 <- (b_p4s %*% b) * (1 - t(b));
	b_tr_tr <- diag(b3) %*% t(diag(b3));
	b_sq_tr <- diag(b3) %*% t(diag(b4));
	b_sq_t <- b_tr %*% t(b_tr);
	diag(b_sq_t) <- 0;
	b_sq_tt <- b_sq * b3[, ss];
	b_sq_l <- b_sq * b2[ss, ];
	b_sq_r <- b_sq * b2[, ss];
	b_sq_d <- (b4[cbind(1:nrow(b), ss)] %*% t(rep(1, nrow(b))));
	b_pn_t <- b_pn * b2[ss, ] * b2[, ss];
	d_b_pn <- rowSums(b_pn);
	#
	## Subgraph Counts	
	X_F1 <- sum(diag(b3))/6;
	X_F2 <- sum(Schoose2(diag(b3)))/2;
	X_F3 <- (sum(b * b_tr_tr) - 12 * X_F2 - 6 * X_F1)/8;
	X_F4 <- (sum(diag(b3) * diag(b4)) - 8 * X_F2)/2;
	X_F5 <- sum(Schoose3(diag(b3)))/2;
	X_F6 <- (sum(b * b_sq_tr) - 6 * X_F4 - 24 * X_F5 - 16 * X_F2)/4;
	X_F7 <- sum(b2[s1, s1] * b2[s1, s2] * b2[s2, s1] * b2[s2, s2])/6;
	X_F8 <- sum(b_sq)/8;
	X_F9 <- sum(b_sq_r * b3)/2;
	X_F10 <- sum(b_sq_tt)/12;
	X_F11 <- (sum(choose(diag(b4), 2)) - 2 * X_F9 - 12 * X_F10 - 12 * X_F7)/2;
	X_F12 <- sum(b_sq * Schoose2(b3[, ss]))/24;
	X_F13 <- sum(b_sq * Schoose2(b3))/2;
	X_F14 <- (sum(diag(b3) * diag(b5)) - 4 * X_F4 - 2 * X_F9)/2;
	X_F15 <- (sum(b * (diag(b4) %*% t(diag(b4)))) - 8 * X_F8 - 48 * X_F10 - 48 * X_F12 - 
		12 * X_F11 - 16 * X_F13 - 20 * X_F9 - 72 * X_F7)/8;
	X_F16 <- (sum((1 - t(b)) * b2 * (diag(b3) %*% t(diag(b3)))) - 12 * X_F2 - 24 * X_F7 - 
		16 * X_F3 - 6 * X_F9)/8;
	X_F17 <- (sum(b * (diag(b3) %*% t(diag(b5)))) - 6 * X_F14 - 8 * X_F4 - 10 * X_F9 - 16 * 
		X_F13)/4;
	X_F18 <- sum(b_pn_t)/4;
	X_F19 <- sum(b_pn_t * t(b2))/4;
	X_F20 <- sum(b2 * Schoose2(t(b3)))/2;
	X_F21 <- (sum(b_sq_r * b_sq_d) - 8 * X_F2 - 4 * X_F9 - 24 * X_F5)/4;
	X_F22 <- (sum(b_sq_l * b_sq_d) - 48 * X_F7 - 4 * X_F9 - 8 * X_F19)/4;
	X_F23 <- (sum(b_sq_r * b4) - 24 * X_F7 - 2 * X_F9 - 4 * X_F19);
	X_F24 <- (sum(b_sq_tt * b3) - 4 * X_F18)/2;
	X_F25 <- (sum(b_sq_l * b3 * (diag(b3) %*% t(rep(1, nrow(b))))) - 2 * X_F9 - 8 * X_F19)/6;
	X_F26 <- (sum(diag(b3) * rowSums(b3 * t(b3))) - 6 * X_F1 - 20 * X_F2 - 24 * X_F3 - 12 * 
		X_F5 - 48 * X_F7 - 12 * X_F9 - 4 * X_F14 - 8 * X_F19 - 8 * X_F21 - 4 * X_F22 - 2 * 
		X_F23)/2;
	X_F27 <- (sum(rowSums(b_sq) * d_b_pn) - 6 * X_F4 - 8 * X_F20 - 8 * X_F18 - 4 * X_F19 - 
		2 * X_F23 - 4 * X_F24)/2;
	X_F28 <- (sum((1 - t(b)) * b2 * b_sq_tr) - 12 * X_F2 - 8 * X_F4 - 36 * X_F5 - 8 * X_F6 - 
		24 * X_F7 - 6 * X_F9 - 12 * X_F18 - 4 * X_F19 - 4 * X_F21 - 3 * X_F23 - 4 * X_F24)/4;
	X_F29 <- (sum(b * b4 * b3[ss, ] * b3[, ss]) - 8 * X_F2 - 16 * X_F3 - 24 * X_F5 - 24 * 
		X_F7 - 14 * X_F9 - 28 * X_F21)/48;
	X_F30 <- (sum(choose(diag(b3), 2) * d_b_pn) - 4 * X_F18 - 8 * X_F19 - 2 * X_F23 - 6 * 
		X_F25)/2;
	X_F31 <- (sum(choose(diag(b4), 2) * diag(b3)) - 12 * X_F5 - 24 * X_F7 - 2 * X_F9 - 8 * 
		X_F18 - 10 * X_F19 - 2 * X_F23 - 2 * X_F24 - 6 * X_F25)/2;
	X_F32 <- (sum(b2 * b3 * b_tr_tr) - 4 * X_F2 - 12 * X_F5 - 72 * X_F7 - 14 * X_F9 - 24 * 
		X_F19 - 8 * X_F21 - 8 * X_F22 - 24 * X_F25)/8;
	X_F33 <- sum(t(b2) * Schoose3(b3))/2;
	X_F34 <- (sum(b * (diag(b3) %*% t(rowSums(b3 * t(b3))))) - 6 * X_F1 - 36 * X_F2 - 48 * 
		X_F3 - 36 * X_F5 - 144 * X_F7 - 44 * X_F9 - 8 * X_F14 - 48 * X_F19 - 48 * X_F21 - 
		16 * X_F22 - 10 * X_F23 - 6 * X_F26 - 48 * X_F29 - 16 * X_F30 - 8 * X_F31 - 16 * 
		X_F32 - 60 * X_F25)/4;
	X_F35 <- (sum(b * (diag(b4) %*% t(diag(b5)))) - 10 * X_F4 - 16 * X_F20 - 24 * X_F18 - 
		28 * X_F19 - 10 * X_F23 - 20 * X_F24 - 6 * X_F27 - 8 * X_F30 - 16 * X_F31 - 24 * 
		X_F33 - 36 * X_F25)/4;
	X_F36 <- sum(b2 * t(b3))/10;
	X_F37 <- sum(b_sq * b_bf2)/8;
	X_F38 <- sum((b_sq * b_sq[, ss]) * b_bf2)/120;
	X_F39 <- (sum(b3 * t(b) * outer(diag(b3), diag(b3)))/2 - 4 * X_F2 - 24 * X_F7 - 4 * X_F9 - 
		2 * X_F18);
	X_F40 <- (sum(((b_tr2 %*% b_tr2[ss, ]) * t(b)) * b4)/4 - X_F9);
	X_F41 <- sum((b_sq %*% b_sq) * b_p3[, ss])/2;
	X_F42 <- sum((b_ar[, ss] %*% t(b_ar)) * b_p3)/4;
	X_F43 <- sum((b_sq %*% b_sq) * b_p3)/8;
	X_F44 <- sum((b_sd %*% b_p3) * t(b_ar[, ss]))/2;
	X_F45 <- sum(choose(rowSums(b2 * t(b)), 4))/2;
	X_F46 <- sum((b_sd %*% b_sq) * b_p3[, ss]);
	X_F47 <- sum((t(b_ar) %*% b_ar) * b_sq[, ss])/4;
	X_F48 <- sum((t(b_ar) %*% b_ar) * b_sq)/8;
	X_F49 <- sum((b_sd %*% b_sd[ss, ]) * b_p3[, ss])/8;
	X_F50 <- (sum(b3 * Schoose2(t(b3)))/2 - 2 * X_F2 - 2 * X_F9 - 3 * X_F5 - X_F39 - 2 * 
		X_F21);
	X_F51 <- (sum(Schoose2(b_pn2))/2 - X_F18 - 2 * X_F20 - X_F39);
	X_F52 <- (sum(b_ar %*% b %*% t(b_ar[, ss])/8) - 2 * X_F2 - 2 * X_F9 - 6 * X_F5 - X_F18 - 
		X_F39 - 2 * X_F21);
	X_F53 <- (sum(rowSums(b_sq) * rowSums(b_tr) * rowSums(t(b_ar)))/2 - 4 * X_F2 - 24 * X_F7 - 
		6 * X_F9 - 12 * X_F5 - 4 * X_F18 - 8 * X_F19 - X_F23 - 2 * X_F39 - 2 * X_F21 - 2 * 
		X_F22 - 2 * X_F44);
	X_F54 <- (sum(colSums((b_sq %*% b) * b_p3[ss, ]) * choose(diag(b3), 2))/2 - 2 * X_F18 - 
		4 * X_F19 - X_F23 - X_F44);
	X_F55 <- (sum(colSums(b_sd) * colSums(b_pn)) - 6 * X_F9 - 4 * X_F18 - 8 * X_F19 - X_F23 - 
		4 * X_F13 - 4 * X_F40 - 2 * X_F44 - X_F46 - 4 * X_F47);
	X_F56 <- (sum(b_sq %*% b_tr %*% b_sq)/2 - 2 * X_F2 - 36 * X_F7 - 7 * X_F9 - 6 * X_F5 - 
		6 * X_F18 - 4 * X_F19 - 4 * X_F37 - X_F23 - 4 * X_F13 - X_F41 - X_F46 - 4 * X_F48);
	X_F57 <- (sum(b_ar %*% b_sq %*% b_tr)/2 - 4 * X_F2 - 24 * X_F7 - 6 * X_F9 - 12 * X_F5 - 
		4 * X_F18 - 8 * X_F19 - 2 * X_F39 - 2 * X_F21 - 2 * X_F22 - 2 * X_F44 - X_F46);
	X_F58 <- (sum(((b_sd %*% b[ss, ]) * b2) %*% b_sq)/4 - 12 * X_F7 - X_F9 - 2 * X_F18 - 
		6 * X_F19 - 0.5 * X_F23 - X_F44 - 2 * X_F47 - 2 * X_F48);
	X_F59 <- (sum((Schoose2(b_sq2) %*% t(b_sq2)) * b[, ss]) - 4 * X_F19 - 8 * X_F37 - 8 * 
		X_F43 - X_F44 - X_F46);
	X_F60 <- (sum(rowSums(b_sq2 * b_pn2) * diag(b3)) - 8 * X_F9 - 4 * X_F18 - 8 * X_F37 - 
		2 * X_F39 - 4 * X_F13 - 4 * X_F40 - 2 * X_F41 - 4 * X_F42 - X_F46);
	X_F61 <- (sum(b_bf2 %*% b_sq)/4 - 2 * X_F2 - 12 * X_F7 - 3 * X_F9 - 6 * X_F5 - 2 * X_F18 - 
		2 * X_F19 - 4 * X_F37 - 0.5 * X_F23 - 2 * X_F21 - X_F46);
	X_F62 <- (sum((b_st %*% t(b_st[, ss])) * b[, ss])/8 - 0.5 * X_F18 - 0.75 * X_F41);
	X_F63 <- (sum(colSums(b_ar) * choose(diag(b3), 3))/2 - 2 * X_F19 - X_F44);
	X_F64 <- (sum(colSums(b_sq_r * b3) * pmax(colSums(b_sq) - 2, 0))/2 - 4 * X_F19 - 4 * 
		X_F37 - 60 * X_F38 - 2 * X_F44 - X_F46 - 8 * X_F49);
	X_F65 <- (sum(colSums(b_bf2) * choose(colSums(b_tr2) - 1, 2))/4 - 2 * X_F19 - 30 * X_F38 - 
		0.5 * X_F44 - 4 * X_F49);
	X_F66 <- (sum(Schoose2(b_p4 - 1) * b_bf2)/2 - 2 * X_F2 - 0.5 * X_F44);
	X_F67 <- (sum(diag(b3) * rowSums(b4 * t(b3)))/2 - 16 * X_F2 - 72 * X_F7 - 4 * X_F4 - 
		16 * X_F9 - 60 * X_F5 - 8 * X_F18 - 28 * X_F19 - 4 * X_F37 - 6 * X_F6 - 5 * X_F23 - 
		2 * X_F39 - 4 * X_F13 - 8 * X_F21 - 8 * X_F22 - 2 * X_F42 - 8 * X_F44 - 24 * X_F45 - 
		2 * X_F46 - 4 * X_F47 - 4 * X_F48 - 2 * X_F26 - 2 * X_F53 - 4 * X_F54 - X_F55 - X_F56 - 
		2 * X_F57 - 2 * X_F58);
	X_F68 <- (sum(diag(b4) * rowSums(b3 * t(b3)))/2 - 8 * X_F2 - 48 * X_F7 - X_F4 - 18 * 
		X_F9 - 12 * X_F5 - 4 * X_F18 - 12 * X_F19 - 8 * X_F37 - 6 * X_F11 - X_F23 - 6 * X_F39 - 
		2 * X_F13 - 8 * X_F21 - 4 * X_F22 - 4 * X_F40 - 2 * X_F42 - 4 * X_F43 - 4 * X_F44 - 
		3 * X_F46 - 2 * X_F47 - 4 * X_F50 - 2 * X_F53 - X_F55 - 2 * X_F59 - X_F60 - 2 * X_F61);
	X_F69 <- (sum(choose(diag(b5), 2))/2 - 3 * X_F18 - 4 * X_F37 - 3 * X_F20 - 2 * X_F39 - 
		2 * X_F41 - 2 * X_F42 - X_F46 - 2 * X_F48 - 2 * X_F51 - X_F56 - X_F60 - 2 * X_F62);
	X_F70 <- (sum(((t(b_pn) %*% b) * b2[ss, ]) %*% t(b_ar[, ss]))/4 - 2 * X_F9 - 4 * X_F18 - 
		4 * X_F19 - X_F23 - 2 * X_F39 - 4 * X_F40 - X_F41 - 2 * X_F44 - X_F46 - 2 * X_F47 - 
		X_F53 - X_F55 - X_F60);
	X_F71 <- (sum(((t(b_sq) %*% b) * b2[ss, ]) %*% t(b_st[, ss]))/8 - X_F2 - 6 * X_F5 - 3 * 
		X_F18 - 4 * X_F19 - 4 * X_F37 - X_F23 - X_F41 - 4 * X_F43 - X_F44 - 6 * X_F45 - X_F46 - 
		2 * X_F48 - X_F54 - X_F56 - X_F59 - X_F62);
	X_F72 <- (sum(colSums((b_ar[, ss] %*% b_sq2) * b_p3) * pmax(colSums(b_ar) - 2, 0))/16 - 
		3 * X_F5 - X_F19 - 0.25 * X_F23 - 0.5 * X_F21 - 1.5 * X_F44 - 12 * X_F45 - 0.25 * 
		X_F53 - X_F54 - 3 * X_F63);
	X_F73 <- (sum(colSums(b_p4s * t(b_p4s)) * choose(diag(b3), 2))/2 - 12 * X_F7 - 3 * X_F9 - 
		8 * X_F19 - 60 * X_F38 - 2 * X_F21 - 2 * X_F22 - 2 * X_F40 - 2.5 * X_F44 - X_F46 - 
		4 * X_F47 - 12 * X_F49 - X_F55 - 3 * X_F63 - 2 * X_F64 - 2 * X_F65);
	X_F74 <- (sum(diag(b3) * diag(b4) * diag(b5))/2 - 6 * X_F9 - 8 * X_F18 - 8 * X_F19 - 
		12 * X_F37 - 60 * X_F38 - X_F23 - 2 * X_F39 - 4 * X_F13 - 4 * X_F40 - 2 * X_F41 - 
		2 * X_F42 - 2 * X_F44 - 5 * X_F46 - 4 * X_F47 - 8 * X_F48 - 12 * X_F49 - X_F55 - 
		2 * X_F56 - X_F60 - 3 * X_F64 - 4 * X_F66);
	X_F75 <- (sum(colSums(b_sq) * colSums(b_ar) * colSums(b_ar[, ss]))/8 - 12 * X_F7 - 2 * 
		X_F9 - 8 * X_F19 - 4 * X_F37 - 60 * X_F38 - 2 * X_F22 - 2 * X_F42 - 2 * X_F44 - X_F46 - 
		X_F47 - 12 * X_F49 - X_F57 - X_F64 - 4 * X_F65);
	X_F76 <- (sum(colSums(b_tr) * colSums(b_ar) * colSums(b_st[, ss]))/4 - 24 * X_F7 - 4 * 
		X_F9 - 4 * X_F18 - 14 * X_F19 - 8 * X_F37 - 60 * X_F38 - X_F23 - 2 * X_F21 - 4 * 
		X_F44 - 3 * X_F46 - 4 * X_F47 - 4 * X_F48 - 12 * X_F49 - 2 * X_F58 - 2 * X_F61 - 
		3 * X_F63 - 2 * X_F64 - 2 * X_F65 - 2 * X_F66);
	X_F77 <- (sum(colSums(b_ar) %*% b_sq %*% colSums(b_ar))/16 - X_F2 - X_F9 - 9 * X_F5 - 
		2 * X_F19 - 2 * X_F37 - X_F21 - X_F42 - 2 * X_F44 - 12 * X_F45 - 0.5 * X_F46 - X_F48 - 
		0.5 * X_F57 - 3 * X_F63 - X_F66);
	X_F78 <- (sum(choose(colSums(b_sq), 3))/2 - 8 * X_F12 - 4 * X_F19 - 4 * X_F37 - 20 * 
		X_F38 - 4 * X_F43 - X_F44 - X_F46 - X_F47 - 4 * X_F49 - X_F59 - X_F64);
	X_F79 <- (sum(b_p4s * t(Schoose3(b_p4s)))/2 - 0.5 * X_F44 - X_F63 - X_F66);
	X_F80 <- (sum(t(b_p3) * Schoose2(b_p4s) * b_p5)/4 - X_F40 - 0.25 * X_F46 - 0.5 * X_F60 - 
		0.5 * X_F66);
	X_F81 <- (sum(b * outer(diag(b3), colSums(b4 * t(b3))))/4 - 14 * X_F2 - 84 * X_F7 - 3 * 
		X_F4 - 24 * X_F9 - 84 * X_F5 - 12 * X_F18 - 56 * X_F19 - 10 * X_F37 - 180 * X_F38 - 
		5 * X_F6 - 8.5 * X_F23 - 5 * X_F39 - 6 * X_F13 - 16 * X_F21 - 13 * X_F22 - 3 * X_F42 - 
		28 * X_F44 - 84 * X_F45 - 7 * X_F46 - 10 * X_F47 - 10 * X_F48 - 48 * X_F49 - 2 * 
		X_F26 - 7 * X_F53 - 10 * X_F54 - 2.5 * X_F55 - 2.5 * X_F56 - 4 * X_F57 - 3 * X_F58 - 
		X_F61 - 30 * X_F63 - 11 * X_F64 - 14 * X_F65 - 8 * X_F66 - 1.5 * X_F67 - 8 * X_F72 - 
		4 * X_F73 - 2 * X_F74 - 4 * X_F75 - 2 * X_F76 - 4 * X_F77);
	X_F82 <- (sum(b * outer(diag(b4), colSums(b3 * t(b3))))/4 - 8 * X_F2 - 48 * X_F7 - 1.5 * 
		X_F4 - 21 * X_F9 - 30 * X_F5 - 6 * X_F18 - 30 * X_F19 - 12 * X_F37 - 120 * X_F38 - 
		5 * X_F11 - X_F6 - 2.5 * X_F23 - 9 * X_F39 - 3 * X_F13 - 12 * X_F21 - 6 * X_F22 - 
		6 * X_F40 - 3 * X_F42 - 6 * X_F43 - 17 * X_F44 - 24 * X_F45 - 8.5 * X_F46 - 9 * X_F47 - 
		2 * X_F48 - 32 * X_F49 - 4 * X_F50 - 5 * X_F53 - 2 * X_F54 - 2.5 * X_F55 - X_F58 - 
		5 * X_F59 - 2.5 * X_F60 - 3 * X_F61 - 18 * X_F63 - 10 * X_F64 - 4 * X_F65 - 10 * 
		X_F66 - 1.5 * X_F68 - 4 * X_F72 - 2 * X_F73 - 2 * X_F74 - 2 * X_F76 - 6 * X_F78 - 
		6 * X_F79 - 2 * X_F80);
	X_F83 <- (sum(b * outer(diag(b5), diag(b5))) - 10 * X_F36 - 28 * X_F18 - 64 * X_F37 - 
		240 * X_F38 - 20 * X_F20 - 24 * X_F39 - 24 * X_F41 - 24 * X_F42 - 28 * X_F46 - 56 * 
		X_F48 - 64 * X_F49 - 16 * X_F51 - 20 * X_F56 - 20 * X_F60 - 40 * X_F62 - 24 * X_F64 - 
		48 * X_F66 - 12 * X_F69 - 16 * X_F74 - 32 * X_F80)/8;
	#
	## Cycle reconstruction
	c3 <- sum(diag(b3))/6;
	c4 <- sum(diag(b4))/8;
	c5 <- sum(diag(b5))/10;
	c6 <- (sum(b3 * t(b3)) - 6 * X_F1 - 12 * X_F2 - 24 * X_F3)/12;
	c7 <- (sum(b4 * t(b3)) - 28 * X_F2 - 14 * X_F4 - 84 * X_F5 - 28 * X_F6)/14;
	c8 <- (sum(b4 * t(b4)) - 144 * X_F7 - 8 * X_F8 - 16 * X_F4 - 64 * X_F9 - 48 * X_F10 - 
		16 * X_F11 - 96 * X_F12 - 96 * X_F13 - 16 * X_F14 - 32 * X_F15 - 32 * X_F16 - 32 * 
		X_F17)/16;
	c9 <- (sum(b5 * t(b4)) - 6 * X_F1 - 36 * X_F2 - 72 * X_F3 - 18 * X_F4 - 36 * X_F5 - 288 * 
		X_F7 - 90 * X_F9 - 18 * X_F14 - 108 * X_F18 - 180 * X_F19 - 36 * X_F20 - 108 * X_F21 - 
		36 * X_F22 - 72 * X_F23 - 72 * X_F24 - 288 * X_F25 - 18 * X_F26 - 18 * X_F27 - 36 * 
		X_F28 - 144 * X_F29 - 108 * X_F30 - 108 * X_F31 - 72 * X_F32 - 108 * X_F33 - 36 * 
		X_F34 - 36 * X_F35)/18;
	c10 <- (sum(b5 * t(b5)) - 120 * X_F2 - 480 * X_F7 - 10 * X_F36 - 20 * X_F4 - 280 * X_F9 - 
		720 * X_F5 - 220 * X_F18 - 560 * X_F19 - 240 * X_F37 - 2640 * X_F38 - 40 * X_F11 - 
		40 * X_F6 - 20 * X_F20 - 100 * X_F23 - 180 * X_F39 - 40 * X_F13 - 240 * X_F21 - 120 * 
		X_F22 - 120 * X_F40 - 60 * X_F41 - 60 * X_F42 - 120 * X_F43 - 360 * X_F44 - 720 * 
		X_F45 - 200 * X_F46 - 200 * X_F47 - 200 * X_F48 - 880 * X_F49 - 20 * X_F26 - 40 * 
		X_F50 - 20 * X_F51 - 40 * X_F52 - 120 * X_F53 - 120 * X_F54 - 80 * X_F55 - 80 * X_F56 - 
		40 * X_F57 - 40 * X_F58 - 80 * X_F59 - 80 * X_F60 - 40 * X_F61 - 80 * X_F62 - 480 * 
		X_F63 - 320 * X_F64 - 240 * X_F65 - 320 * X_F66 - 20 * X_F67 - 20 * X_F68 - 20 * 
		X_F69 - 40 * X_F70 - 40 * X_F71 - 160 * X_F72 - 120 * X_F73 - 120 * X_F74 - 80 * 
		X_F75 - 80 * X_F76 - 80 * X_F77 - 120 * X_F78 - 120 * X_F79 - 120 * X_F80 - 40 * 
		X_F81 - 40 * X_F82 - 40 * X_F83)/20;
	#
	## Output
	return(c(X1, X2, X3, X4, X5, X6, X7, X8, X9,X10,
		X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,
		X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,
		X31,X32,X33,X34,X35,X36,X37,X38,X39,X40,
		X41,X42,X43,X44,X45,X46,X47,X48,X49,X50,
		X51,X52,X53,X54,X55,X56,X57,X58,X59,X60,
		X61,X62,X63,X64,X65,X66,X67,X68,X69,X70,
		X71,X72,X73,X74,X75,X76,X77,X78,X79,X80,
		X81,X82,X83,
		c3, c4, c5, c6, c7, c8, c9, c10))
}