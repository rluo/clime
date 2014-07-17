\name{cv.clime}
\alias{cv.clime}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{k-fold cross validation for clime object}
\description{
  Perform a k-fold cross validation for selecting lambda
}
\usage{
cv.clime(clime.obj, loss=c("likelihood", "tracel2"), fold=5) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{clime.obj}{clime object output from \code{clime}.  Note that
    this requires that the input to \code{clime} is \code{x} instead of
    the sample covariance matrix.
  }
  \item{loss}{
    loss to be used in cross validation.  Currently, two losses are
    available: "likelihood" and "tracel2".  Default "likelihood".
  }
  \item{fold}{
    number of folds used in cross validation.  Default 5.
  }
}


\details{
  Perform a k-fold cross validation  for selecting the tuning parameter
  \code{lambda} in clime.  Two losses are implemented currently:
  \deqn{
    \textrm{likelihood: } Tr[\Sigma \Omega] - \log|\Omega| -
    p
  }
  \deqn{
    \textrm{tracel2: } Tr[ diag(\Sigma \Omega - I)^2].
  }
}

\value{
  An object with S3 class \code{"cv.clime"}.   You can use it as a
  regular R list with the following fields:
  \item{lambdaopt}{the lambda selected by cross validation to minimize the loss over
    the grid values of \code{lambda}.}
  \item{loss}{
    the name of loss used in cross validation.
  }
  \item{lambda}{sequence of \code{lambda} used in the program.
  }
  \item{loss.mean}{average k-fold loss values for each grid value \code{lambda}.
  }
  \item{loss.mean}{
    standard deviation of k-fold loss values for each grid value \code{lambda}.
  }
  \item{lpfun}{Linear programming solver used.}
}

\references{Cai, T.T., Liu, W., and Luo, X. (2011). \emph{
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
re.clime.opt <- clime(X, re.cv$lambdaopt)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{multivariate}% __ONLY ONE__ keyword per line
