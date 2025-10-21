# Projeto Integração de lncRNAs em Redes de Coexpressão para o Estudo de Vias Reguladas no Câncer de Mama Triplo-Negativo (TNBC)
# Project Integration of lncRNAs into Co-expression Networks to Study Regulatory Pathways in Triple-Negative Breast Cancer (TNBC)

# Descrição Resumida do Projeto

Este projeto investiga o papel de RNAs longos não codificantes (lncRNAs) no câncer de mama triplo-negativo (TNBC) a partir de dados de RNA-seq (GSE261989) e ChIP-seq (GSE261988). O objetivo é integrar lncRNAs em análises de expressão diferencial, redes de coexpressão baseadas em WGCNA e enriquecimento de vias biológicas, a fim de identificar hubs regulatórios e módulos gênicos associados a tratamentos experimentais (ativação do receptor de glicocorticoides por DEX, silenciamento de GATA6 por siRNA e inibição do complexo SWI/SNF por BRM014).

# Slides

[Slides da Entrega 2](assets/slides/projeto2.pdf)

# Fundamentação Teórica

O câncer de mama triplo-negativo (TNBC) é um subtipo particularmente agressivo de câncer de mama, caracterizado pela ausência de expressão de receptores de estrogênio (ER-negativo), progesterona (PR-negativo) e pela não superexpressão do receptor 2 do fator de crescimento epidérmico humano (HER2/neu). Essa falta de alvos moleculares específicos limita as opções terapêuticas, tornando a quimioterapia o principal recurso de tratamento.

Avanços recentes na biologia molecular e na epigenética revelam que a regulação gênica aberrante no TNBC envolve os long non-coding RNAs (lncRNAs), RNAs com mais de 200 nucleotídeos que não codificam proteínas, mas modulam a expressão gênica e a progressão tumoral. Um dos mecanismos-chave é a interação desses lncRNAs com os complexos SWI/SNF (switching defective/sucrose nonfermenting), remodeladores de cromatina dependentes de ATP, que organizam a estrutura da cromatina e regulam o acesso de fatores de transcrição aos seus genes-alvo.

No TNBC, fatores de transcrição como o receptor de glicocorticoides (GR), GATA6, MYC e AP-1 regulam diferentes programas gênicos que controlam a proliferação celular, a invasão tumoral e a resistência à quimioterapia. O complexo SWI/SNF desempenha um papel central nesse processo, ao remodelar a cromatina e permitir que esses fatores de transcrição alcancem as regiões regulatórias necessárias para ativar seus genes-alvo.

# Perguntas de Pesquisa

O projeto busca responder às seguintes questões:

1. **Co-expressão com fatores regulatórios**: Existem lncRNAs sendo coexpressos com o receptor de glicocorticoide (GR), GATA6, a oncoproteína chave MYC e os fatores de transcrição AP-1?

2. **Associação com módulos de tratamento**: Os lncRNAs estão presentes em módulos de coexpressão associados aos tratamentos (DEX, siRNA GATA6, BRM014)?

3. **Identificação de hubs regulatórios**: Há lncRNAs identificados como hubs regulatórios nos módulos detectados pelo WGCNA?

4. **Enriquecimento de vias biológicas**: Vias biológicas relevantes e enriquecidas estão sendo afetadas pela presença de lncRNAs nos módulos?

5. **Expressão diferencial**: Algum lncRNA está diferencialmente expresso de forma significativa entre os tratamentos?

6. **Interações lncRNA-lncRNA**: Existem lncRNAs coexpressos entre si, sugerindo potenciais interações regulatórias ou funcionais?

# Metodologia

A análise foi estruturada em cinco etapas principais, utilizando técnicas de Ciência de Redes:

## Técnicas de Ciência de Redes Utilizadas

### 1. **Detecção de Comunidades (WGCNA)**
- **Objetivo**: Identificar módulos de genes co-expressos
- **Técnica**: Análise de Redes de Co-expressão Gênica Ponderada (WGCNA)
- **Aplicação**: Detecção de comunidades de genes com padrões de expressão similares
- **Resultado**: 40 módulos identificados, todos contendo lncRNAs

