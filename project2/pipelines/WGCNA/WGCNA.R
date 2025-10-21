# WGCNA Analysis Script - Revised and Corrected
# This script performs a Weighted Gene Co-expression Network Analysis (WGCNA).
# It has been updated to handle common data cleaning issues like duplicate gene names.

# ======================================================================================
# Section 1: Load Libraries
# ======================================================================================
# --- Load all required packages at the beginning ---
# Note: Package installation should be done once in the console, not in the script.
# Example: install.packages("tidyverse"), BiocManager::install("WGCNA")

library(tidyverse)    # For data manipulation (dplyr, tibble, etc.)
library(WGCNA)        # Main package for WGCNA
library(flashClust)   # For faster hierarchical clustering
library(doParallel)   # For multi-threading support
library(fastDummies)  # For creating dummy variables from trait data

# ======================================================================================
# Section 2: WGCNA Configuration and Options
# ======================================================================================
# --- Set global options for the analysis ---

# Allow multi-threading for WGCNA calculations. Adjust the number of threads as needed.
allowWGCNAThreads()

# This setting is crucial for WGCNA to work correctly with character data.
options(stringsAsFactors = FALSE)

# ======================================================================================
# Section 3: Data Loading, Cleaning, and Pre-processing
# ======================================================================================
# --- Load expression data, handle duplicates, and format for WGCNA ---

# Read, aggregate, and format the data in one pipeline
SAbatch <- read.table("salmon.merged.gene_counts.tsv",
		                            header = TRUE,
					                          sep = "\t",
					                          stringsAsFactors = FALSE) %>%
  # Group by gene name and sum numeric columns to handle duplicates
  group_by(gene_name) %>%
    summarise(across(where(is.numeric), sum), .groups = 'drop') %>%
      # Set the unique gene names as row names, which is required format
      column_to_rownames(var = "gene_name")

# The data needs to be transposed for WGCNA: genes as columns, samples as rows.
SAdatExpr0 <- as.data.frame(t(SAbatch))

# --- Check data for excessive missing values and identify outlier samples ---
gsg <- goodSamplesGenes(SAdatExpr0, verbose = 5)

if (!gsg$allOK) {
	  # Optionally, print the gene and sample names that were removed:
	  if (sum(!gsg$goodGenes) > 0)
		      printFlush(paste("Removing genes:", paste(names(SAdatExpr0)[!gsg$goodGenes], collapse = ", ")))
  if (sum(!gsg$goodSamples) > 0)
	      printFlush(paste("Removing samples:", paste(rownames(SAdatExpr0)[!gsg$goodSamples], collapse = ", ")))
    # Remove the offending genes and samples from the data:
    SAdatExpr0 <- SAdatExpr0[gsg$goodSamples, gsg$goodGenes]
}

# --- Visualize sample clustering to detect outliers ---
sampleTree <- hclust(dist(SAdatExpr0), method = "average")

# Save the dendrogram as a PNG file
png("sample_dendrogram_outlier_check.png", width = 12, height = 9, units = "in", res = 300)
par(cex = 0.6, mar = c(0, 4, 2, 0))
plot(sampleTree, main = "Sample clustering to detect outliers", sub = "", xlab = "",
          cex.lab = 1.5, cex.axis = 1.5, cex.main = 2)
# Add a line to show a potential cut-off for outliers
# Adjust the cutHeight 'h' value based on your dendrogram
abline(h = 140, col = "red")
dev.off() # Close the PNG device

# NOTE: The original script had logic to remove outliers based on a static cut.
# This is often better done interactively. For now, we will proceed with all samples.
# To re-enable outlier removal, uncomment the block below and adjust cutHeight.
# clust = cutreeStatic(sampleTree, cutHeight = 140, minSize = 10)
# keepSamples = (clust==1)
# datExpr = SAdatExpr0[keepSamples, ]

datExpr <- SAdatExpr0 # Use all samples that passed the goodSamplesGenes check

# ======================================================================================
# Section 4: Trait Data Loading and Processing
# ======================================================================================
# --- Load clinical trait data and match it to the expression data ---

traitData <- read.csv("table_treatment.csv", stringsAsFactors = FALSE)

# Match the samples in datExpr with the samples in traitData
Samples <- rownames(datExpr)
traitRows <- match(Samples, traitData$rownames)
datTraits <- traitData[traitRows, , drop = FALSE]
rownames(datTraits) <- datTraits$rownames

# Convert categorical treatment column into numeric dummy variables
datTraits_dummy <- dummy_cols(datTraits,
			                                    select_columns = "treatment",
							                                  remove_first_dummy = FALSE,
							                                  remove_selected_columns = TRUE)

# Clean up column and row names
datTraits_final <- datTraits_dummy[, !(names(datTraits_dummy) %in% c("rownames"))]
rownames(datTraits_final) <- rownames(datTraits)

# --- Visualize the relationship between the sample dendrogram and traits ---
sampleTree2 <- hclust(dist(datExpr), method = "average")
traitColors <- numbers2colors(datTraits_final, signed = FALSE)

png("sample_dendrogram_with_traits.png", width = 12, height = 9, units = "in", res = 300)
plotDendroAndColors(sampleTree2, traitColors,
		                        groupLabels = names(datTraits_final),
					                    main = "Sample dendrogram and trait heatmap")
dev.off()

# ======================================================================================
# Section 5: Network Construction and Module Detection
# ======================================================================================
# --- Determine the soft-thresholding power and build the co-expression network ---

# Choose a set of soft-thresholding powers
powers <- c(c(1:10), seq(from = 12, to = 20, by = 2))
sft <- pickSoftThreshold(datExpr, networkType = "unsigned", powerVector = powers, verbose = 5)

