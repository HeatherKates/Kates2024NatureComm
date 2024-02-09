---
output: github_document
---

## This repository includes files related to Nature Communications manuscript NCOMMS-23-04938A

## Input Data Files:

* TipStates.csv: The file of RNS presence/absence/? tip states. Tips are labeled by sequencing plate and well and not taxonomy, which can be linked to taxonomy using Supplementary Table 2

* Phylogeny.WithoutTaxonLabels.tree: The phylogeny shown in Figure 1. This is the Nitrogen-fixing clade phylogeny isnerted into the Rosid phylogeny as described in the manuscript. In this file, tips are labeled with sequencing plate and well for use with TipStates.csv

* Phylogeny.WithTaxonLabels.tree: The same phylogeny as Phylogeny.WithoutTaxonLabels.tree, but sequencing plate and well has been converted to taxonomy labels using Supplementary Table 2. This was used for figure creation in [move file to repo and reference here], 

## Step1_EstimateRates_and_SelectBestModel

This directory is used for performing rate estimation on various rate categories within their respective subdirectories and then selecting the best model within and across all tested rate categories. 

The results from this directory are the p values for the best models that are used in "Step2_AncestralStateReconstruction"

For detailed explanation of file structure and files in this subdir, see the README within the subdir.

## Step2_AncestralStateReconstruction

This directory is used for performing ancestral state reconstruction on the best model(s) within and across all tested rate categories. 

The results from this directory are RDATA files that include corHMM objects with ancestral states estimated on the input phylogeny. These are used as input for the scripts in Step3_Figures.

For detailed explanation of file structure and files in this subdir, see the README within the subdir.

## Step3_Figures

This directory includes R scripts used to create the figures in the paper and supplement. 
