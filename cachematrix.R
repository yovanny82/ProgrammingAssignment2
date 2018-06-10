## By combining these functions you can invert a matrix or getting a cached
## value if the calclation was previously made

###Function to cache a matrix

makeCacheMatrix <- function(x = matrix()) { 
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Function to invert a matrix or getting the cached data if existing

cacheSolve <- function(x, ...) { 
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i   
    
    
}
