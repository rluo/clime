\name{clime}
\alias{clime}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{solve for the inverse matrix}
\description{
  Solve for a series of the inverse covariance matrix estimates at a grid of
  values for the constraint lambda.
}
\usage{
clime(x, lambda=NULL, nlambda=ifelse(is.null(lambda),100,length(lambda)),
      lambda.max=0.8, lambda.min=ifelse(nrow(x)>ncol(x), 1e-4, 1e-2),
      sigma=FALSE, perturb=TRUE, standardize=TRUE, logspaced=TRUE,
      linsolver=c("primaldual", "simplex"), pdtol=1e-3, pdmaxiter=50)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Input matrix of size n (observations) times p (variables).
    Each column is a variable of length n. Alternatively, the sample
    covariance matrix may be set here with the next option \code{sigma}
    set to be TRUE.  When the input is the sample covariance matrix,
    \code{cv.clime} can not be used for this object.}
  \item{lambda}{Grid of non-negative values for the constraint
    parameter lambda. If missing, \code{nlambda}  values from \code{lambda.min} to
    \code{lambda.max} will be generated.}
  \item{standardize}{Whether the  variables will be
    standardized to have mean zero and unit standard deviation.
    Default
    TRUE.}
  \item{nlambda}{Number of values for program generated \code{lambda}.  Default 100.}
  \item{lambda.max}{Maximum value of program generated \code{lambda}.
    Default 0.8.}
  \item{lambda.min}{Minimum value of program generated \code{lambda}.
    Default 1e-4(\eqn{n > p}) or 1e-2(\eqn{n < p}).
  }
  \item{sigma}{Whether \code{x} is the sample covariance matrix.
    Default FALSE. }
  \item{perturb}{Whether a perturbed \code{Sigma} should be used or
    the positive perturbation added if it is numerical.  Default TRUE.}
  \item{logspaced}{Whether program generated lambda should be
    log-spaced or linear spaced.  Default TRUE.
  }
  \item{linsolver}{Whether \code{primaldual} (default) or \code{simplex} method
    should be employed. Rule of thumb: \code{primaldual} for large p,
    \code{simplex} for small p.}
  \item{pdtol}{Tolerance for the duality gap, ignored if \code{simplex}
    is employed.}
  \item{pdmaxiter}{Maximum number of iterations for \code{primaldual},
    ignored if \code{simplex} is employed.}
}


\details{
  A constrained \eqn{\ell_1}
  minimization approach for sparse precision matrix estimation (details
  in references) is implemented here using linear programming (revised
  simplex or primal-dual interior point method).  It solves  a sequence of
  \code{lambda} values on the following objective function\cr
  \deqn{
    \min | \Omega |_1 \quad \textrm{subject to: } || \Sigma_n
  \Omega - I ||_\infty \le \lambda
  }\cr
  where \eqn{\Sigma_n} is the sample covariance matrix and \eqn{\Omega}
  is the inverse we want to estimate.
}

\value{
  An object with S3 class \code{"clime"}.   You can also use it as a
  regular R list with the following fields:
  \item{Omega}{List of estimated inverse covariance matrix for a grid of
    values for   \code{lambda}.}
  \item{lambda}{Actual sequence of \code{lambda} used in the program
  }
  \item{perturb}{Actual perturbation used in the program.}
  \item{standardize}{Whether standardization is applied to the columns
    of \code{x}.}
  \item{x}{Actual \code{x} used in the program.}
  \item{lpfun}{Linear programming solver used.}
}

\references{Cai, T.T., Liu, W., and Luo, X. (2011).   \emph{
     A constrained \eqn{\ell_1}
  minimization approach for sparse precision matrix estimation.
  } Journal of the American Statistical Association 106(494): 594-607.
}

\author{T. Tony Cai, Weidong Liu and Xi (Rossi) Luo\cr
  Maintainer: Xi (Rossi) Luo \email{xi.rossi.luo@gmail.com} }

% \note{
% \section{TODO}{More features will be added very soon.}
% }

\examples{
## trivial example
n <- 50
p <- 5
X <- matrix(rnorm(n*p), nrow=n)
re.clime <- clime(X)

## tridiagonal matrix example
bandMat <- function(p, k) {
  cM <- matrix(rep(1:p, each=p), nrow=p, ncol=p)
  return((abs(t(cM)-cM)<=k)*1)
}
## tridiagonal Omega with diagonal 1 and off-diagonal 0.5
Omega <- bandMat(p, 1)*0.5
diag(Omega) <- 1
Sigma <- solve(Omega)
X <- matrix(rnorm(n*p), nrow=n)\%*\%chol(Sigma)
re.clime <- clime(X, standardize=FALSE, linsolver="simplex")
re.cv <- cv.clime(re.clime)
re.clime.opt <- clime(X, standardize=FALSE, re.cv$lambdaopt)

## Compare Frobenius norm loss
## clime estimator
sqrt( sum( (Omega-re.clime.opt$Omegalist[[1]])^2 ) )
## Not run: 0.3438533
## Sample covariance matrix inversed
sqrt( sum( ( Omega-solve(cov(X)*(1-1/n)) )^2 ) )
## Not run: 0.874041
sqrt( sum( ( Omega-solve(cov(X)) )^2 ) )
## Not run: 0.8224296
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{multivariate}% __ONLY ONE__ keyword per line
