makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    y <<- x
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) inv <<- solve  # inverse matrix function -> solve()
  getInverse <- function() inv
  list(set = set,                # gives the name 'set' to the set() function defined above
       get = get,                # gives the name 'get' to the get() function defined above
       setInverse = setInverse,  # gives the name 'setmean' to the setmean() function defined above
       getInverse = getInverse)  # gives the name 'getmean' to the getmean() function defined above
}
# Naming the list elements is what allows us to use the $ form of the extract operator to access the functions by name
# rather than using the [[ form of the extract operator.


cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}


# Example usage
aMatrix <- matrix( c(5, 1, 0,
                          3,-1, 2,
                          4, 0,-1), nrow=3, byrow=TRUE)
a1 <- makeCacheMatrix(aMatrix)
a1$get()
cacheSolve(a1)