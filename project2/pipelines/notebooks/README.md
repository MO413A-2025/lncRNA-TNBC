# Jupyter Notebooks - Análise e Visualização de Dados

## Descrição
Este diretório contém os Jupyter notebooks utilizados para análise exploratória de dados, visualização e integração de resultados.

## Notebooks Disponíveis

### DataVizinHealth.ipynb
**Objetivo**: Análise exploratória principal e visualização de dados
**Conteúdo**:
- Análise de qualidade dos dados
- Visualização de distribuições de expressão
- Análise de sobreposição entre RNA-seq e ChIP-seq
- Geração de gráficos para apresentação

## Estrutura do Notebook

### 1. Importação de Bibliotecas
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px
from matplotlib_venn import venn2, venn3
```

### 2. Carregamento de Dados
- Matriz de contagem de expressão
- Metadados das amostras
- Resultados de WGCNA
- Dados de ChIP-seq

### 3. Análises Realizadas
- **Controle de qualidade**: Distribuição de reads por amostra
- **Detecção de genes**: Genes detectados por biotipo
- **Análise de sobreposição**: Venn diagrams RNA-seq vs ChIP-seq
- **Visualização de módulos**: Tamanhos e composição de módulos WGCNA

### 4. Visualizações Geradas
- Gráficos de distribuição de expressão
- Venn diagrams de sobreposição
- Gráficos de tamanho de módulos
- Heatmaps de correlação

## Arquivos de Entrada
- `data/processed/count_matrix.csv`
- `data/processed/sample_metadata.csv`
- `data/interim/notebook_outputs/wgcna/`

## Arquivos de Saída
- `assets/images/lncrna/`
- `assets/images/venn/`
- `assets/images/wgcna/`

## Execução
```bash
# Ativar ambiente Python
conda activate lncrna-tnbc

# Executar notebook
jupyter notebook DataVizinHealth.ipynb
```

## Dependências
- pandas >= 1.5.0
- numpy >= 1.21.0
- matplotlib >= 3.5.0
- seaborn >= 0.11.0
- plotly >= 5.0.0
- matplotlib-venn >= 0.11.0
