library(igraph)

# ============================================================
# Layout Algorithm Comparison
# Demonstrates how different layout algorithms visualise
# the same network in very different ways.
# ============================================================

# --- 1. Create a small-world network (Watts-Strogatz model) ---
# 100 nodes, each initially connected to 3 nearest neighbours,
# edges rewired with probability 0.05 to introduce shortcuts.
set.seed(42)
g <- sample_smallworld(dim = 1, size = 200, nei = 3, p = 0.03)

cat("Network summary:\n")
print(g)
cat("Nodes:", vcount(g), "\n")
cat("Edges:", ecount(g), "\n")
cat("Average path length:", mean_distance(g), "\n")
cat("Clustering coefficient:", transitivity(g, type = "average"), "\n\n")

# --- 2. Common visual style ---
node_col  <- "#4682B4"   # steel blue
edge_col  <- "#AAAAAA"
node_size <- 5
edge_width <- 0.6

# --- 3. Compute all layouts once (so comparisons are fair) ---
layout_fr      <- layout_with_fr(g)           # Fruchterman-Reingold
layout_kk      <- layout_with_kk(g)           # Kamada-Kawai
layout_drl     <- layout_with_drl(g)          # DrL (large graphs)
layout_lgl     <- layout_with_lgl(g)          # Large Graph Layout
layout_circle  <- layout_in_circle(g)         # Circle
layout_random  <- layout_randomly(g)          # Random (baseline)

# --- 4. Plot all layouts in one figure ---
par(mfrow = c(2, 3), mar = c(1, 1, 2.5, 1))

plot(g,
     layout        = layout_fr,
     main          = "Fruchterman-Reingold",
     vertex.size   = node_size,
     vertex.color  = node_col,
     vertex.label  = NA,
     edge.color    = edge_col,
     edge.width    = edge_width)

plot(g,
     layout        = layout_kk,
     main          = "Kamada-Kawai",
     vertex.size   = node_size,
     vertex.color  = node_col,
     vertex.label  = NA,
     edge.color    = edge_col,
     edge.width    = edge_width)

plot(g,
     layout        = layout_drl,
     main          = "DrL",
     vertex.size   = node_size,
     vertex.color  = node_col,
     vertex.label  = NA,
     edge.color    = edge_col,
     edge.width    = edge_width)

plot(g,
     layout        = layout_lgl,
     main          = "Large Graph Layout (LGL)",
     vertex.size   = node_size,
     vertex.color  = node_col,
     vertex.label  = NA,
     edge.color    = edge_col,
     edge.width    = edge_width)

plot(g,
     layout        = layout_circle,
     main          = "Circle",
     vertex.size   = node_size,
     vertex.color  = node_col,
     vertex.label  = NA,
     edge.color    = edge_col,
     edge.width    = edge_width)

plot(g,
     layout        = layout_random,
     main          = "Random (baseline)",
     vertex.size   = node_size,
     vertex.color  = node_col,
     vertex.label  = NA,
     edge.color    = edge_col,
     edge.width    = edge_width)

# Reset plotting parameters
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1)


# ============================================================
# Fruchterman-Reingold Parameter Tuning
# Same algorithm, same network — different parameter settings.
#
# Key parameters:
#   niter      - number of iterations (default 500).
#                More iterations = layout has more time to settle.
#   start.temp - starting "temperature", i.e. maximum displacement
#                allowed per iteration (default = sqrt(node count)).
#               High temperature → nodes can move large distances per iteration → algorithm explores the space broadly, prioritising global structure (which nodes cluster far from which) over local refinement.
#               Low temperature → nodes move in tiny steps → algorithm gets trapped near starting positions, only fine-tuning within a small neighbourhood.

# ============================================================

?layout_with_fr()

# --- Compute six FR variants ---

# 1. Default reference
fr_default   <- layout_with_fr(g)

# 2. Very few iterations — layout barely had time to settle
fr_few_iter  <- layout_with_fr(g, niter = 30)

# 3. Many iterations — layout runs much longer, more refined
fr_many_iter <- layout_with_fr(g, niter = 5000)

# 4. High starting temperature — nodes are pushed far apart,
#    long-range structure dominates
fr_high_temp <- layout_with_fr(g, start.temp = vcount(g) * 2)

# 5. Low starting temperature — nodes can barely move,
#    result stays close to random starting positions
fr_low_temp  <- layout_with_fr(g, start.temp = 0.5)

# 6. Edge weights = 1 / path distance between endpoints,
#    so nearby (short-path) neighbours attract more strongly
path_dist    <- distances(g)
edge_list    <- as_edgelist(g, names = FALSE)
edge_weights <- 1 / path_dist[edge_list]   # element-wise lookup

fr_weighted  <- layout_with_fr(g, weights = edge_weights)

# --- Plot all six variants ---
par(mfrow = c(2, 3), mar = c(1, 1, 3, 1))

plot(g, layout = fr_default,
     main         = "Default\n(niter=500, default temp)",
     vertex.size  = node_size, vertex.color = node_col,
     vertex.label = NA, edge.color = edge_col, edge.width = edge_width)

plot(g, layout = fr_few_iter,
     main         = "Few iterations\n(niter=30)",
     vertex.size  = node_size, vertex.color = node_col,
     vertex.label = NA, edge.color = edge_col, edge.width = edge_width)

plot(g, layout = fr_many_iter,
     main         = "Many iterations\n(niter=5000)",
     vertex.size  = node_size, vertex.color = node_col,
     vertex.label = NA, edge.color = edge_col, edge.width = edge_width)

plot(g, layout = fr_high_temp,
     main         = "High temperature\n(start.temp = 2 * N)",
     vertex.size  = node_size, vertex.color = node_col,
     vertex.label = NA, edge.color = edge_col, edge.width = edge_width)

plot(g, layout = fr_low_temp,
     main         = "Low temperature\n(start.temp = 0.5)",
     vertex.size  = node_size, vertex.color = node_col,
     vertex.label = NA, edge.color = edge_col, edge.width = edge_width)

plot(g, layout = fr_weighted,
     main         = "Weighted edges\n(weight = 1 / path distance)",
     vertex.size  = node_size, vertex.color = node_col,
     vertex.label = NA, edge.color = edge_col, edge.width = edge_width)

par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1)