### 2. **Análise de Centralidade**
- **Objetivo**: Identificar genes hubs regulatórios
- **Técnica**: Medidas de conectividade e centralidade (kME - conectividade do eigengene do módulo)
- **Aplicação**: Identificação de genes centrais em cada módulo
- **Resultado**: Hubs identificados em todos os módulos, incluindo lncRNAs

### 3. **Predição de Links**
- **Objetivo**: Identificar interações potenciais entre genes e lncRNAs
- **Técnica**: Análise de correlação ponderada e limiarização
- **Aplicação**: Construção de redes de co-expressão
- **Resultado**: Redes com 2.6M arestas (redução de 96% do total original)

### 4. **Integração Multi-ômica**
- **Objetivo**: Combinar dados de RNA-seq e ChIP-seq
- **Técnica**: Análise de sobreposição e correlação
- **Aplicação**: Validação de interações lncRNA-gene
- **Resultado**: 15 lncRNAs robustos identificados em ambas as modalidades

## Bases de Dados e Evolução

| Base de Dados | Endereço na Web | Resumo descritivo |
| ----- | ----- | ----- |
| GEO – GSE261989 | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE261989 | Dataset de RNA-seq da linhagem BT549 submetida a três tipos de intervenções experimentais |
| GEO – GSE261988 | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE261988 | Dataset complementar de ChIP-seq do mesmo estudo para validação de interações |
| GENCODE – Human Release 46 | https://www.gencodegenes.org/human/release_46.html | Base de anotação genômica humana incluindo genes codificantes e não codificantes (lncRNAs) |

### Descobertas sobre as Bases de Dados

**GSE261989 (RNA-seq)**:
- 36 amostras processadas com alta qualidade
- 83,396 genes totais na matriz de contagem
- 22,578 lncRNAs detectados (≥1 read)
- 6,136 lncRNAs robustos (≥10 reads)
- 18,116 genes codificantes detectados
- 14,165 genes codificantes robustos

**GSE261988 (ChIP-seq)**:
- 313,997 genes no universo de análise
- 28,731 lncRNAs detectados (≥1 read)
- 37 lncRNAs robustos (≥10 reads)
- 47,170 genes codificantes detectados
- 80 genes codificantes robustos

**Transformações e Tratamentos**:
- Controle de qualidade com FastQC
- Alinhamento com STAR
- Quantificação com Salmon
- Normalização e filtragem de expressão
- Anotação integrada com AGAT

## Modelo Lógico

![Modelo Lógico de Grafos](assets/images/modelo-logico-grafos.png)

O modelo lógico representa um grafo de propriedades onde:
- **Nós**: Genes (codificantes e não codificantes), tratamentos, módulos
- **Arestas**: Relações de co-expressão, associações com tratamentos, pertencimento a módulos
- **Propriedades**: Valores de expressão, conectividade, significância estatística

## Integração entre Bases

**Desafios Identificados**:
1. **Diferenças de cobertura**: RNA-seq detectou mais lncRNAs que ChIP-seq
2. **Critérios de robustez**: Necessidade de padronizar critérios de detecção
3. **Sobreposição limitada**: Apenas 15 lncRNAs robustos em ambas as modalidades
4. **Normalização**: Diferentes escalas de dados entre RNA-seq e ChIP-seq

**Soluções Implementadas**:
- Critérios unificados de robustez (≥10 reads)
- Análise de sobreposição com Venn diagrams
- Normalização padronizada (CPM)
- Validação cruzada entre modalidades

## Análise Preliminar

### Resultados de WGCNA
- **40 módulos identificados** usando soft threshold power = 9
- **Módulo Brown**: Maior módulo com 3,929 genes (872 lncRNAs, 15.1%)
- **Módulo Blue**: Segundo maior com ~3,000 genes (5.9% lncRNAs)
- **Filtragem de arestas**: 96% de redução (65.9M → 2.6M arestas)
- **Interações lncRNA**: 99% de redução (17.6M → 189K)

### Análise de Expressão Diferencial
- **Múltiplos contrastes analisados**:
  - siCtl, Veh vs siGATA6, Veh
  - siCtl, +DEX vs siGATA6, +DEX
  - DMSO vs DEX + DMSO (4h e 24h)
  - BRM014 vs DEX + BRM014 (4h e 24h)
