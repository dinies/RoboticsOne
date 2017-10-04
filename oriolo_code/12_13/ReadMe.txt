*****I am distributing these source files for your benefit, but I must ask that you do NOT redistribute them. In particular, do not post them on ftp or web sites, and in any case do not change the header with the credits.*****

---------------------------------

Run s12_13.m to execute the program. The user is required to input the binary gridmap representing the configuration space, the start and goal cells, and the adjacency type (1- or 2-adjacency). The cells are assumed to be squares with unit side. During the expansion of the wavefront that originates at the goal, the increase of the navigation function between adjacent cells (cost-to-go) is set equal to the Euclidean distance between the cell centers. The solution path is then found by following the steepest descent from the goal cell.
