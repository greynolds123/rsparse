% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metrics.R
\name{metrics}
\alias{metrics}
\alias{ap_k}
\alias{ndcg_k}
\title{Ranking Metrics for Top-K Items}
\usage{
ap_k(predictions, actual, ...)

ndcg_k(predictions, actual, ...)
}
\arguments{
\item{predictions}{matrix of predictions. Predctions can be defined 2 ways:
\enumerate{
  \item \code{predictions} = \code{integer} matrix with item indices (correspond to column numbers in \code{actual})
  \item \code{predictions} = \code{character} matrix with item identifiers (characters which correspond to \code{colnames(actual)})
  which has attribute "indices" (\code{integer} matrix with item indices which correspond to column numbers in \code{actual}).
}}

\item{actual}{sparse Matrix of relevant items. Each non-zero entry considered as relevant item.
Value of the each non-zero entry considered as relevance for calculation of \code{ndcg@k}.
It should inherit from \code{Matrix::sparseMatrix}. Internally \code{Matrix::RsparseMatrix} is used.}

\item{...}{other arguments (not used at the moment)}
}
\description{
\code{ap_k} calculates \bold{Average Precision at K (\code{ap@k})}.
Please refer to \href{https://en.wikipedia.org/wiki/Information_retrieval#Average_precision}{Information retrieval wikipedia article}

\code{ndcg_k()} calculates \bold{Normalized Discounted Cumulative Gain at K (\code{ndcg@k})}.
Please refer to \href{https://en.wikipedia.org/wiki/Discounted_cumulative_gain#Normalized_DCG}{Discounted cumulative gain}
}
\examples{
predictions = matrix(
  c(5L, 7L, 9L, 2L),
  nrow = 1
)
actual = matrix(
  c(0, 0, 0, 0, 1, 0, 1, 0, 1, 0),
  nrow = 1
)
actual = as(actual, "RsparseMatrix")
identical(rsparse::ap_k(predictions, actual), 1)
}
