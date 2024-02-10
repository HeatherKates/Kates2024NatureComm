---
output: github_document
---

## This repository includes files related to Nature Communications manuscript NCOMMS-23-04938A

## Input Data Files:

* "TipStates.csv": The file of RNS presence/absence/? tip states. Tips are labeled by sequencing plate and well and not taxonomy, which can be linked to taxonomy using Supplementary Table 2

* "Phylogeny.WithoutTaxonLabels.tree": The phylogeny shown in Figure 1. This is the Nitrogen-fixing clade phylogeny isnerted into the Rosid phylogeny as described in the manuscript. In this file, tips are labeled with sequencing plate and well for use with TipStates.csv

* "Phylogeny.WithTaxonLabels.tree": The same phylogeny as Phylogeny.WithoutTaxonLabels.tree, but sequencing plate and well has been converted to taxonomy labels using Supplementary Table 2. This was used for figure creation in "Step3_Figures"

## Step1_EstimateRates_and_SelectBestModel

* This directory is used for performing rate estimation on various rate categories within their respective subdirectories and then selecting the best model within and across all tested rate categories. 

* The results from this directory are the p values for the best models that are used in "Step2_AncestralStateReconstruction"

* For detailed explanation of file structure and files in this subdir, see the README within the subdir.

* These subdirectories include the following models to test alternative hypotheses:
    "Two_States_Custom": Even at the upper limit of the rate of loss tested        (when loss of nodulation is over 60 times more likely than gain), a            marginal character state reconstruction estimates that the ancestor of the     NFC lacks RNS (Supplementary Fig. 8).
    
    "Three_Precursor_AncestralAbsence": An analysis in which the ancestor of the NFC is fixed as non-nodulating for direct comparison with the alternative below.
    
    "Three_Precursor_AncestralPresence": An analysis in which the ancestor of the NFC is fixed as nodulating, thus requiring the gain proposed by the single-gain multiple-loss hypothesis34, shows that an extremely high rate of loss is required to accommodate this ancestral state (Supplementary Fig. 9); this high-loss rate model is a dramatically poorer fit to the data than the best model (Supplementary Table 2B). 

## Step2_AncestralStateReconstruction

* This directory is used for performing ancestral state reconstruction on the best model(s) within and across all tested rate categories. 

* The results from this directory are RDATA files that include corHMM objects with ancestral states estimated on the input phylogeny. These are used as input for the scripts in Step3_Figures.

* For detailed explanation of file structure and files in this subdir, see the README within the subdir.

## Step3_Figures

* This directory includes R scripts used to create the figures in the paper and supplement. 

## Compare_Likelihood_Ancestral_PresvsAbs

This directory includes files used for the methods section "Comparing the likelihood of ancestral presence vs. absence". 

We tested evolutionary models with a range of gain and loss rates to see under which relative rates the ancestor of the NFC is more likely to be nodulating than non-nodulating, consistent with the single-gain multiple-loss hypothesis proposed to explain gene presence/absence34. Even at the upper limit of the rate of loss tested (when loss of nodulation is over 60 times more likely than gain), a marginal character state reconstruction estimates that the ancestor of the NFC lacks RNS (Supplementary Fig. 8). 

## Dentist 

For our best-fitting model, we estimated uncertainty for all parameter estimates by sampling points around Δ2 from the maximum likelihood estimates using the R package dentist (https://github.com/bomeara/dentist; Supplementary Table 3)

## Alternative_Backbone_Topology

These are scripts used to test the effect of using an alternative topology on ancestral character state reconstruction. We used the NFC backbone resolved by Zanne et al. (2014)30 following14 and the more recent Leguminosae backbone phylogeny resolved by Koenen et al. (2020)25 to construct a supertree from our independently analyzed subclades (relationships among families in Rosales remained the same as in our primary analysis) (Supplementary Note 4) and performed hidden rate modeling and ancestral character state reconstruction following the same steps described for the main topology.

