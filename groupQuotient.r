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
pix.val = function(pic, x,y){
    " x and y coords vary between -13 and 14
    returns the value of the pic at the coord,
    where stuff outside is zero."
    if(x < -13 | x > 14 | y < -13 | y > 14){
        result = 0
    } else {
        result = pic[coord2pic(x,y)]
    }
    return(result)
}
coord2pic = function(x,y){
    return( (x + 13) * 28 + 14 + y )
}
pic2coord = function(z){
    #the other way!
}
#two steps: 
#1) use GL_2 to do some stuff, 
gl.opp = function(pic, a,b,c,d){
    #assert det != 0
}
#2) do a shift to move (0,0) to some other point
shift.opp  = function(pic, x,y){
   # return a pic 
}

# umm, once you have quotient space, try simple 10-means clustering
# could I try some kind of 'gradient decent' where the motions
# are defined by the group elements and directed by the errors?
# backpropigate cosine errors
