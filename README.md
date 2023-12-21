# Modelo Latex para desenvolvimento de TCCs do DAINF-PB (UTFPR-PB) e DACOM-CM (UTFPR-CM)

  Este modelo LaTeX (não oficial) permite a produção de trabalhos acadêmicos (teses, dissertações, trabalhos de conclusão, etc.) da Universidade Tecnológica Federal do Paraná (UTFPR).

# >> Atenção - Leia isso antes de usar esse template<< 

%% Esse template foi **desenvolvido por professores**,  com a intenção de ajudar os alunos com as entregas na biblioteca. Não há uma equipe especializada e dedicada mantendo tal template, mas sim professores trabalhando além das suas funções básicas, que são: ensino, pesquisa e extensão.
%
%% Também os mantenedores deste template não são especializados em LaTeX, muito menos em normas da ABNT. Todos que contribuíram com o template fizeram isso visando deixá-lo o mais próximo possível das normas da ABNT e das regras, anseios e expectativas da biblioteca da UTFPR. É muito importante entender que os desenvolvedores do template não têm relação direta com a biblioteca ou com a ABNT. Ou seja, **não são os desenvolvedores do template que ditam as regras e normas dos textos que devem ser entregues à biblioteca**.

%%É válido informar também, que como **não há uma equipe dedicada e especializada, o tempo para colaborar com o template é curto**. Desta forma, pode ser que não sejam empregadas as melhores técnicas, métodos e ferramentas para o desenvolvimento do template. Também pode acontecer do template não atender completamente todos os anseios e exigências da ABNT e da biblioteca, pois por exemplo, muitas regras de redação possuem questões interpretativas. Assim, o template sempre estará em contínua evolução e seria extremamente interessante que as pessoas (alunos,  professores,  técnicos e entusiastas) colaborarem com a evolução do template. **Toda ajuda será bem vinda!** Isso pode ser feito enviando e-mail para os desenvolvedores, desta forma, assim que possível esses vão tentar melhorar o template.

%%O template é apenas mais uma ferramenta para o desenvolvimento de trabalhos para a biblioteca. Todavia, podem existir outros templates LaTeX. Assim como há templates em outros formatos, que não o LaTeX. O mais importante é que qualquer pessoa, utilizando a princípio qualquer ferramenta, pode desenvolver textos que atendem os requisitos da biblioteca apenas estudando, interpretando e seguindo as regras da UTFPR e da ABNT, que estão disponíveis na página Web da instituição. **O template é só um facilitador**.

%%Por fim,  é necessário entender que infelizmente o ambiente LaTeX pode ser complexo e gerar resultados distintos dependendo do: sistema operacional,  pacotes LaTeX utilizados,  configurações alteradas, editor utilizado, a forma que está sendo redigida textos, figuras,  etc. Assim não há como garantir que o resultado final será o esperado.  Dito tudo isso,  **>>UTILIZE ESSE TEMPLATE POR SUA CONTA E RISCO<<. Os desenvolvedores e colaboradores deste template não se responsabilizam pelo resultado do uso deste template e se eximem de qualquer responsabilidade.**

%###################################################

Este modelo é compatível com as normas ABNT vigentes:

-   **ABNT NBR 6022:2018**: Informação e documentação - Artigo em publicação periódica científica - Apresentação
-   **ABNT NBR 6023:2002**: Informação e documentação - Referência - Elaboração`**`
-   **ABNT NBR 6024:2012**: Informação e documentação - Numeração progressiva das seções de um documento - Apresentação
-   **ABNT NBR 6027:2012**: Informação e documentação - Sumário - Apresentação
-   **ABNT NBR 6028:2003**: Informação e documentação - Resumo - Apresentação
-   **ABNT NBR 6029:2006**: Informação e documentação - Livros e folhetos - Apresentação
-   **ABNT NBR 6034:2004**: Informação e documentação - Índice - Apresentação
-   **ABNT NBR 10520:2002**: Informação e documentação - Citações
-   **ABNT NBR 10719:2015**: Informação e documentação - Relatório técnico e/ou científico - Apresentação
-   **ABNT NBR 14724:2011**: Informação e documentação - Trabalhos acadêmicos - Apresentação
-   **ABNT NBR 15287:2011**: Informação e documentação - Projeto de pesquisa - Apresentação
  
  
  ### Dicas para iniciar o desenvolvimento do trabalho
  
-  Para iniciantes em LaTeX o github do abntex2 possui um excelente tutorial com diversos links: [Por Onde Começar?](https://github.com/abntex/abntex2/wiki/PorOndeComecar).
- Ainda no github do abntex2 existe uma lista com diversas ferramentas que podem ser utilizadas para desenvolver o seu trabalho: [Ferramentas](https://github.com/abntex/abntex2/wiki/Ferramentas).

## Referências
Foi desenvolvido baseado no modelo de trabalhos acadêmicos do abnTeX2, disponível em <http://www.abntex.net.br/>, que atende aos requisitos das normas da Associação Brasileira de Normas Técnicas (ABNT) para produção de documentos técnicos e científicos brasileiros, bem como em diversos trechos de códigos desenvolvidos por usuários do TeX-LaTeX Stack Exchange, disponível em <http://tex.stackexchange.com/>.

Foi desenvolvido baseado nos modelos:

- utfprpgtex.cls, desenvolvido por Luiz E. M. Lima, luizeduardomlima@gmail.com.
- Monografia-utfpr-dagro-nov2019.cls, desenvolvido por Jorge Jamhour, jamhour@utfpr.edu.br.

Estado: adicionado por Vinicius Pegorini e Luiz Arthur Feitosa dos Santos (luizsantos@utfpr.edu.br), manutenção sob demanda.

Última atualização: 10 de Agosto de 2022 (Versão 2.5).

---
It was developed based on the abnTeX2 academic works template, available at <http://www.abntex.net.br/>, which meets the standards requirements of the Brazilian Association of Technical Standards (ABNT) for development of technical and scientific Brazilian documents, as well as several code snippets developed by TeX-LaTeX Stack Exchange users, available at <http://tex.stackexchange.com/>.

It was developed based on:
 - utfprpgtex.cls academic works template, developed by Luiz E. M. Lima,
   luizeduardomlima@gmail.com. 
  - Monografia-utfpr-dagro-nov2019.cls
   academic works template, , developed by prof. Jorge Jamhour.

Status: added by Vinicius Pegorini, maintenance on demand.

Last updated: Ago 10, 2022 (Version 2.5), by Luiz Arthur Feitosa dos Santos (luizsantos@utfpr.edu.br).

Registro:

* Na versão 2.4 foi adicionado a capacidade de compilar nativamente para PDF/A, variando de PDF/A-1b, PDF/A-2b e PDF/A-3b. Ver capítulo de exemplos para entender mais a respeito do PDF/A, como compilar, seus problemas e soluções. 

* A versão 2.4a foi removido os warnings e comandos que aparentemente não estavam sendo necessários para a criação do PDF/A.

* A versão 2.4b foi alterado o "In:", nas referências para ficar em itálico. 

* A versão 2.4c foi adicionada as lista de figura, tabela, etc em negrito.

* A versão 2.5 foi configurada para não contar a capa e folha de rosto, também a fonte referente ao número da página foi alterada para tamanho 10. Para isso foram alterados os arquivos main.tex e utfpr.cls.

* A versão 2.5a adiciona apenas o texto que exime os desenvolvedores deste template de qualquer responsabilidade a respeito do trabalho de quem utilizar tal template.