# Plot the results to help choose the power
png("soft_thresholding_power_selection.png", width = 12, height = 6, units = "in", res = 300)
par(mfrow = c(1, 2))
cex1 = 0.9
# Scale-free topology fit index
plot(sft$fitIndices[, 1], -sign(sft$fitIndices[, 3]) * sft$fitIndices[, 2],
          xlab = "Soft Threshold (power)", ylab = "Scale Free Topology Model Fit, signed R^2", type = "n",
	       main = "Scale independence")
text(sft$fitIndices[, 1], -sign(sft$fitIndices[, 3]) * sft$fitIndices[, 2],
          labels = powers, cex = cex1, col = "red")
abline(h = 0.80, col = "red") # This line corresponds to an R^2 cut-off of 0.80
# Mean connectivity
plot(sft$fitIndices[, 1], sft$fitIndices[, 5],
          xlab = "Soft Threshold (power)", ylab = "Mean Connectivity", type = "n",
	       main = "Mean connectivity")
text(sft$fitIndices[, 1], sft$fitIndices[, 5], labels = powers, cex = cex1, col = "red")
dev.off()

# --- CHOOSE A SOFT POWER based on the plot (e.g., the first power to reach R^2 > 0.8) ---
softPower <- 10 # <<<<<<<<<<<<<<<<< CHANGE THIS VALUE BASED ON YOUR PLOT

# --- Construct the network and identify modules ---
adjacency <- adjacency(datExpr, power = softPower, type = "unsigned", corFnc = "bicor")
TOM <- TOMsimilarity(adjacency)
dissTOM <- 1 - TOM

# --- Hierarchical clustering of genes ---
geneTree <- flashClust(as.dist(dissTOM), method = "average")

# --- Module identification using dynamic tree cut ---
minModuleSize <- 30
dynamicMods <- cutreeDynamic(dendro = geneTree, distM = dissTOM, deepSplit = 2,
			                                pamRespectsDendro = FALSE, minClusterSize = minModuleSize)
dynamicColors <- labels2colors(dynamicMods)

# --- Merge similar modules ---
MEDissThres <- 0.25 # Modules with eigengene correlation > 0.75 will be merged
merge <- mergeCloseModules(datExpr, dynamicColors, cutHeight = MEDissThres, verbose = 3)
mergedColors <- merge$colors
mergedMEs <- merge$newMEs

# --- Plot the gene dendrogram with original and merged module colors ---
png("gene_dendrogram_with_modules.png", width = 12, height = 9, units = "in", res = 300)
plotDendroAndColors(geneTree, cbind(dynamicColors, mergedColors),
		                        c("Dynamic Tree Cut", "Merged dynamic"),
					                    dendroLabels = FALSE, hang = 0.03,
					                    addGuide = TRUE, guideHang = 0.05)
dev.off()

# --- Final module assignments ---
moduleColors <- mergedColors
MEs <- mergedMEs

# ======================================================================================
# Section 6: Relate Modules to Traits and Export Results
# ======================================================================================
# --- Correlate module eigengenes with trait data ---
nGenes <- ncol(datExpr)
nSamples <- nrow(datExpr)
moduleTraitCor <- cor(MEs, datTraits_final, use = "p")
moduleTraitPvalue <- corPvalueStudent(moduleTraitCor, nSamples)

# --- Visualize the module-trait relationships in a heatmap ---
pdf(file = "Module_Trait_Heatmap.pdf", width = 10, height = 10)
textMatrix <- paste(signif(moduleTraitCor, 2), "\n(", signif(moduleTraitPvalue, 1), ")", sep = "")
dim(textMatrix) <- dim(moduleTraitCor)
par(mar = c(6, 8.5, 3, 3))
labeledHeatmap(Matrix = moduleTraitCor,
	                      xLabels = names(datTraits_final),
			                     yLabels = names(MEs),
			                     ySymbols = names(MEs),
					                    colorLabels = FALSE,
					                    colors = blueWhiteRed(50),
							                   textMatrix = textMatrix,
							                   setStdMargins = FALSE,
									                  cex.text = 0.5,
									                  zlim = c(-1, 1),
											                 main = "Module-trait relationships")
dev.off()

# --- Export network to Cytoscape for visualization ---
probes <- names(datExpr)
inModule <- is.finite(match(moduleColors, unique(moduleColors[moduleColors != "grey"])))
modProbes <- probes[inModule]
modTOM <- dissTOM[inModule, inModule]
# Set diagonal to 0 for cleaner export
diag(modTOM) <- 0

cyt <- exportNetworkToCytoscape(1 - modTOM, # Use similarity (1-diss) for Cytoscape
				                                edgeFile = "CytoscapeInput-edges.txt",
								                                nodeFile = "CytoscapeInput-nodes.txt",
								                                weighted = TRUE,
												                                threshold = 0.02, # Export edges with weight > 0.02
												                                nodeNames = modProbes,
																                                nodeAttr = moduleColors[inModule])

# --- Export list of genes and their module assignments ---
geneModuleMembership <- data.frame(Gene = probes, Module = moduleColors)
write.csv(geneModuleMembership, "gene_module_membership.csv", row.names = FALSE)

# --- Identify and export top hub genes for each module ---
topHubs <- chooseTopHubInEachModule(datExpr, colorh = moduleColors, omitColors = "grey", power = softPower)
write.csv(topHubs, file = "top_hub_genes_per_module.csv", row.names = FALSE)

print("WGCNA analysis complete. Check the output files.")

