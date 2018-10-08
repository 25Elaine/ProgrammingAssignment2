## This function will create a list of functions to set a matrix and cache the inverse of a matrix

## create a matrix that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
                x<<-y
                m<<-NULL
        }
        get<-function()x
        setmatrix<-function(solve)m<<-solve
        getmatrix<-function()m
        list(set=set,get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)
}


## caching the inverse of the matrix
cachesolve <- function(x, ...) {
        m<-x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix<-x$get()
        m<-solve(matrix,...)
        x$setmatrix(m)
        m
}