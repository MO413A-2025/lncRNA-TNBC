# Diretório de Dados - Projeto lncRNA-TNBC

## Descrição
Este diretório contém todos os dados utilizados no projeto de integração de lncRNAs em redes de co-expressão para o estudo de vias reguladas no câncer de mama triplo-negativo (TNBC).

## Estrutura do Diretório

### `/external and raw/`
**Conteúdo**: Dados originais sem modificações
- Dados do NCBI GEO (GSE261989, GSE261988)
- Anotações genômicas do GENCODE
- Metadados das amostras
- Arquivos de referência

### `/interim/`
**Conteúdo**: Dados intermediários resultantes de transformações
- Matrizes de contagem processadas
- Dados normalizados
- Resultados de análises intermediárias
- Saídas de notebooks

### `/processed/`
**Conteúdo**: Dados finais utilizados para publicação
- Datasets limpos e normalizados
- Resultados finais de análises
- Dados prontos para visualização
- Arquivos de publicação

## Tamanhos dos Arquivos
- **External/Raw**: ~50GB (dados originais)
- **Interim**: ~62GB (dados intermediários)
- **Processed**: ~10GB (dados finais)

## Acesso aos Dados
Devido ao tamanho dos arquivos, os dados estão armazenados em Google Drive:
- [External and Raw Data](data/external%20and%20raw/links.md)
- [Interim Data](data/interim/links.md)
- [Processed Data](data/processed/links.md)

## Formatos de Arquivo
- **CSV/TSV**: Dados tabulares
- **FASTQ**: Sequências de DNA/RNA
- **GTF/GFF**: Anotações genômicas
- **BAM**: Alinhamentos
- **RData**: Objetos R
- **PNG**: Visualizações

## Controle de Qualidade
Todos os dados processados passaram por:
- Verificação de integridade
- Controle de qualidade
- Normalização
- Validação estatística
