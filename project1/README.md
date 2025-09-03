# Projeto Integração de lncRNAs em Redes de Coexpressão para o Estudo de Vias Reguladas no Câncer de Mama Triplo-Negativo (TNBC)

# Project Integration of lncRNAs into Co-expression Networks to Study Regulatory Pathways in Triple-Negative Breast Cancer (TNBC)

# Descrição Resumida do Projeto

Este projeto investiga o papel de RNAs longos não codificantes (lncRNAs) no câncer de mama triplo-negativo (TNBC) a partir de dados de RNA-seq (GSE261989). O objetivo é integrar lncRNAs em análises de expressão diferencial, redes de coexpressão baseadas em WGCNA e enriquecimento de vias biológicas, a fim de identificar hubs regulatórios e módulos gênicos associados a tratamentos experimentais (ativação do receptor de glicocorticoides por DEX, silenciamento de GATA6 por siRNA e inibição do complexo SWI/SNF por BRM014).

# Slides

[Slides para a entrega 1](https://docs.google.com/presentation/d/15xRlneqj4Ro5KSnxNd5oV60-LYQMj8sW_82oXzW7-0c/edit?usp=sharing)


# Fundamentação Teórica

O câncer de mama triplo-negativo (TNBC) é um subtipo agressivo associado a mau prognóstico e resistência terapêutica (Foulkes et al., 2010; Bianchini et al., 2016). Estudos recentes destacam o papel regulatório dos lncRNAs em processos tumorais, atuando em proliferação, invasão e remodelação da cromatina (Schmitt & Chang, 2016; Anastasiadou et al., 2018). Além disso, fatores de transcrição como GR, GATA6, MYC e AP-1 e o complexo SWI/SNF exercem papéis centrais na progressão tumoral (Oakley & Cidlowski, 2013; Chia et al., 2015; Mathur et al., 2017). Este projeto se baseia na integração desses elementos para investigar redes de coexpressão gênica e vias enriquecidas no TNBC.

# Perguntas de Pesquisa

# Perguntas de Pesquisa

O projeto busca responder às seguintes questões:

1. Existem lncRNAs sendo coexpressos com o receptor de glicocorticoide (GR), GATA6, a oncoproteína chave MYC e os fatores de transcrição AP-1?  
2. Os lncRNAs estão presentes em módulos de coexpressão associados aos tratamentos (DEX, siRNA GATA6, BRM014)?  
3. Há lncRNAs identificados como hubs regulatórios nos módulos detectados pelo WGCNA?  
4. Vias biológicas relevantes e enriquecidas estão sendo afetadas pela presença de lncRNAs nos módulos?  
5. Algum lncRNA está diferencialmente expresso de forma significativa entre os tratamentos?  
6. Existem lncRNAs coexpressos entre si, sugerindo potenciais interações regulatórias ou funcionais?  

# Bases de Dados

Base de Dados | Endereço na Web | Resumo descritivo
----- | ----- | -----
GEO – GSE261989 | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE261989 | Dataset de RNA-seq da linhagem BT549 de câncer de mama triplo-negativo (TNBC), submetida a três condições experimentais: ativação do GR por dexametasona (DEX), silenciamento de GATA6 por siRNA e inibição do complexo SWI/SNF por BRM014.
GENCODE – Human Release 46 | https://www.gencodegenes.org/human/release_46.html | Base de anotação genômica humana (GRCh38, versão 46), incluindo genes codificantes e não codificantes (lncRNAs), usada para integrar a expressão diferencial com elementos regulatórios.

# Modelo Lógico
![Modelo Lógico de Grafos](images/modelo-logico-grafos.png)

# Metodologia
Nosso estudo irá utilizar duas classes de tratamentos: perturbação genética por siRNA e tratamento químico.  

![Tabela 1 - Condição e Tratamento por Categoria](images/tabela1.png)  
*Tabela 1 - Condição e Tratamento por Categoria. Fonte: Elaborado pelo autor.*  

A análise será estruturada em quatro etapas principais:  

1. **Integração de anotações**: incorporação de lncRNAs na anotação do genoma humano GRCh38 (GENCODE Release 46) utilizando **AGAT**.  
2. **Pré-processamento**: controle de qualidade, alinhamento e quantificação com o pipeline **nf-core/rnaseq (v3.13.0)**.  
3. **Expressão diferencial**: identificação de genes diferencialmente expressos entre controle e tratamento com **nf-core/differentialabundance (v1.2.0)**.  
4. **Coexpressão e redes**: construção de redes de coexpressão com **WGCNA (v1.72-1, R)**.  
5. **Enriquecimento funcional**: interpretação com **IPA (QIAGEN)** como ferramenta principal.  

![Figura 1 - Visão Geral da metodologia](images/figura1.png)  
*Figura 1 - Visão Geral da metodologia. Fonte: Elaborado pelo autor.*  

# Ferramentas

- **SRA Toolkit (v3.2.1)** – download de dados do NCBI GEO.  
- **nf-core/rnaseq (v3.13.0)** – pré-processamento de RNA-seq.  
- **AGAT (v1.0.0)** – integração de arquivos de anotação GTF/GFF.  
- **nf-core/differentialabundance (v1.2.0)** – análise de expressão diferencial.  
- **WGCNA (v1.72-1, R)** – redes de coexpressão ponderadas.  
- **Ingenuity Pathway Analysis (IPA, QIAGEN)** – enriquecimento funcional (principal).  
- **clusterProfiler (v4.8.3, R)** – alternativa open source para enriquecimento funcional.  
- **Cytoscape (v3.10.2)** – visualização de redes.  

# Referências Bibliográficas

- Palma, A., et al. (2025). Genome biology of long non-coding RNAs in humans: A virtual karyotype. *PLoS Computational Biology*. Disponível em: https://pmc.ncbi.nlm.nih.gov/articles/PMC11847481/  
- Langfelder, P., & Horvath, S. (2008). WGCNA: an R package for weighted correlation network analysis. *BMC Bioinformatics*, 9(1), 559. https://doi.org/10.1186/1471-2105-9-559  
- Ewels, P. A., et al. (2020). The nf-core framework for community-curated bioinformatics pipelines. *Nature Biotechnology*, 38(3), 276–278. https://doi.org/10.1038/s41587-020-0439-x  
- Barabási, A. L., & Oltvai, Z. N. (2004). Network biology: understanding the cell's functional organization. *Nat Rev Genet*, 5(2), 101–113.  
- Masliah-Planchon, J., et al. (2015). SWI/SNF chromatin remodeling and human malignancies. *Annu Rev Pathol*, 10, 145–171.  
- Tang, Y., et al. (2017). [Referência sobre SWI/SNF e regulação tumoral].  
- Sheng, Y., et al. (2025). [Referência sobre lncRNA e remodelação de cromatina].  
- Hao, X., et al. (2025). [Referência sobre SWI/SNF e TNBC].  
- Zhang, B., & Horvath, S. (2005). A general framework for weighted gene co-expression network analysis. *Stat Appl Genet Mol Biol*, 4(1).  
- QIAGEN. Ingenuity Pathway Analysis (IPA). Disponível em: https://digitalinsights.qiagen.com/products-overview/discovery-insights-portfolio/analysis-and-visualization/qiagen-ipa/  
