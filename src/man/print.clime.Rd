\name{print.clime}
\alias{print.clime}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{print a clime object}
\description{
  Print a summary of the clime object.
}
\usage{
\method{print}{clime}(x,digits = max(3, getOption("digits") - 3), ... )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{clime object.}
  \item{digits}{significant digits in printout.}
  \item{...}{additional print options.}
}


\details{
  This call simply outlines the options used for computing a clime object.
}

\value{
  The output above is invisiblly returned.
}

\references{Cai, T.T., Liu, W., and Luo, X. (2011).   \emph{
     A constrained \eqn{\ell_1}
  minimization approach for sparse precision matrix estimation.
} Journal of the American Statistical Association 106(494): 594-607.}

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
print(re.clime)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{multivariate}% __ONLY ONE__ keyword per line


