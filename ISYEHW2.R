
age <- c(21, 22, 26, 27, 37, 41, 44, 46, 51, 54, 55, 55, 58, 59, 61, 61, 63, 64)# Create a vector of age data
par(mar = c(2, 2, 2, 2))  # Adjust the values as needed

# Plot an equal-width histogram with width 10
hist(age, breaks = seq(20, 70, by = 10), main = "Equal-Width Histogram of Age", xlab = "Age", ylab = "Frequency")

# Set a random seed for reproducibility
set.seed(123)

# Sample size
sample_size <- 5

# Simple Random Sampling Without Replacement (SRSWOR)
srs_wor_sample <- sample(age, size = sample_size, replace = FALSE)
cat("SRSWOR Sample:", srs_wor_sample, "\n")

# Simple Random Sampling With Replacement (SRSWR)
srs_wr_sample <- sample(age, size = sample_size, replace = TRUE)
cat("SRSWR Sample:", srs_wr_sample, "\n")

# Cluster Sampling
# Create clusters based on age groups
age_clusters <- cut(age, breaks = c(0, 40, 55, 60, Inf), labels = c("Age <= 40", "40 < Age <= 55", "55 < Age <= 60", "Age > 60"))
# Randomly select 2 clusters
selected_clusters <- sample(unique(age_clusters), size = 2)
cluster_sample <- sample(age[age_clusters %in% selected_clusters], size = sample_size, replace = TRUE)
cat("Cluster Sampling Sample:", cluster_sample, "\n")

# Stratified Sampling
# Create strata based on age groups
strata <- cut(age, breaks = c(0, 30, 60, Inf), labels = c("Youth", "Middle-Aged", "Senior"))
# Stratified sampling, selecting 1 sample from each stratum
stratified_sample <- unlist(lapply(unique(strata), function(stratum) {
  sample(age[strata == stratum], size = 1, replace = TRUE)
}))
cat("Stratified Sampling Sample:", stratified_sample, "\n")
