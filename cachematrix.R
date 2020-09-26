## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL  ## this will clear any previous cached value 
  set <- function(y) { ## this is the 'setter' function 
    x <<- y     ## the double arrow assignment operator ensures that the x variable inherits the variable from the parent environment
    m <<- NULL
  }
  get <- function() x  ## these are the 'getter' functions 
  setInverse <- function(solve) inv <<- Inverse ## as per the assingment notes, solve returns an inverse of a matrix
  getInverse <- function() m 
  list(set = set, get = get,  ## the list functions allow us to recall the above functions with '$' operators rather than brackets
       setInverse = setInverse,
       getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m <- x$getInverse()  ##this will retrive the value of m from above 
    if(!is.null(m)) {     ## if this evaluates to FALSE then there is no previously stored data for M
      message("getting cached data")  ## this informs the user of the above
      return(m)
    }
    data <- x$get()  ## this will retrieve matrix from the makeCacheMatrix
    m <- solve(data, ...)   ## this applies the 'solve' function to get the invirse of the matrix
    x$setInverse(m)  ## this instruction saves the value in memory 
    m
  }
}

