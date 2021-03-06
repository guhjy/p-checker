# TIVA = Test of insufficient variance - see https://replicationindex.wordpress.com/2014/12/30/the-test-of-insufficient-variance-tiva-a-new-tool-for-the-detection-of-questionable-research-practices/
# code adapted from Moritz Heene
TIVA <- function (p.values) {
  p.values <- clamp(p.values, MIN=.00001, MAX=1-.00001)	# prevent infinite z-values
  z.values  <- qnorm(p.values, lower.tail = FALSE)
  var.z  <- var(z.values)
  df <- length(p.values)-1
  chi.square  <- df*var.z
  chi.p  <- pchisq(chi.square, df=df, lower.tail = TRUE)
  data.frame(var.z=var.z, chi2=chi.square, df=df, p.value=chi.p)
}