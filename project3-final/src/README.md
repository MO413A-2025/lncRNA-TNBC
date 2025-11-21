# Código Fonte - Projeto lncRNA-TNBC

## Descrição
Este diretório contém os arquivos de rede do Cytoscape gerados a partir da análise WGCNA e dos diferentes filtros aplicados à rede de co-expressão.

## Estrutura

O diretório está organizado em subdiretórios correspondentes aos diferentes filtros aplicados:

```
src/
├── Filter_A/          # Top-K por nó (K=5)
├── Filter_B/          # Corte global top 5%
├── Filter_C/          # Vizinhança de GATA6/GATA6-AS1
├── Filter_D/          # Subgrafo DEG estrito
├── Filter_E/          # Genes detectados em ChIP-seq
├── Filter_F/          # Literatura/picos de ChIP
└── Filter_G/          # Recorte estrito combinado (rede final)
```

Cada subdiretório contém:
- **Arquivo .cys**: Projeto do Cytoscape com a rede completa, incluindo layout, atributos e estilos

## Instalação

### Pré-requisitos
- **Cytoscape** (versão 3.10.2 ou superior)
- **Java** (versão 11 ou superior)

### Instalação do Cytoscape
1. Baixe o Cytoscape em: https://cytoscape.org/download.html
2. Siga as instruções de instalação para seu sistema operacional
3. Certifique-se de que o Java está instalado e configurado

## Execução

### Abrindo os Arquivos de Rede

1. **Inicie o Cytoscape**
   ```bash
   # No Windows/Mac: Execute o aplicativo Cytoscape
   # No Linux: 
   cytoscape.sh
   ```

2. **Carregue um arquivo de rede**
   - Vá em `File` → `Open` → `Open File...`
   - Navegue até o diretório desejado (ex: `Filter_G/`)
   - Selecione o arquivo `.cys` (ex: `Filter_G.cys`)
   - Clique em `Open`

3. **Visualize a rede**
   - A rede será carregada com layout e atributos pré-configurados
   - Use os controles de zoom e pan para navegar
   - Clique nos nós para ver informações detalhadas

### Trabalhando com Diferentes Filtros

Cada filtro representa uma estratégia diferente de recorte da rede:

- **Filter_A**: Foco nas conexões mais fortes de cada nó
- **Filter_B**: Rede com densidade equalizada (top 5% global)
- **Filter_C**: Contexto centrado em GATA6 e sua vizinhança
- **Filter_D**: Apenas genes diferencialmente expressos
- **Filter_E**: Genes validados por ChIP-seq
- **Filter_F**: Contexto baseado em literatura e picos de ChIP
- **Filter_G**: Rede final combinando múltiplos critérios biológicos

### Análise no Cytoscape

#### Visualização
- **Layout**: Os layouts já estão aplicados, mas você pode alterar em `Layout` → `Layout Algorithms`
- **Estilos**: Os estilos de cor e tamanho já estão configurados baseados em atributos dos nós
- **Legenda**: Consulte a tabela de atributos dos nós para entender a codificação de cores

#### Análise de Propriedades
1. Selecione a rede
2. Vá em `Tools` → `NetworkAnalyzer` → `Network Analysis` → `Analyze Network`
3. Visualize métricas como grau, centralidade, clustering coefficient

#### Exportação
- **Imagens**: `File` → `Export` → `Network as Image`
- **Tabelas**: `File` → `Export` → `Table to File`
- **Dados**: `File` → `Export` → `Network to File`

## Referências

- **Cytoscape**: https://cytoscape.org/
- **Documentação**: https://manual.cytoscape.org/
- **Tutoriais**: https://cytoscape.org/cytoscape-tutorials/