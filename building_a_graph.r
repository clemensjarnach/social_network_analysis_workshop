library(igraph)

# Create a graph with 8 nodes and 5 random ties
set.seed(42)
g <- graph.empty(n = 8, directed = FALSE)
edges <- matrix(c(1,2, 1,3, 2,3, 4,5, 5,6, 6,7, 5,7, 5,8), ncol = 2, byrow = TRUE)
g <- add_edges(g, as.vector(t(edges)))
print(g)
print(edges)

# Compute and fix layout for plots 1-3
layout_fixed <- layout_with_fr(g)

# Plot 1: Only 3 nodes
g1 <- induced_subgraph(g, c(1, 2, 3))
layout_g1 <- layout_fixed[c(1, 2, 3), ]
plot(g1, main = "Plot 1: 3 Nodes", vertex.size = 30, edge.color = NA, layout = layout_g1)

# ... and with edges
plot(g1, main = "Plot 1: 3 Nodes", vertex.size = 30, layout = layout_g1)

# Plot 2: 3 nodes with ties
g1_directed <- as.directed(g1)
plot(g1_directed, main = "Plot 2: 3 Nodes with Ties", vertex.size = 30, layout = layout_g1)

# Plot 3: Two clusters
g3 <- g
plot(g3, main = "Plot 3: Two Clusters", vertex.size = 30, layout = layout_fixed)


# Plot 4: Add one edge between clusters
g4 <- add_edges(g, c(3, 4))
layout_g4 <- layout_with_fr(g4)
plot(g4, main = "Plot 4: Clusters Connected", vertex.size = 30, layout = layout_g4)


# Plot 5: Colored nodes
colors <- c("blue", "blue", "blue", "red", "red", "red", "red", "red")
layout_g5_colored <- layout_g5
plot(g4, main = "Plot 6: Colored Nodes", vertex.size = 30, vertex.color = colors,
     layout = layout_g4)

# Plot 6: Colored nodes, node size = degree centrality
deg <- degree(g4)
plot(g4, main = "Plot 6b: Colored Nodes (size = degree)", vertex.size = deg * 10,
     vertex.color = colors, layout = layout_g4)


#---------------------------------------------------

# Save all plots
png("plot1.png", width = 600, height = 600)
plot(g1, main = "Plot 1: 3 Nodes", vertex.size = 30, edge.color = NA, layout = layout_g1)
dev.off()

png("plot2.png", width = 600, height = 600)
plot(g1, main = "Plot 1: 3 Nodes", vertex.size = 30, layout = layout_g1)
dev.off()

png("plot3.png", width = 600, height = 600)
plot(g1_directed, main = "Plot 2: 3 Nodes with Ties", vertex.size = 30, layout = layout_g1)
dev.off()

png("plot4.png", width = 600, height = 600)
plot(g3, main = "Plot 3: Two Clusters", vertex.size = 30, layout = layout_fixed)
dev.off()

png("plot5.1.png", width = 600, height = 600)
plot(g4, main = "Plot 4: Clusters Connected", vertex.size = 30, layout = layout_g4)
dev.off()

png("plot5.2.png", width = 600, height = 600)
plot(g4, main = "Plot 6: Colored Nodes", vertex.size = 30, vertex.color = colors, 
     layout = layout_g4)
dev.off()

png("plot5.3.png", width = 600, height = 600)
plot(g4, main = "Plot 6b: Colored Nodes (size = degree)", vertex.size = deg * 10,
     vertex.color = colors, layout = layout_g4)
dev.off()
