## This is the solution of the programming assignment 2 for the Coursera 
## course introduction to R. The task was to write an R function that is able to cache  
## potentially time consuming computations.
## 

## The first function, `makeVector` creates a special "vector", which is
## really a list containing a function to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverse
## 4.  get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inverse <<- solve
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}




## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse<- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
