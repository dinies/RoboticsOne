*****I am distributing these source files for your benefit, but I must ask that you do NOT redistribute them. In particular, do not post them on ftp or web sites, and in any case do not change the header with the credits.*****

---------------------------------

Run s12_8.m to execute the program. The obstacles may be line segments, circles or polygons. The user must also input the start and goal configurations, the motion primitives (the discrete set of admissible constant values of the driving and steering velocities within the time interval Delta), and the PRM algorithm parameters, i.e., the value of Delta and the maximum number of configurations in the roadmap.

Since the unicycle cannot reach arbitrary configurations in C_free with this planner, the program terminates whenever a configuration is reached that is sufficiently close to the desired goal (shown in gray in the stroboscopic plot); to this end, a user-selectable distance threshold is used. Moreover, to bias the search towards the goal, q_rand may be set to q_g - rather than to a random configuration - with a fixed probability that can be chosen arbitrarily (since the probability is constant this is NOT an epsilon-greedy policy; however, you may easily implement it).

Note that the configuration space, visualized as a parallelepiped, is correctly treated as R^2 x SO(2) in the program. Again, the configuration space distance is chosen so as to reflect the non-euclidean nature of this space.
