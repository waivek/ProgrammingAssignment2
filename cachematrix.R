## Tries to emulate OOP in R

## Creates a matrix with 4 functions to get and set matrix and inverse

makeCacheMatrix <- function(x = matrix()) {
    i <<- NULL
    setMatrix <- function(y) {
        x <<- y
        i <<- NULL
    }
    getMatrix <- function() x
    setInverse <- function(inverse) i <<- inverse
    getInverse <- function() i 
    list(setMatrix = setMatrix, 
         getMatrix = getMatrix,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Returns cached inverse if available, else calculates and returns inverse

cacheSolve <- function(x, ...) {
    i <- x$getInverse()
    if(!is.null(i)) {
        print("getting cached inverse")
        return(i)
    }
    mat <- x$getMatrix()
    i <- solve(mat)
    x$setInverse(i)
    i
}
