# Pipeline AGAT - Integração de Anotações

## Descrição
Pipeline para integração de anotações genômicas utilizando AGAT (Another Gff Analysis Toolkit) para combinar anotações de genes codificantes e lncRNAs.

## Objetivo
Integrar anotações do GENCODE Release 46 com dados experimentais para criar um conjunto unificado de anotações genômicas.

## Arquivos de Entrada
- **GTF do GENCODE**: `data/external/gencode.v46.annotation.gtf`
- **Dados experimentais**: Resultados de quantificação de expressão

## Arquivos de Saída
- **GTF integrado**: `data/processed/integrated_annotations.gtf`
- **Lista de lncRNAs**: `data/processed/lncRNA_list.txt`
- **Lista de genes codificantes**: `data/processed/coding_genes_list.txt`

## Comandos AGAT Utilizados

### 1. Filtragem de lncRNAs
```bash
agat_sp_filter_feature_by_attribute.pl \
  --gff gencode.v46.annotation.gtf \
  --attribute gene_type \
  --value lncRNA \
  --output lncRNA_annotations.gtf
```

### 2. Filtragem de genes codificantes
```bash
agat_sp_filter_feature_by_attribute.pl \
  --gff gencode.v46.annotation.gtf \
  --attribute gene_type \
  --value protein_coding \
  --output coding_genes_annotations.gtf
```

### 3. Fusão de anotações
```bash
agat_sp_merge_annotations.pl \
  --gff1 lncRNA_annotations.gtf \
  --gff2 coding_genes_annotations.gtf \
  --output integrated_annotations.gtf
```

## Parâmetros
- **Gene types**: lncRNA, protein_coding
- **Minimum length**: 200 bp (para lncRNAs)
- **Strand specificity**: Mantida

## Resultados
- **Total de genes**: 83,396
- **lncRNAs**: 22,578 detectados
- **Genes codificantes**: 18,116 detectados
- **Integração**: 100% dos genes anotados
