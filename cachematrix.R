## Matrix inversion is usually a costly computation and their may be some benefit 
## to caching the inverse of a matrix rather than compute it repeatedly 
## this pair of functions that cache the inverse of a matrix



## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = numeric()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolution <- function(solution) s <<- solution
  getsolution <- function() s
  list(set = set, get = get,
       setsolution = setsolution,
       getsolution = getsolution)
}

##  This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##  If the inverse has already been calculated (and the matrix has not changed), 
##  then the cachesolve should retrieve the inverse from the cache.\

cacheSolve <- function(x, ...) {
  s <- x$getsolution()
  if(!is.null(s)) {
    message("here is the cached data")
    return(s)
  }
  data <- x$get()
  s <- solution(data, ...)
  x$setsolution(s)
  s
}
        ## Return a matrix that is the inverse of 'x'
        
  
