Sys.setenv(TF_CPP_MIN_LOG_LEVEL = 1)

skip_if_no_keras <- function(required_version = NULL) {
  if (!is_keras_available(required_version))
    skip("required keras version not available for testing")
}


test_succeeds <- function(desc, expr, required_version = NULL) {
  
  py_capture_output <- NULL
  if (reticulate::py_module_available("IPython")) {
    IPython <- reticulate::import("IPython")
    py_capture_output <- IPython$utils$capture$capture_output
  }
  
  invisible(
    capture.output({
      test_that(desc, {
        skip_if_no_keras(required_version)
        with(py_capture_output(), {
          expect_error(force(expr), NA)
        })
      })
    })
  )
}

test_call_succeeds <- function(call_name, expr, required_version = NULL) {
  test_succeeds(paste(call_name, "call succeeds"), expr, required_version)
}

is_backend <- function(name) {
  is_keras_available() && identical(backend()$backend(), name)
}

skip_if_cntk <- function() {
  if (is_backend("cntk"))
    skip("Test not run for CNTK backend")
}

skip_if_theano <- function() {
  if (is_backend("theano"))
    skip("Test not run for theano backend")
}

skip_if_tensorflow_implementation <- function() {
  if (keras:::is_tensorflow_implementation())
    skip("Test not run for TensorFlow implementation")
}

define_model <- function() {
  model <- keras_model_sequential() 
  model %>%
    layer_dense(32, input_shape = 784, kernel_initializer = initializer_ones()) %>%
    layer_activation('relu') %>%
    layer_dense(10) %>%
    layer_activation('softmax')
  model
}

define_and_compile_model <- function() {
  model <- define_model()
  model %>% 
    compile(
      loss='binary_crossentropy',
      optimizer = optimizer_sgd(),
      metrics='accuracy'
    )
  model
}

random_array <- function(dim) {
  array(runif(prod(dim)), dim = dim)
}



