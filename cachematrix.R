## The functions create a special matrix, compute its inverse and caches the inverse of the matrix

## This function creates a special "matrix" object that can cache its inverse. Its agrgument is a numeric matrix.
## The <<- operator is used to assign an abject from a different environment

makeCacheMatrix <- function(x = matrix()) {
		i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
	
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. It requires a numeric amtrix as its argument.
##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data,...)
        x$setinv(inv) 
		inv
}
