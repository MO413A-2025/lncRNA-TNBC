# Dados Processados

## Descrição
Este diretório contém os dados finais, processados e prontos para uso, utilizados para publicação e análise final. Os arquivos estão organizados no Google Drive devido ao tamanho dos datasets.

## Acesso aos Dados

Todos os dados processados e outputs do notebook estão disponíveis em:

**[Google Drive - Dados Processados](https://drive.google.com/drive/folders/1D__OI_HEXhr-330dOhcjViwEjaiQ0tzl?usp=drive_link)**

Para mais detalhes sobre a estrutura e conteúdo, consulte o arquivo [links.md](links.md).

## Conteúdo Principal

### 1. Redes Filtradas (filters/)
Contém os arquivos de rede filtrados em formato TSV e pastas auxiliares:

**Arquivos de Rede (TSV):**
- **c_neighbors_of_GATA6_GATA6AS1_topK_5**: Vizinhança de GATA6/GATA6-AS1 com Top-K (K=5) - 4.895 nós, 10.473.102 arestas
- **d_padj_lt0p05_STRICT**: Subgrafo DEG estrito (padj < 0.05) - 1.611 nós, 623.328 arestas
- **e_chipseq_robust**: Genes detectados em ChIP-seq (robustos) - 119 nós, 3.287 arestas
- **f_known_GATA6_plus_lnc_neighbors**: Literatura/picos de ChIP + vizinhos lncRNA - 18.197 nós, 2.632.372 arestas
- **g_biological_combo_STRICT**: Recorte estrito combinado (interseção D ∩ F) - 21 nós, 109 arestas (rede final)

**Pastas Auxiliares:**
- **Cytoscape/**: Arquivos de rede no formato Cytoscape (.cys) para visualização direta
- **d_deg/**: Resultados de expressão diferencial relacionados ao filtro D
- **enrichment/**: Resultados de enriquecimento funcional das redes filtradas
- **inta_inputs/**: Arquivos de entrada para análise de interações RNA-RNA (IntaRNA/miRWalk)

**Formato:**
- Cada filtro possui arquivos `*_nodes.tsv` (atributos dos genes) e `*_edges.tsv` (conexões)
- Arquivos compatíveis com Cytoscape, R, Python e outras ferramentas de análise de redes

### 2. Resultados WGCNA (wgcna/)
- Matrizes de coexpressão ponderada
- Atribuições de módulos (23 módulos identificados)
- Genes hubs por módulo
- Correlações módulo-tratamento
- Métricas topológicas das redes

### 3. Outputs do Notebook (slide_helpers_and_summaries/)
- Tabelas de resumo estatístico
- Dados processados para visualizações
- Arquivos auxiliares para apresentações
- Resumos de análises

## Características dos Dados

### Qualidade
- **Controle de qualidade**: Aprovado (FastQC, Salmon)
- **Normalização**: TMM e RPKM aplicados
- **Validação estatística**: FDR < 0.05
- **Formato padronizado**: TSV, CSV, CYS

### Filtros Aplicados
- **Genes robustos**: ≥10 reads
- **Arestas significativas**: Top 5% ou critérios biológicos
- **Módulos validados**: 23 módulos WGCNA
- **Hubs confirmados**: Análise de conectividade (kME)

## Estatísticas Finais

### Rede Completa
- **Total de nós**: 18.493
- **lncRNAs**: 3.296
- **Genes codificantes**: 14.128
- **Módulos identificados**: 23

### Rede Filtrada Final (Filter_G)
- **Nós**: 21
- **Arestas**: 109
- **lncRNAs**: 1 (SWINGN)
- **Genes codificantes**: 20

## Estrutura dos Arquivos no Google Drive

```
Google Drive/
├── filters/
│   ├── c_neighbors_of_GATA6_GATA6AS1_topK_5_nodes.tsv
│   ├── c_neighbors_of_GATA6_GATA6AS1_topK_5_edges.tsv
│   ├── d_padj_lt0p05_STRICT_nodes.tsv
│   ├── d_padj_lt0p05_STRICT_edges.tsv
│   ├── e_chipseq_robust_nodes.tsv
│   ├── e_chipseq_robust_edges.tsv
│   ├── f_known_GATA6_plus_lnc_neighbors_nodes.tsv
│   ├── f_known_GATA6_plus_lnc_neighbors_edges.tsv
│   ├── g_biological_combo_STRICT_nodes.tsv
│   ├── g_biological_combo_STRICT_edges.tsv
│   ├── Cytoscape/          # Arquivos .cys
│   ├── d_deg/              # Resultados DEG
│   ├── enrichment/         # Enriquecimento funcional
│   └── inta_inputs/        # Inputs para análise RNA-RNA
├── wgcna/
│   ├── modules/
│   ├── hubs/
│   └── correlations/
└── slide_helpers_and_summaries/
    ├── tables/
    └── summaries/
```

## Formatos de Arquivo
- **TSV/CSV**: Dados tabulares (matrizes, tabelas)
- **CYS**: Arquivos de rede do Cytoscape
- **RData**: Objetos do workspace R
- **PNG/JPG**: Visualizações e gráficos
- **JSON**: Dados estruturados (quando aplicável)

## Uso dos Dados

### Para Análise no Cytoscape
1. Baixe os arquivos .cys do diretório `filters/`
2. Abra no Cytoscape (v3.10.2 ou superior)
3. Os arquivos já contêm layout e atributos configurados

### Para Análise Estatística
1. Utilize os arquivos TSV de nós e arestas
2. Importe em R ou Python para análises adicionais
3. Consulte os arquivos de resumo para estatísticas descritivas

### Para Visualizações
1. Utilize os arquivos de resumo em `slide_helpers_and_summaries/`
2. Os dados já estão formatados para geração de gráficos
3. Consulte os notebooks em `pipelines/notebooks/` para código de visualização
