\name{clime-internal}
\alias{likelihood}
\alias{tracel2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{internal clime functions}
\description{
  Internal clime functions
}
\usage{
likelihood(Sigma, Omega)
tracel2(Sigma, Omega)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Sigma}{Covariance matrix.}
  \item{Omega}{Inverse covariance matrix.}
}


\details{
  There are not intended for use by users.   
}

\references{Cai, T.T., Liu, W., and Luo, X. (2011).   \emph{
     A constrained \eqn{\ell_1}
  minimization approach for sparse precision matrix estimation.
  } Journal of the American Statistical Association  106(494): 594-607. 
}

\author{T. Tony Cai, Weidong Liu and Xi (Rossi) Luo\cr
  Maintainer: Xi (Rossi) Luo \email{xi.rossi.luo@gmail.com} }

% \note{
% \section{TODO}{More features will be added very soon.}
% }


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{multivariate}% __ONLY ONE__ keyword per line


