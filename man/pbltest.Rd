\name{pbltest}
\alias{pbltest}
\alias{pbltest.formula}
\alias{pbltest.plm}

\title{Baltagi and Li Serial Dependence Test For Random Effects Models}

\description{Baltagi and Li (1995)'s Lagrange multiplier test for AR(1) or MA(1) idiosyncratic errors in panel models with random effects.
}

\usage{
\method{pbltest}{formula}(x, data, 
                         alternative = c("twosided", "onesided"), index = NULL, \dots)
\method{pbltest}{plm}(x, alternative = c("twosided", "onesided"), \dots)
}

\arguments{
 \item{x}{a model formula or an estimated random--effects model of class \code{plm} ,}
 \item{data}{for the formula interface only: a \code{data.frame},}
 \item{alternative}{one of \code{"twosided"}, \code{"onesided"}. Selects either \eqn{H_A: \rho \neq 0} or \eqn{H_A: \rho = 0}
   (i.e., the Normal or the Chi-squared version of the test),}
 \item{index}{the index of the \code{data.frame},}
 \item{\dots}{further arguments.}
}

\details{
This is a Lagrange multiplier test for the null of no serial
correlation, against the alternative of either an AR(1) or an MA(1) process, in the idiosyncratic component of the error term in a random effects panel model (as the analytical expression of the test turns out to be the same under both alternatives, see Baltagi and Li (1995, 1997)). The \code{alternative} argument, defaulting to \code{twosided}, allows testing for positive serial correlation only, if set to \code{onesided}.
}

\value{
An object of class \code{"htest"}.
}

\author{Giovanni Millo}

\references{
Baltagi, B.H. and Li, Q. (1995) Testing AR(1) against MA(1)
disturbances in an error component model, \emph{Journal of Econometrics} \bold{68}, pp. 133--151.

Baltagi, B.H. and Li, Q. (1997) Monte Carlo results on pure and
pretest estimators of an error component model with autocorrelated disturbances, \emph{Annales d'economie et de statistique} \bold{48}, pp. 69--82.
}

\seealso{
\code{\link{pdwtest}}, \code{bgtest}, 
\code{\link{pbsytest}}, \code{\link{pwartest}} and \code{\link{pwfdtest}} for other serial correlation tests for panel models.
}

\examples{
data("Grunfeld", package = "plm")

# formula interface
pbltest(inv ~ value + capital, data = Grunfeld)

# plm interface
re_mod <- plm(inv ~ value + capital, data = Grunfeld, model = "random")
pbltest(re_mod)
pbltest(re_mod, alternative = "onesided")
}

\keyword{htest}
