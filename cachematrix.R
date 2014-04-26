## Programming assignment #2 - write a pair of functions that cache the inverse of a matrix
##
## More details at:
## https://class.coursera.org/rprog-002/human_grading/view/courses/972078/assessments/3/submissions


## makeCacheMatrix: This function creates a special "matrix" object that can cache 
## its inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    # clear out inverse
    inverse <- NULL
    
    # set the value of a matrix and its invers
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    
    # function to return X
    get <- function() x
    
    # function to set the inverse of x
    setInv <- function(solve) inverse <<- solve(x)
    
    # funtion to return the inverse of x
    getInv <- function() inverse
    
    # return these functions
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
    
}


## cacheSolve: This function computes the inverse of the special "matrix" returned
## by makeCacheMatrix. If the inverse has already been calculated then
## this function should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    
    # i to the pre-calcualted inverse of x
    i <- x$getInv()
    
    # if there IS a pre-caclualted value of x
    # then send it back to the user
    if(!is.null(i)) {
        
        # tell user that you are getting cached data
        message("getting cached data")
        
        # send back the cached data
        return(i)
    }
    
    # get the matrix
    mymatrix <- x$get()
    
    # calculate the inverse of the matrix
    inv <- x$setInv(mymatrix)
    
    # print out the matrix
    inv
}
