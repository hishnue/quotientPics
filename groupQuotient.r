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
    if(bad.coord(x,y)){
        result = 0
    } else {
        result = pic[coord2pic(x,y)]
    }
    return(result)
}
bad.coord = function(x,y){
    result = (x < -13 | x > 14 | y < -13 | y > 14)
    return(result)
}
coord2pic = function(x,y){
    y = 1-y
    if(bad.coord(x,y)){
        stop("bad coord in coord2pic")
    }
    return( (y + 13) * 28 + 14 + x )
}
pic2coord = function(z){
    x = (z %% 28) - 14
    x = ifelse(x==-14,14,x)
    y =((z - x -14)/28) -13 
    y = 1-y
    if(bad.coord(x,y)){
        stop("coords outside bounds in pic2coord")
    } 
    return(c(x,y))
}
#two steps: 
#1) use GL_2 to do some stuff, 
gl.opp = function(pic, a,b,c,d){
    #assert det != 0
}
#2) do a shift to move (0,0) to some other point
shift.opp  = function(pic, x,y){
   # return a pic 
   result = replicate(784, 0)
   xi = floor(x)
   yi = floor(y)
   xf = x - xi
   yf = y - yi
   for( i in -13:14){
        i2 = i - xi
        for(j in -13:14){
            j2 = j - yi
            result[coord2pic(i,j)]  = pix.val(pic, i2,j2)*(1-xf)*(1-yf) +
                                      pix.val(pic, i2-1,j2)*xf*(1-yf) +
                                      pix.val(pic, i2,j2-1)*(1-xf)*yf +
                                      pix.val(pic, i2-1,j2-1)*xf*yf 
        }
   }
   return(result)
}

# umm, once you have quotient space, try simple 10-means clustering
# could I try some kind of 'gradient decent' where the motions
# are defined by the group elements and directed by the errors?
# backpropigate cosine errors
