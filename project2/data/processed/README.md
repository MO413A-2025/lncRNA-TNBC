# Dados Processados

## Descrição
Este diretório contém os dados finais, processados e prontos para uso, utilizados para publicação e análise final.

## Conteúdo Principal

### Datasets Finais
- **Matrizes de expressão normalizadas**
- **Resultados de expressão diferencial**
- **Redes de co-expressão filtradas**
- **Anotações integradas**

### Dados de Publicação
- **Tabelas de resultados**
- **Arquivos de rede para Cytoscape**
- **Dados para visualização**
- **Metadados padronizados**

## Características dos Dados

### Qualidade
- **Controle de qualidade**: Aprovado
- **Normalização**: Aplicada
- **Validação estatística**: Concluída
- **Formato padronizado**: Implementado

### Filtros Aplicados
- **Genes robustos**: ≥10 reads
- **Arestas significativas**: Top 5%
- **Módulos validados**: 40 módulos
- **Hubs confirmados**: Análise de conectividade

## Estrutura dos Arquivos
```
processed/
├── expression_matrices/     # Matrizes de expressão
├── differential_expression/ # Resultados DEG
├── networks/               # Redes de co-expressão
├── annotations/            # Anotações integradas
└── metadata/              # Metadados finais
```

## Estatísticas Finais
- **Genes robustos**: 20,073
- **lncRNAs robustos**: 6,136
- **Arestas da rede**: 2.6M
- **Módulos identificados**: 40
- **Hubs regulatórios**: 40+ genes

## Acesso
[Google Drive Link](links.md)

## Formatos
- **CSV/TSV**: Dados tabulares
- **JSON**: Dados estruturados
- **HDF5**: Dados hierárquicos
- **RData**: Objetos R
- **CYTOSCAPE**: Arquivos de rede
