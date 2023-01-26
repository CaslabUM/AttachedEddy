# AttachedEddy

Code to accompany the paper "Uncovering Optimal Attached Eddies in Wall-bounded Turbulence" by Karthik Duraisamy.

AttachedEddy_inference.nb solves the inverse problem to extract the eddy contribution function

AttachedEddy.m is a forward model to solve for the flow field given an eddy packet (Eddygen.m sets the eddy shape)
 
Optim.m optimizes circulation strengths of the eddies in the eddy packet.

Much work remains in properly documenting the codes, but they work.
