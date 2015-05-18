"
Initiate random 'quotient matrix' M.
Generate two different group elements g1,g2 via some distribution.
Pull one image x.
Compute M(g1(x)) =y1 and M(g2(x)) = y2.
Compute error as cosine difference: err. (so they don't go to zero).
Backpropigate to maximize err.  (think of as on proj space.)
repeat from top.

Take two similar images and see if they have similar cosine distance
on the other end?
Do this for various sizes of target space and see what happens.
You want the 'biggest' quotent space you can get.

Transform all your data into quotient space data.
Do all analysis from transformed data.  
"

# generate random group element


# backpropigate cosine errors
