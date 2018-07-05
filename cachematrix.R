## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # initially nothing is cached so set it to NULL
  inv <- NULL
  setMat <- function(y) {
    x <<- y
    # we got new matrix y so we need new inverse
    inv <<- NULL
  }
  getMat <- function(){
    #returns the stored matrox
    x
  }
  setInvMat <- function(inv_mat){
    #caches the given inverse matrix
    inv <<- inv_mat
  } 
  getInvMat <- function(){
    #get the cache value
    inv
  }
  list(setMat = setMat, getMat = getMat, setInvMat = setInvMat, getInvMat = getInvMat)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInvMat()
  #geting the cache value
  #if the caches exists then return it
  if(!is.null(inv)) {
    message("getting cached result")
    return(inv)
  }
  #otherwise get the mat and compute its inverse
  mat <- x$getMat()
  inv <- solve(mat, ...)
  #cache the computed inverse and return it
  x$setInvMat(inv)
  inv
}


