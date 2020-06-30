# Small-Subgraph-Counting
R code to find small and not so small subgraphs, tabulate where they are (attached to which vertex and edge), and ultimately count them.

To use this code, you need R, the Matrix and igraph packages installed, then you can source each R file (as in "source(profile_base.R)") in each R script you want to rely on these functions.

Each profiler will count all subgraph over the named number of vertices. These profiles will be be counts of subgraphs: connected to a pair of edge, pair of vertices, an edge, a vertex, and total count.

Each function has, at the top, a list of the rooted subgraph counted (presented as edgelists), and commented-out, means to visualize the rooted subgraphs.

 The companion paper can be found on arXiv:1701.00177. Please use the citaion on the arXiv page when you use this code.
 
 This code is prvided under a GNU license, but other license could be provided upon request.
 
