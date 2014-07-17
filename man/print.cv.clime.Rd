\name{print.cv.clime}
\alias{print.cv.clime}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{print a cross validated clime object}
\description{
  Print a summary of the cv.clime object.
}
\usage{
\method{print}{cv.clime}(x,digits = max(3, getOption("digits") - 3), ... )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{cv.clime object.}
  \item{digits}{significant digits in printout.}
  \item{...}{additional print options.}
}


\details{
  This call outputs first a three column matrix with \code{lambda}, \code{mean}
  and \code{sd} for the cross validation loss values. The actual loss
  used and the optimal \code{lambda} value picked by cv are printed.
}

\value{
  The output above is invisibly returned.
}

\references{Cai, T.T., Liu, W., and Luo, X. (2011).   \emph{
     A constrained \eqn{\ell_1}
  minimization approach for sparse precision matrix estimation.
  }   Journal of the American Statistical Association  106(494): 594-607. 
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
re.cv <- cv.clime(re.clime)
print(re.cv)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{multivariate}% __ONLY ONE__ keyword per line

