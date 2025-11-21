# Dados Processados

## Descrição dos Dados
Este diretório contém os arquivos de dados finais e processados utilizados para publicação e análise final. Estes arquivos representam os datasets limpos, normalizados e prontos para uso.

## Acesso aos Dados
Devido às limitações de tamanho dos arquivos, os dados processados estão armazenados no Google Drive:

**Link do Google Drive:** [Dados Processados e Outputs do Notebook](https://drive.google.com/drive/folders/1D__OI_HEXhr-330dOhcjViwEjaiQ0tzl?usp=drive_link)

## Estrutura dos Arquivos no Google Drive

### `/filters/`
Contém os arquivos de rede filtrados gerados para cada critério de corte (A-G) em formato TSV:

**Arquivos de Rede Filtrada:**
- **c_neighbors_of_GATA6_GATA6AS1_topK_5_nodes.tsv** e **edges.tsv**: Subgrafo da vizinhança direta de GATA6 e GATA6-AS1 com Top-K (K=5)
- **d_padj_lt0p05_STRICT_nodes.tsv** e **d_padj_lt0p05_STRICT_edges.tsv**: Subgrafo DEG estrito (padj < 0.05)
- **e_chipseq_robust_nodes.tsv** e **e_chipseq_robust_edges.tsv**: Genes detectados em ChIP-seq (robustos, ≥10 reads)
- **f_known_GATA6_plus_lnc_neighbors_nodes.tsv** e **f_known_GATA6_plus_lnc_neighbors_edges.tsv**: Literatura/picos de ChIP (sementes de GATA6) + vizinhos lncRNA
- **g_biological_combo_STRICT_nodes.tsv** e **g_biological_combo_STRICT_edges.tsv**: Recorte estrito combinado (definição final - interseção D ∩ F)

**Pastas Auxiliares:**
- **Cytoscape/**: Arquivos de rede no formato Cytoscape (.cys) para visualização
- **d_deg/**: Resultados de expressão diferencial relacionados ao filtro D
- **enrichment/**: Resultados de enriquecimento funcional
- **inta_inputs/**: Arquivos de entrada para análise de interações RNA-RNA

**Formato dos Arquivos:**
- Arquivos de nós (nodes.tsv): Contêm atributos dos genes (ID, símbolo, biotipo, módulo, conectividade, etc.)
- Arquivos de arestas (edges.tsv): Contêm as conexões entre genes (source, target, peso, correlação, etc.)

### `/wgcna/`
Resultados da análise WGCNA:
- Matrizes de coexpressão
- Atribuições de módulos
- Genes hubs por módulo
- Correlações módulo-tratamento
- Arquivos de rede completos

### `/slide_helpers_and_summaries/`
Arquivos auxiliares e resumos:
- Tabelas de resumo estatístico
- Dados para visualizações
- Arquivos de apoio para apresentações

## Conteúdo Principal
- Matrizes de expressão finais normalizadas
- Resultados de expressão diferencial (DEG)
- Redes de co-expressão filtradas (7 filtros diferentes)
- Anotações integradas de genes e lncRNAs
- Resultados de enriquecimento funcional
- Predições de interações RNA-RNA

## Formatos de Arquivo
- **CSV/TSV**: Dados tabulares (matrizes, tabelas de resultados)
- **CYS**: Arquivos de rede do Cytoscape
- **RData**: Objetos do workspace R
- **JSON**: Dados estruturados
- **PNG/JPG**: Visualizações e gráficos

## Controle de Qualidade
Todos os arquivos neste diretório passaram por:
- Verificações de controle de qualidade
- Procedimentos de normalização (TMM, RPKM)
- Validação estatística (FDR < 0.05)
- Padronização de formato
- Filtragem biológica e estatística