- **Genes significativos identificados** com thresholds apropriados
- **Volcano plots** mostrando separação clara de genes diferencialmente expressos

### Hubs Regulatórios Identificados
- **GATA6 e GATA6-AS1** no módulo Brown
- **GATA6**: Conectado a 2 outros genes (CD99L2, CTCF)
- **GATA6-AS1**: Conectado a 37 outros lncRNAs
- **Hubs em todos os módulos** com funções biológicas específicas

## Evolução do Projeto

### Modelagem Conceitual
**Modelo Inicial**: Foco apenas em RNA-seq e expressão diferencial
**Evolução**: Integração de ChIP-seq para validação de interações
**Refinamento**: Adição de análise de redes de co-expressão (WGCNA)

### Modelagem Lógica
**Versão 1**: Grafo simples gene-tratamento
**Versão 2**: Adição de módulos e conectividade
**Versão Final**: Grafo de propriedades com múltiplas camadas de informação

### Dificuldades Enfrentadas
1. **Processamento computacional**: Tempo de execução e poder computacional
2. **Arquivos grandes**: Arquivo de Edges muito grande (necessidade de filtragem)
3. **Critérios de corte**: Critério arbitrário de peso entre arestas
4. **Visualização**: Desafios na visualização no Cytoscape
5. **Determinação de contrastes**: Complexidade na definição de contrastes para DEG

### Lições Aprendidas
- Importância da filtragem agressiva para viabilidade computacional
- Necessidade de critérios robustos para detecção de lncRNAs
- Valor da integração multi-ômica para validação
- Importância da visualização para interpretação de resultados

# Ferramentas

## Ferramentas Utilizadas
- **SRA Toolkit (v3.2.1)** – download de dados do NCBI GEO
- **nf-core/rnaseq (v3.13.0)** – pré-processamento de RNA-seq
- **AGAT (v1.0.0)** – integração de arquivos de anotação GTF/GFF
- **nf-core/differentialabundance (v1.2.0)** – análise de expressão diferencial
- **WGCNA (v1.72-1, R)** – redes de coexpressão ponderadas
- **Cytoscape (v3.10.2)** – visualização de redes
- **Jupyter Notebook** – análise exploratória e visualização
- **R (v4.3.0)** – análises estatísticas e WGCNA
- **Python (v3.9)** – processamento de dados e visualização

## Ferramentas Futuras
- **Ingenuity Pathway Analysis (IPA, QIAGEN)** – enriquecimento funcional
- **clusterProfiler (v4.8.3, R)** – alternativa open source para enriquecimento funcional
- **Neo4j** – armazenamento de grafos de conhecimento
- **Cytoscape** – análise avançada de redes

# Referências Bibliográficas

- Palma, A., et al. (2025). Genome biology of long non-coding RNAs in humans: A virtual karyotype. *PLoS Computational Biology*. https://pmc.ncbi.nlm.nih.gov/articles/PMC11847481/
- Langfelder, P., & Horvath, S. (2008). WGCNA: an R package for weighted correlation network analysis. *BMC Bioinformatics*, 9(1), 559. https://doi.org/10.1186/1471-2105-9-559
- Ewels, P. A., et al. (2020). The nf-core framework for community-curated bioinformatics pipelines. *Nature Biotechnology*, 38(3), 276–278. https://doi.org/10.1038/s41587-020-0439-x
- Barabási, A. L., & Oltvai, Z. N. (2004). Network biology: understanding the cell's functional organization. *Nat Rev Genet*, 5(2), 101–113.
- Masliah-Planchon, J., et al. (2015). SWI/SNF chromatin remodeling and human malignancies. *Annu Rev Pathol*, 10, 145–171.
- Zhang, B., & Horvath, S. (2005). A general framework for weighted gene co-expression network analysis. *Stat Appl Genet Mol Biol*, 4(1).
- QIAGEN. Ingenuity Pathway Analysis (IPA). https://digitalinsights.qiagen.com/products-overview/discovery-insights-portfolio/analysis-and-visualization/qiagen-ipa/
