## The functions below are able to cache the inverse of a matrix, 
## so that it can be looked up in cache rather than recomputed if
## needed again.

## makeCacheMatrix is a list of four functions to set/get a matrix 
## or it's inverse into cache

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inv <<- solve
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve tries to extract the inverse matrix from cache if it
## has already been computed and cached,  or else the inverse will 
## computed and cached for later use.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting inverse matrix from cache")
    return(m)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv}
