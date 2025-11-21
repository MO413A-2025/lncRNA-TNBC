# Dados Externos e Brutos

## Descrição
Este diretório contém os dados originais, sem modificações, utilizados como entrada para as transformações do projeto.

## Fonte dos Dados
- **NCBI GEO**: Gene Expression Omnibus
- **GENCODE**: Anotações genômicas humanas
- **SRA**: Sequence Read Archive

## Conteúdo Principal

### Dados de RNA-seq (GSE261989)
- **Linhagem celular**: BT549 (TNBC)
- **Tratamentos**:
  - DEX (dexametasona)
  - siRNA GATA6
  - BRM014
- **Controles**: DMSO, siCtl, Veh
- **Pontos temporais**: 4h, 24h
- **Réplicas**: 3 por condição

### Dados de ChIP-seq (GSE261988)
- **Complementar ao RNA-seq**
- **Mesma linhagem e tratamentos**
- **Validação de interações**

### Anotações Genômicas
- **GENCODE Release 46**
- **Genoma de referência**: GRCh38
- **Tipos de genes**: Codificantes e não codificantes

## Estrutura dos Arquivos
```
external and raw/
├── fastq/                    # Arquivos FASTQ
├── annotations/              # Anotações GTF/GFF
├── metadata/                 # Metadados das amostras
└── reference/               # Genoma de referência
```

## Acesso
[Google Drive Link](links.md)

## Formatos
- **FASTQ**: Sequências de DNA/RNA
- **GTF/GFF**: Anotações genômicas
- **CSV**: Metadados
- **FASTA**: Sequências de referência
