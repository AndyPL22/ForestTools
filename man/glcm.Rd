% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glcm.R
\name{glcm}
\alias{glcm}
\title{Grey-Level Co-Occurrence Matrix}
\usage{
glcm(
  segs,
  image,
  n_grey = 32,
  angle = 0,
  clusters = 1,
  showprog = FALSE,
  roundCoords = 4
)
}
\arguments{
\item{segs}{RasterLayer. A segmented raster. Cell values should be equal to segment numbers}

\item{image}{RasterLayer. A single-band raster layer from which texture is measured}

\item{n_grey}{integer. Number of grey levels the image should be quantized into}

\item{angle}{integer. Angle at which GLCM will be calculated. Valid inputs are 0, 45, 90, or 135}

\item{clusters}{integer. Number of clusters to use during parallel processing}

\item{showprog}{logical. Display progress in terminal}

\item{roundCoords}{integer. Errors in coordinate precision can trigger errors in this function. Internally, the coordinates
are rounded to this decimal place. Default value of 4 decimals.}
}
\value{
data.frame
}
\description{
Generate textural metrics for a segmented raster using Grey-Level Co-Occurrence Matrices (GLCM). It will return a series of GLCM statistics
for each segment (\code{segs}) based on an underlying single-band raster image (\code{image}) in the form of a data.frame.
}
\details{
The underlying C++ code for computing GLCMs and their statistics was originally written by Joel Carlson for the
defunct [radiomics](https://github.com/cran/radiomics) library. It has been reused here with permission from the author.
}
\examples{
\dontrun{
# Generate raster segments
segs <- mcws(kootenayTrees, kootenayCHM, minHeight = 0.2, format = "raster")

# Get textural metrics for ortho's red band
tex <- glcm(segs, kootenayOrtho[[1]])
}

}
\references{
Parmar, C., Velazquez, E.R., Leijenaar, R., Jermoumi, M., Carvalho, S., Mak, R.H., Mitra, S., Shankar, B.U., Kikinis, R., Haibe-Kains, B. and Lambin, P. (2014).
\emph{Robust radiomics feature quantification using semiautomatic volumetric segmentation. PloS one, 9}(7)
}
