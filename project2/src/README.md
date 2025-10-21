# Código Fonte - Projeto lncRNA-TNBC

## Descrição
Este diretório contém o código fonte implementado para o projeto de integração de lncRNAs em redes de co-expressão para o estudo de vias reguladas no câncer de mama triplo-negativo (TNBC).

## Estrutura do Código
O código está organizado em diferentes linguagens e ferramentas conforme a necessidade de cada etapa da análise:

### Análises em R
- **WGCNA.R**: Script principal para análise de redes de co-expressão
- **DEG_analysis.R**: Análise de expressão diferencial
- **Network_analysis.R**: Análise de redes e identificação de hubs

### Análises em Python
- **DataVizinHealth.ipynb**: Jupyter notebook para análise exploratória e visualização
- **Pré-processamento de dados**: Scripts para pré-processamento de dados
- **Visualização**: Scripts para geração de gráficos e visualizações

### Workflows
- **Pipelines nf-core**: Pipelines de bioinformática para processamento de RNA-seq
- **Workflows AGAT**: Workflows para integração de anotações
- **Workflows Cytoscape**: Workflows para análise de redes

## Instalação

### Pré-requisitos
- R (versão 4.3.0 ou superior)
- Python (versão 3.9 ou superior)
- Jupyter Notebook
- Cytoscape (versão 3.10.2 ou superior)

### Instalação de Dependências R
```r
# Instalar pacotes necessários
install.packages(c("WGCNA", "DESeq2", "ggplot2", "dplyr", "readr"))
install.packages("BiocManager")
BiocManager::install(c("edgeR", "limma", "clusterProfiler"))
```

### Instalação de Dependências Python
```bash
# Instalar pacotes Python
pip install pandas numpy matplotlib seaborn plotly jupyter
pip install scipy scikit-learn
```

### Instalação de Ferramentas de Bioinformática
```bash
# nf-core (requer Nextflow)
curl -s https://get.nextflow.io | bash
pip install nf-core

# AGAT
conda install -c bioconda agat
```

## Execução

### 1. Análise de Expressão Diferencial
```bash
# Executar pipeline nf-core para DEG
nextflow run nf-core/differentialabundance \
  --input samplesheet.csv \
  --outdir results/ \
  --genome hg38
```

### 2. Análise WGCNA
```r
# Executar script R
Rscript WGCNA/WGCNA.R
```

### 3. Análise Exploratória
```bash
# Executar Jupyter notebook
jupyter notebook pipelines/notebooks/DataVizinHealth.ipynb
```

### 4. Visualização de Redes
```bash
# Abrir Cytoscape e carregar arquivos de rede
# Arquivos disponíveis em: data/interim/notebook_outputs/wgcna/
```

## Arquivos de Entrada

### Dados de Expressão
- **Matriz de contagem**: `data/processed/count_matrix.csv`
- **Metadados**: `data/processed/sample_metadata.csv`
- **Anotações gênicas**: `data/processed/gene_annotations.csv`

### Configurações
- **Planilha de amostras**: `pipelines/nf-core/samplesheet.csv`
- **Tabela de tratamentos**: `pipelines/WGCNA/table_treatment.csv`

## Arquivos de Saída

### Resultados WGCNA
- **Arquivos de rede**: `data/interim/notebook_outputs/wgcna/`
- **Atribuições de módulos**: `modules_sizes_lnc_top5pct_robust.csv`
- **Genes hubs**: `hubs_in_network_check.csv`

### Visualizações
- **Gráficos de rede**: `assets/images/wgcna/`
- **Gráficos de expressão**: `assets/images/lncrna/`
- **Diagramas de Venn**: `assets/images/venn/`

## Configuração de Parâmetros

### WGCNA
- **Potência do threshold suave**: 9
- **Tamanho mínimo do módulo**: 30
- **Altura de corte para fusão**: 0.25

### Expressão Diferencial
- **Threshold FDR**: 0.05
- **Threshold Log2FC**: 1.0
- **Contagem mínima**: 10

## Solução de Problemas

### Problemas Comuns
1. **Memória insuficiente**: Ajustar parâmetros de WGCNA
2. **Arquivos muito grandes**: Usar filtragem de arestas
3. **Dependências**: Verificar versões compatíveis

### Logs e Depuração
- **Logs nf-core**: `results/logs/`
- **Logs R**: Saída do console
- **Logs Jupyter**: Saída das células

## Contato
Para dúvidas sobre o código, entre em contato com a equipe do projeto.
