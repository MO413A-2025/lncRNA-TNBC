HTTPS: https://github.com/nf-core/differentialabundance.git
SSH: git@github.com:nf-core/differentialabundance.git
GitHub CLI: gh repo clone nf-core/differentialabundance

 nextflow run nf-core/differentialabundance \
     --input samplesheet.csv \
     --contrasts contrasts.csv \
     --matrix salmon.merged.gene_counts.tsv \
     --gtf Anotacao_com_lncRNA.gtf \
     --outdir <OUTDIR>  \
     -profile rnaseq,docker