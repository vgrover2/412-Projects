# Similarity matrix
similarity_matrix <- matrix(c(1.00, 0.10, 0.41, 0.55, 0.35,
                              0.10, 1.00, 0.64, 0.47, 0.98,
                              0.41, 0.64, 1.00, 0.44, 0.85,
                              0.55, 0.47, 0.44, 1.00, 0.76,
                              0.35, 0.98, 0.85, 0.76, 1.00), 
                            nrow = 5, byrow = TRUE)

distance_matrix <- 1 - similarity_matrix

# Diagonal is 0 for distance
diag(distance_matrix) <- 0

# Single linkage
hc_single <- hclust(as.dist(distance_matrix), method = "single")
# Complete linkage
hc_complete <- hclust(as.dist(distance_matrix), method = "complete")

# Dendrograms
plot(hc_single, main = "Single Linkage Dendrogram", sub = "", xlab = "")
plot(hc_complete, main = "Complete Linkage Dendrogram", sub = "", xlab = "")
