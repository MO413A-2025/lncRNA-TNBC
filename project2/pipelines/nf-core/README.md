HTTPS: https://github.com/nf-core/rnaseq.git
SSH: git@github.com:nf-core/rnaseq.git
GitHub CLI: git@github.com:nf-core/rnaseq.git

nextflow run nf-core/rnaseq \
    --input samplesheet.csv \
    --outdir With_lncRNA \
    --gtf Anotacao_com_lncRNA.gtf \
    --fasta GRCh38_primary_assembly.genome.fa \
    -profile docker