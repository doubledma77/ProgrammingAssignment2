## write a pair of functions that cache the inverse of a matrix.

## the following function creates a special "matrix", which is really a list containing a function to 
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse of the matrix
## get the value of the inverse of the matrix
## the inverse of the matrix is cached

makeCacheMatrix <- function(x = numeric()) {
                                            cache <- NULL
                                            setMatrix <- function(newValue) {
                                              x <<- newValue
                                              cache <<- NULL
                                            }
                                            getMatrix <- function() {
                                              x
                                            }
                                            
                                            cacheInverse <- function(solve) {
                                              cache <<- solve
                                            }
                                            
                                            getInverse <- function() {
                                              cache
                                            }
                                            list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)

}


## The following function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(y, ...) {
        
               inverse <- y$getInverse()
               if(!is.null(inverse)) {
               message("getting cached data")
               return(inverse)
               }
              data <- y$getMatrix()
              inverse <- solve(data)
              y$cacheInverse(inverse)
              inverse
}
