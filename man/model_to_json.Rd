% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model-persistence.R
\name{model_to_json}
\alias{model_to_json}
\alias{model_from_json}
\title{Model configuration as JSON}
\usage{
model_to_json(object)

model_from_json(json, custom_objects = NULL)
}
\arguments{
\item{object}{Model object to save}

\item{json}{JSON with model configuration}

\item{custom_objects}{Optional named list mapping names to custom classes or
functions to be considered during deserialization.}
}
\description{
Save and re-load models configurations as JSON. Note that the representation
does not include the weights, only the architecture.
}
\seealso{
Other model persistence: \code{\link{get_weights}},
  \code{\link{model_to_yaml}},
  \code{\link{save_model_hdf5}},
  \code{\link{save_model_tf}},
  \code{\link{save_model_weights_hdf5}},
  \code{\link{serialize_model}}
}
\concept{model persistence}
