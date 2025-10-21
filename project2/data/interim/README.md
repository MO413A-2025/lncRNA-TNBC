# Dados Intermediários

## Descrição
Este diretório contém dados intermediários gerados durante o processo de transformação, incluindo resultados de várias etapas de análise.

## Conteúdo Principal

### Dados de Expressão Processados
- **Matrizes de contagem**: Genes vs amostras
- **Dados normalizados**: CPM, TPM
- **Filtros aplicados**: Genes robustos (≥10 reads)

### Resultados de Análise
- **Saídas WGCNA**: Módulos e redes
- **Resultados DEG**: Expressão diferencial
- **Análise de Venn**: Sobreposição entre modalidades

## Estrutura Detalhada

### `/notebook_outputs/`
Resultados gerados pelos Jupyter notebooks:

#### `/venn/`
- **venn_counts_readable.csv**: Contagens de sobreposição
- **overlap_genes.csv**: Genes em comum
- **chip_robust_membership_in_rnaseq_lnc_robust.csv**: Membros robustos

#### `/wgcna/`
- **CytoscapeInput-*.tsv**: Arquivos para visualização
- **edges_summary.top5pct_robust.csv**: Resumo de arestas
- **hubs_in_network_check.csv**: Genes hubs identificados
- **modules/**: Dados por módulo (40 módulos)

### Arquivo Principal
- **With_lncRNA.tar.gz** (62GB): Dataset completo com anotações de lncRNAs

## Estatísticas
- **Total de genes**: 83,396
- **lncRNAs detectados**: 22,578
- **lncRNAs robustos**: 6,136
- **Módulos WGCNA**: 40
- **Arestas filtradas**: 2.6M (redução de 96%)

## Acesso
[Google Drive Link](links.md)

## Formatos
- **CSV/TSV**: Dados tabulares
- **RData**: Objetos R
- **PNG**: Visualizações
- **TAR.GZ**: Arquivos comprimidos
