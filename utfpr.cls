%%%% utfpr.cls, 2022/08/10, 2.5
%%%% Copyright (C) 2020 Vinicius Pegorini (vinicius@utfpr.edu.br)
%%
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3 of this license or (at your
%% option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Vinicius Pegorini.
%% Updated by:
%% - Marco Aurélio Graciotto Silva;
%% - Rogério Aparecido Gonçalves;
%% - Luiz Arthur Feitosa dos Santos.
%%
%% This work consists of the files utfpr.cls, main.tex, and
%% variaveis.tex.
%%
%% A brief description of this work is in readme.md.

%% ####################################################
%%
%% >> Atenção - Leia isso antes de usar esse template<< 
%%
%% Esse template foi desenvolvido por professores,  com a intenção de ajudar os alunos com as entregas na biblioteca. Não há uma equipe especializada e dedicada mantendo tal template, mas sim professores trabalhando além das suas funções básicas, que são: ensino, pesquisa e extensão.
%
%% Também os mantenedores deste template não são especializados em LaTeX, muito menos em normas da ABNT. Todos que contribuíram com o template fizeram isso visando deixá-lo o mais próximo possível das normas da ABNT e das regras, anseios e expectativas da biblioteca da UTFPR. É muito importante entender que os desenvolvedores do template não têm relação direta com a biblioteca ou com a ABNT. Ou seja, não são os desenvolvedores do template que ditam as regras e normas dos textos que devem ser entregues à biblioteca.

%%É válido informar também, que como não há uma equipe dedicada e especializada, o tempo para colaborar com o template é curto. Desta forma, pode ser que não sejam empregadas as melhores técnicas, métodos e ferramentas para o desenvolvimento do template. Também pode acontecer do template não atender completamente todos os anseios e exigências da ABNT e da biblioteca, pois por exemplo, muitas regras de redação possuem questões interpretativas. Assim, o template sempre estará em contínua evolução e seria extremamente interessante que as pessoas (alunos,  professores,  técnicos e entusiastas) colaborarem com a evolução do template. Toda ajuda será bem vinda! Isso pode ser feito enviando e-mail para os desenvolvedores, desta forma, assim que possível esses vão tentar melhorar o template.

%%O template é apenas mais uma ferramenta para o desenvolvimento de trabalhos para a biblioteca. Todavia, podem existir outros templates LaTeX. Assim como há templates em outros formatos, que não o LaTeX. O mais importante é que qualquer pessoa, utilizando a princípio qualquer ferramenta, pode desenvolver textos que atendem os requisitos da biblioteca apenas estudando, interpretando e seguindo as regras da UTFPR e da ABNT, que estão disponíveis na página Web da instituição. O template é só um facilitador.

%%Por fim,  é necessário entender que infelizmente o ambiente LaTeX pode ser complexo e gerar resultados distintos dependendo do: sistema operacional,  pacotes LaTeX utilizados,  configurações alteradas, editor utilizado, a forma que está sendo redigida textos, figuras,  etc. Assim não há como garantir que o resultado final será o esperado.  Dito tudo isso,  >>UTILIZE ESSE TEMPLATE POR SUA CONTA E RISCO<<. Os desenvolvedores e colaboradores deste template não se responsabilizam pelo resultado do uso deste template e se eximem de qualquer responsabilidade.

%###################################################

%% Identificação e modificações
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{utfpr}[2021/10/28 v2.0]

% \ProvidesClass{utfprpb}[2020/05/10 v1.0]
%% -- Criação dos arquivos constituintes deste projeto.

%% luiz
% Configure line spacing
%
\RequirePackage{setspace}




%% luiz end

%% Classe e opções
\RequirePackage{color}%% Controle de cores em documentos LaTeX
\RequirePackage{substr}%% Controle de substrings em strings
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}%% Envio das opções atuais para a classe abntex2
%% -- Opções da classe utfpr
%%    -- Impressão dos elementos pré-textuais
\newif\if@pretexttwoside%% Condicional para impressão dos elementos pré-textuais
\DeclareOption{pretextualoneside}{\typeout{-----> Option: pretextualoneside}\@pretexttwosidefalse}%% Anverso
\DeclareOption{pretextualtwoside}{\typeout{-----> Option: pretextualtwoside}\@pretexttwosidetrue}%% Anverso e verso
%%    -- Fonte do texto
\DeclareOption{fontetimes}{\typeout{-----> Option: fontetimes}\gdef\@tipodefonte{\rmdefault}}%% Times
\DeclareOption{fontearial}{\typeout{-----> Option: fontearial}\gdef\@tipodefonte{\sfdefault}}%% Arial
\DeclareOption{fontecourier}{\typeout{-----> Option: fontecourier}\gdef\@tipodefonte{\ttdefault}}%% Courier
%%    -- Cores nos vínculos (padrões: citecolor = green, filecolor = cyan, linkcolor = red, urlcolor = magenta)
\definecolor{bblue}{rgb}{0, 0, 0.25}%% Definição do azul escuro (modificado)
\definecolor{gray}{rgb}{0.5, 0.5, 0.5}%% Definição do cinza (modificado)
\def\@cordosvinculos{black}%% Preto
\DeclareOption{vinculoscoloridos}{\typeout{-----> Option: vinculoscoloridos}\def\@cordosvinculos{bblue}}%% Azul escuro
\def\@citecolor{\@cordosvinculos}%% Cor das citações
\def\@filecolor{\@cordosvinculos}%% Cor dos arquivos
\def\@linkcolor{\@cordosvinculos}%% Cor dos links
\def\@urlcolor{\@cordosvinculos}%% Cor das urls

%%    -- Remoção do recuo dos itens no sumário
\newif\if@semrecuonosumario%% Condicional para remoção do recuo dos itens no sumário
\@semrecuonosumariofalse%% Remove
\DeclareOption{semrecuonosumario}{\typeout{-----> Option: semrecuonosumario}\@semrecuonosumariotrue}%% Adiciona
%%    -- Compilação de glossários e índices utilizando makeindex
\newif\if@usemakeindex%% Condicional para compilação de glossários e índices utilizando makeindex
\@usemakeindexfalse%% Desabilita
\DeclareOption{usemakeindex}{\typeout{-----> Option: usemakeindex}\@usemakeindextrue}%% Habilita
%%    -- Alinhamento das legendas
\newif\if@legendascentralizadas%% Condicional para o alinhamento das legendas
\@legendascentralizadastrue%% À esquerda
\DeclareOption{legendascentralizadas}{\typeout{-----> Option: legendascentralizadas}\@legendascentralizadastrue}%% Centralizado
%%    -- Folha de aprovação do programa de pós-graduação
\newif\if@aprovacaoestiloppg%% Condicional para a folha de aprovação do programa de pós-graduação
\@aprovacaoestiloppgfalse%% Estilo padrão
\DeclareOption{aprovacaoestiloppg}{\typeout{-----> Option: aprovacaoestiloppg}\@aprovacaoestiloppgtrue}%% Estilo do PPG
%%    -- Assinaturas na folha de aprovação
\newif\if@pardeassinaturas%% Condicional para as assinaturas na folha de aprovação
\@pardeassinaturasfalse%% Em uma única coluna
\DeclareOption{pardeassinaturas}{\typeout{-----> Option: pardeassinaturas}\@pardeassinaturastrue}%% Em até duas colunas
%%    -- Linhas de assinaturas na folha de aprovação
\newif\if@linhasdeassinaturas%% Condicional para as linhas de assinaturas na folha de aprovação
\@linhasdeassinaturasfalse%% Remove as linhas
\DeclareOption{linhasdeassinaturas}{\typeout{-----> Option: linhasdeassinaturas}\@linhasdeassinaturastrue}%% Adiciona as linhas
\ProcessOptions\relax%% Processamento das opções
\LoadClass{abntex2}%% Carregamento da classe abntex2

%% Pacotes carregados
\RequirePackage[utf8]{inputenc}%% Codificações de entrada: unix - latin1/utf8; windows - ansinew; Mac - applemax; DOS-OS/2 - cp850
\ifpdf%% Compilação com pdflatex
  \RequirePackage{cmap}%% Busca e cópia em arquivos PDF
  \RequirePackage{ae}%% Fontes virtuais para codificação de fontes T1
  \RequirePackage[pdftex]{graphics}%% Padrão gráfico de figuras
  \RequirePackage[pdftex]{graphicx}%% Aperfeiçoamentos do padrão gráfico de figuras
\else%% Compilação com latex
  \RequirePackage[T1]{fontenc}%% Codificação de fontes T1
  \RequirePackage{epic, eepic}%% Aperfeiçoamentos e extensões do ambiente figure
  \RequirePackage[dvips]{epsfig}%% Emulação de figuras (e)ps
  \RequirePackage[dvips]{graphics}%% Padrão gráfico de figuras
  \RequirePackage[dvips]{graphicx}%% Aperfeiçoamentos do padrão gráfico de figuras
\fi
\RequirePackage{fix-cm}%% Fontes "Computer Modern" em tamanhos arbitrários
\RequirePackage{hyphenat}%% Hifenização de palavras
%luiz:
%\RequirePackage[brazilian, hyperpageref]{backref}%% Páginas das citações nas referências
% luiz - as opções não são passadas aqui, procure anteriormente por \citeoption
\RequirePackage[alf]{abntex2cite}%% Citações padrão ABNT (autor-data)
\ifpdf%% Compilação com pdflatex
\else%% Compilação com latex
  \@ifpackageloaded{breakurl}%% Verificação do pacote breakurl
    {\PassOptionsToPackage{hyphenbreaks}{breakurl}}{\RequirePackage[hyphenbreaks]{breakurl}}%% Quebra de linha em endereços da web
\fi
% \RequirePackage[showframe]{geometry}
\RequirePackage{geometry}
\RequirePackage{lastpage}%% Referência da última página
\RequirePackage{algorithmic}%% Ferramenta para tipografar um algoritmo em pseudocódigo
\RequirePackage[acronym, nosuper, nowarn, sanitize={description=false}, style=index]{glossaries}%% Glossários e listas de acrônimos
\RequirePackage{nomencl}%% Listas de símbolos como uma nomenclatura
\RequirePackage{amsmath}%% Ferramentas para linguagem matemática
\RequirePackage{sistyle}%% Unidades, números e ângulos no SI
\RequirePackage{caption}%% Configuração das legendas de objetos flutuantes
\RequirePackage{xtab}%% Tabelas em múltiplas páginas
\RequirePackage{etoolbox}%% Caixa de ferramentas para programadores LaTeX usando e-TEX
\RequirePackage{indentfirst}%% Recuo do primeiro parágrafo após cabeçalho da seção
\RequirePackage{morewrites}%% Espaços adicionais para comandos \write*

%% Configurações do pacote hyperref
\hypersetup{%% Opções do pacote hyperref
  breaklinks=true,%%
  colorlinks=true,%%
  citecolor=\@cordosvinculos,%%
  filecolor=\@cordosvinculos,%%
  linkcolor=\@cordosvinculos,%%
  urlcolor=\@cordosvinculos,%%
  bookmarksopen=true,%%
  bookmarksnumbered=true,%%
  pdfdisplaydoctitle=true,%%
  pdfpagelayout=SinglePage%%
}



% luiz? comentado pois as normas da ABNT não utilizam o Citado na p[agina]
%% Configurações do pacote backref
% \renewcommand{\backrefpagesname}{Citado na(s) página(s):~}%% Comando usado sem a opção hyperpageref do pacote backref
% \renewcommand{\backref}{}%% Texto padrão antes do número das páginas
% \renewcommand*{\backrefalt}[4]{%% Definição dos textos da citação
%   \ifcase #1%%
%     Nenhuma citação no texto.%%
%   \or%%
%     Citado na página #2.%%
%   \else%%
%     Citado #1 vezes nas páginas #2.%%
%   \fi
% }

%% Configurações do pacote abntex2cite
\AtBeginDocument{%% Definições carregadas no início do documento
  \citeoption{abnt-emphasize=bf}
  \citeoption{abnt-etal-cite=2}
  \citeoption{abnt-etal-list=0}
  \citeoption{abnt-etal-text=it}
  \citeoption{abnt-full-initials=yes}
  \citeoption{abnt-repeated-title-omit=no}
  \citeoption{abnt-thesis-year=both}
  \citeoption{abnt-url-package=url}
  \citeoption{abnt-doi=doi}
  \def\UrlLeft{}
  \def\UrlRight{}
  \urlstyle{same}
}


%% Logos UTFPR
\newcommand{\utfprpbtex}{UTF\kern-0.75ex\lower0.4ex\hbox{\tiny PR}\kern-0.9ex\lower-0.585ex\hbox{\tiny PB}\kern-0.1ex\TeX}
\newcommand{\utfprtex}{UTF\kern-0.75ex\lower0.4ex\hbox{\hspace{1mm}\tiny PR}\kern-0.1ex\TeX}


%% Variáveis dependentes do idioma
\ifthenelse{%% Verificação do idioma português brasileiro
  \equal{\languagename}{brazil}
  \or\equal{\languagename}{brazilian}
  \or\equal{\languagename}{portuguese}
}{%% Definições em português
  \AtBeginDocument{%% Definições carregadas no início do documento
    \newcommand{\nomecapa}{Capa}
    \newcommand{\nomefolhaderosto}{Folha de Rosto}
    \newcommand{\nomefichacatalografica}{Ficha Catalográfica}
    % \newcommand{\nomeerrata}{Errata}
    \newcommand{\nomefolhadeaprovacao}{Folha de Aprovação}
    % \newcommand{\nomededicatoria}{Dedicatória}
    % \newcommand{\nomeagradecimentos}{Agradecimentos}
    % \newcommand{\nomeepigrafe}{Epígrafe}
    % \newcommand{\nomeresumo}{Resumo}
    \newcommand{\nomepalavraschave}{Palavras-chave}
    \newcommand{\nomeabstract}{Abstract}
    \newcommand{\nomekeywords}{Keywords}
    \newcommand{\listalgorithmname}{Lista de Algoritmos}
    \newcommand{\algorithmname}{Algoritmo}
    \newcommand{\sourcecodename}{Listagem}
    \newcommand{\listofsourcecodesname}{Listagem de C\'odigos Fonte}
    \renewcommand{\listfigurename}{Lista de Figuras}
    %\renewcommand\cftfigfont{\bfseries}
    % \renewcommand{\figurename}{Figura}
    \newcommand{\photographname}{Fotografia}
    \newcommand{\listphotographname}{Lista de Fotografias}
    \newcommand{\graphname}{Gráfico}
    \newcommand{\listgraphname}{Lista de Gráficos}
    \newcommand{\tabframedname}{Quadro}
    \newcommand{\listtabframedname}{Lista de Quadros}
    \renewcommand{\listtablename}{Lista de Tabelas}
    % \renewcommand{\tablename}{Tabela}
    \newcommand{\nomefonte}{Fonte}
    % \renewcommand{\nomname}{Nomenclatura}
    \newcommand{\nomelistadeacronimos}{Lista de Abreviaturas e Siglas}
    \newcommand{\nomeabreviaturas}{Abreviaturas}
    \newcommand{\nomesiglas}{Siglas}
    \newcommand{\nomeacronimos}{Acrônimos}
    \newcommand{\nomelistadesimbolos}{Lista de Símbolos}
    \newcommand{\nomeletraslatinas}{Letras Latinas}
    \newcommand{\nomeletrasgregas}{Letras Gregas}
    \newcommand{\nomesobrescritos}{Sobrescritos}
    \newcommand{\nomesubscritos}{Subscritos}
    \newcommand{\nomenotacoes}{Notações}
    % \renewcommand{\contentsname}{Sumário}
    % \renewcommand{\chapterautorefname}{Capítulo}
    % \renewcommand{\sectionautorefname}{Seção}
    % \renewcommand{\subsectionautorefname}{Subseção}
    % \renewcommand{\subsubsectionautorefname}{Subseção}
    \renewcommand{\paragraphautorefname}{\subsubsectionautorefname}
    % \renewcommand{\bibname}{Referências}
    % \renewcommand{\refname}{\bibname}
    % \renewcommand{\appendixname}{Apêndice}
    % \newcommand{\apendiceautorefname}{Apêndice}
    % \newcommand{\nomeanexo}{Anexo}
    \newcommand{\anexoautorefname}{Anexo}
    \renewcommand{\indexname}{Índice Remissivo}
    \renewcommand{\algorithmicrequire}{\textbf{requer}}
    \renewcommand{\algorithmicensure}{\textbf{inserir}}
    \renewcommand{\algorithmicend}{\textbf{finaliza}}
    \renewcommand{\algorithmicif}{\textbf{se}}
    \renewcommand{\algorithmicthen}{\textbf{então}}
    \renewcommand{\algorithmicelse}{\textbf{senão,}}
    \renewcommand{\algorithmicfor}{\textbf{para}}
    \renewcommand{\algorithmicforall}{\textbf{para todos}}
    \renewcommand{\algorithmicdo}{\textbf{faça}}
    \renewcommand{\algorithmicwhile}{\textbf{enquanto}}
    \renewcommand{\algorithmicloop}{\textbf{sequência}}
    \renewcommand{\algorithmicrepeat}{\textbf{repita}}
    \renewcommand{\algorithmicuntil}{\textbf{até}}
    \renewcommand{\algorithmicprint}{\textbf{imprime}}
    \renewcommand{\algorithmicreturn}{\textbf{retorna}}
    \renewcommand{\algorithmictrue}{\textbf{verdadeiro}}
    \renewcommand{\algorithmicfalse}{\textbf{falso}}
    \renewcommand{\glossaryname}{Glossário}
    \providetranslation{Glossary}{Glossário}
    \providetranslation{Acronyms}{Siglas}
    \providetranslation{Notation (glossaries)}{Notação}
    \providetranslation{Description (glossaries)}{Descrição}
    \providetranslation{Symbol (glossaries)}{Símbolo}
    \providetranslation{Page List (glossaries)}{Lista de Páginas}
    \providetranslation{Symbols (glossaries)}{Símbolos}
    \providetranslation{Numbers (glossaries)}{Números}
    \SIdecimalsign{,}%% Símbolo de decimal (pacote sistyle)
  }
}{%% English definitions
  \AtBeginDocument{%% Definições carregadas no início do documento
    \newcommand{\nomecapa}{Cover}
    \newcommand{\nomefolhaderosto}{Title Page}
    \newcommand{\nomefichacatalografica}{Index Card}
    % \newcommand{\nomeerrata}{Erratum}
    \newcommand{\nomefolhadeaprovacao}{Approval Term}
    % \newcommand{\nomededicatoria}{Dedicatory}
    % \newcommand{\nomeagradecimentos}{Acknowledgements}
    % \newcommand{\nomeepigrafe}{Epigraphy}
    % \newcommand{\nomeresumo}{Abstract}
    \newcommand{\nomepalavraschave}{Keywords}
    \newcommand{\nomeabstract}{Resumo}
    \newcommand{\nomekeywords}{Palavras-chave}
    \newcommand{\listalgorithmname}{List of Algorithms}
    \newcommand{\algorithmname}{Algorithm}
    \newcommand{\sourcecodename}{Source Code}
    \newcommand{\listofsourcecodesname}{List of Source Code}
    \renewcommand{\listfigurename}{List of Figures}
    % \renewcommand{\figurename}{Figure}
    \newcommand{\photographname}{Photograph}
    \newcommand{\listphotographname}{List of Photographs}
    \newcommand{\graphname}{Graph}
    \newcommand{\listgraphname}{List of Graphs}
    \newcommand{\tabframedname}{Frame}
    \renewcommand{\listtablename}{List of Tables}
    \newcommand{\listtabframedname}{List of Boards}
    % \renewcommand{\tablename}{Table}
    \newcommand{\nomefonte}{Source}
    % \renewcommand{\nomname}{Nomenclature}
    \newcommand{\nomelistadeacronimos}{List of Abbreviations and Acronyms}
    \newcommand{\nomeabreviaturas}{Abbreviations}
    \newcommand{\nomesiglas}{Pseudo-Acronyms}
    \newcommand{\nomeacronimos}{Acronyms}
    \newcommand{\nomelistadesimbolos}{List of Symbols}
    \newcommand{\nomeletraslatinas}{Latin Letters}
    \newcommand{\nomeletrasgregas}{Greek Letters}
    \newcommand{\nomesobrescritos}{Superscripts}
    \newcommand{\nomesubscritos}{Subscripts}
    \newcommand{\nomenotacoes}{Notations}
    % \renewcommand{\contentsname}{Summary}
    % \renewcommand{\chapterautorefname}{Chapter}
    % \renewcommand{\sectionautorefname}{Section}
    % \renewcommand{\subsectionautorefname}{Subsection}
    % \renewcommand{\subsubsectionautorefname}{Subsection}
    \renewcommand{\paragraphautorefname}{\subsubsectionautorefname}
    % \renewcommand{\bibname}{References}
    % \renewcommand{\refname}{\bibname}
    % \renewcommand{\appendixname}{Appendix}
    % \newcommand{\apendiceautorefname}{Appendix}
    % \newcommand{\nomeanexo}{Annex}
    \newcommand{\anexoautorefname}{Annex}
    \renewcommand{\indexname}{Index}
  }
}
\renewcommand{\folhaderostoname}{\nomefolhaderosto}
\renewcommand{\folhadeaprovacaoname}{\nomefolhadeaprovacao}
\renewcommand{\listadesiglasname}{\nomelistadeacronimos}
\renewcommand{\listadesimbolosname}{\nomelistadesimbolos}

%% Definições de variáveis
\newcommand{\TipoDeDocumento}[1]{\providecommand{\imprimirtipodedocumento}{#1}}%% Tipo de documento
\newcommand{\DocumentType}[1]{\providecommand{\printdocumenttype}{#1}}%% Document type
\newcommand{\NivelDeFormacao}[1]{\providecommand{\imprimirniveldeformacao}{#1}}%% Nível de formação
\newcommand{\FormationLevel}[1]{\providecommand{\printformationlevel}{#1}}%% Formation level
\newcommand{\TituloDoDocumento}[1]{\providecommand{\imprimirtitulododocumento}{#1}}%% Título do documento
\newcommand{\DocumentTitle}[1]{\providecommand{\printdocumenttitle}{#1}}%% Document title
\newcommand{\TituloEmMultiplasLinhas}[1]{\providecommand{\imprimirtituloemmultiplaslinhas}{#1}}%% Título em multiplas linhas
\newcommand{\DescricaoDoDocumento}[1]{\providecommand{\imprimirdescricaododocumento}{#1}}%% Descrição do documento
\newcommand{\TituloDaFichaCatalografica}[1]{%% Título da ficha catalográfica
  \providecommand{\imprimirtitulodafichacatalografica}{#1}%%
}
\newcommand{\TextoDeAprovacao}[1]{\providecommand{\imprimirtextodeaprovacao}{#1}}%% Texto de aprovação
\newcommand{\AvisoDeAprovacao}[1]{\providecommand{\imprimiravisodeaprovacao}{#1}}%% Aviso de aprovação
\newcommand{\NumeroDaTeseOuDissertacao}[1]{\providecommand{\imprimirnumerodateseoudissertacao}{#1}}%% Número da tese ou dissertação
\newcommand{\NumeroDaPublicacao}[1]{\providecommand{\imprimirnumerodapublicacao}{#1}}%% Número da publicação
\newcommand{\NumeroDaFichaCatalografica}[1]{%% Número da ficha catalográfica
  \providecommand{\imprimirnumerodafichacatalografica}{#1}%%
}
\newcommand{\CDDOuCDU}[1]{\providecommand{\imprimircddoucdu}{#1}}%% CDD ou CDU
\newcommand{\TituloPretendido}[1]{\providecommand{\imprimirtitulopretendido}{#1}}%% Título pretendido
\newcommand{\NomeDoAutor}[1]{\providecommand{\imprimirnomedoautor}{#1}}%% Nome completo do(a) autor(a)
%\newcommand{\SobrenomeDoAutor}[1]{\providecommand{\imprimirsobrenomedoautor}{#1}}%% Sobrenome do(a) autor(a)
%\newcommand{\PrenomeDoAutor}[1]{\providecommand{\imprimirprenomedoautor}{#1}}%% Prenome do(a) autor(a)
\newcommand{\AtribuiOutroAutor}[1]{%% Insere ou remove outro(a) autor(a)
  \ifthenelse{\equal{\imprimirtipodedocumento}{Trabalho de Conclusão de Curso}}%% Verificação do tipo de documento
    {\providecommand{\imprimiratribuioutroautor}{#1}}%% Insere ou remove outro(a) autor(a)
    {\providecommand{\imprimiratribuioutroautor}{false}}%% Remove outro(a) autor(a)
}
\newcommand{\NomeDoOutroAutor}[1]{\providecommand{\imprimirnomedooutroautor}{#1}}%% Nome completo do(a) outro(a) autor(a)
\newcommand{\SobrenomeDoOutroAutor}[1]{\providecommand{\imprimirsobrenomedooutroautor}{#1}}%% Sobrenome do(a) outro(a) autor(a)
\newcommand{\PrenomeDoOutroAutor}[1]{\providecommand{\imprimirprenomedooutroautor}{#1}}%% Prenome do(a) outro(a) autor(a)
\newcommand{\AtribuicaoOrientador}[1]{\providecommand{\imprimiratribuicaoorientador}{#1}}%% Atribuição "orientador(a)"
\newcommand{\TituloDoOrientador}[1]{\providecommand{\imprimirtitulodoorientador}{#1}}%% Título do(a) orientador(a)
\newcommand{\NomeDoOrientador}[1]{\providecommand{\imprimirnomedoorientador}{#1}}%% Nome completo do(a) orientador(a)
\newcommand{\SobrenomeDoOrienador}[1]{\providecommand{\imprimirsobrenomedoorientador}{#1}}%% Sobrenome do(a) orientador(a)
\newcommand{\PrenomeDoOrientador}[1]{\providecommand{\imprimirprenomedoorientador}{#1}}%% Prenome do(a) orientador(a)
\newcommand{\AtribuiCoorientador}[1]{\providecommand{\imprimiratribuicoorientador}{#1}}%% Insere ou remove o(a) coorientador(a)
\newcommand{\AtribuicaoCoorientador}[1]{\providecommand{\imprimiratribuicaocoorientador}{#1}}%% Atribuição "coorientador(a)"
\newcommand{\TituloDoCoorientador}[1]{\providecommand{\imprimirtitulodocoorientador}{#1}}%% Título do(a) coorientador(a)
\newcommand{\NomeDoCoorientador}[1]{\providecommand{\imprimirnomedocoorientador}{#1}}%% Nome completo do(a) coorientador(a)
\newcommand{\SobrenomeDoCoorienador}[1]{\providecommand{\imprimirsobrenomedocoorientador}{#1}}%% Sobrenome do(a) coorientador(a)
\newcommand{\PrenomeDoCoorientador}[1]{\providecommand{\imprimirprenomedocoorientador}{#1}}%% Prenome do(a) coorientador(a)
\newcommand{\Institution}[1]{\providecommand{\printinstitution}{#1}}%% Institution name
\newcommand{\Cidade}[1]{\providecommand{\imprimircidade}{#1}}%% Nome da cidade (câmpus)
\newcommand{\Diretoria}[1]{\providecommand{\imprimirdiretoria}{Diretoria de #1}}%% Diretoria
\newcommand{\Departamento}[1]{\providecommand{\imprimirdepartamento}{#1}}%% Nome do departamento
\newcommand{\Curso}[1]{\providecommand{\imprimircurso}{#1}}%% Nome do curso
\newcommand{\Course}[1]{\providecommand{\printcourse}{#1}}%% Course name
\newcommand{\AreaDeConcentracao}[1]{\providecommand{\imprimirareadeconcentracao}{#1}}%% Nome da área de concentração
\newcommand{\TituloDoResponsavelTCC}[1]{\providecommand{\imprimirtitulodoresponsaveltcc}{#1}}%% Título do(a) responsável pelos TCC
\newcommand{\NomeDoResponsavelTCC}[1]{%% Nome completo do(a) responsável pelos TCC
  \providecommand{\imprimirnomedoresponsaveltcc}{#1}%%
}
\newcommand{\AtribuicaoCoordenador}[1]{\providecommand{\imprimiratribuicaocoordenador}{#1}}%% Atribuição "coordenador(a)" do curso
\newcommand{\TituloDoCoordenador}[1]{\providecommand{\imprimirtitulodocoordenador}{#1}}%% Título do(a) coordenador(a) do curso
\newcommand{\NomeDoCoordenador}[1]{\providecommand{\imprimirnomedocoordenador}{#1}}%% Nome completo do(a) coordenador(a) do curso
\newcommand{\SiglaDoPPG}[1]{\providecommand{\imprimirsigladoppg}{#1}}%% Logo do programa de pós-graduação
\newcommand{\MembroAIgualOrientador}[1]{\providecommand{\imprimirmembroaigualorientador}{#1}}%% Membro A igual ao(à) orientador(a)
\newcommand{\MembroA}[1]{\providecommand{\imprimirmembroa}{#1}}%% Nome completo do membro A
\newcommand{\TituloDoMembroA}[1]{\providecommand{\imprimirtitulodomembroa}{#1}}%% Título do membro A
\newcommand{\InstituicaoDoMembroA}[1]{\providecommand{\imprimirinstituicaodomembroa}{#1}}%% Nome da instituição do membro A
\newcommand{\MembroB}[1]{\providecommand{\imprimirmembrob}{#1}}%% Nome completo do membro B
\newcommand{\TituloDoMembroB}[1]{\providecommand{\imprimirtitulodomembrob}{#1}}%% Título do membro B
\newcommand{\InstituicaoDoMembroB}[1]{\providecommand{\imprimirinstituicaodomembrob}{#1}}%% Nome da instituição do membro B
\newcommand{\MembroC}[1]{\providecommand{\imprimirmembroc}{#1}}%% Nome completo do membro C
\newcommand{\TituloDoMembroC}[1]{\providecommand{\imprimirtitulodomembroc}{#1}}%% Título do membro C
\newcommand{\InstituicaoDoMembroC}[1]{\providecommand{\imprimirinstituicaodomembroc}{#1}}%% Nome da instituição do membro C
\newcommand{\MembroD}[1]{\providecommand{\imprimirmembrod}{#1}}%% Nome completo do membro D
\newcommand{\TituloDoMembroD}[1]{\providecommand{\imprimirtitulodomembrod}{#1}}%% Título do membro D
\newcommand{\InstituicaoDoMembroD}[1]{\providecommand{\imprimirinstituicaodomembrod}{#1}}%% Nome da instituição do membro D
\newcommand{\MembroE}[1]{\providecommand{\imprimirmembroe}{#1}}%% Nome completo do membro E
\newcommand{\TituloDoMembroE}[1]{\providecommand{\imprimirtitulodomembroe}{#1}}%% Título do membro E
\newcommand{\InstituicaoDoMembroE}[1]{\providecommand{\imprimirinstituicaodomembroe}{#1}}%% Nome da instituição do membro E
\newcommand{\AtribuiMembroF}[1]{\providecommand{\imprimiratribuimembrof}{#1}}%% Insere ou remove o membro F
\newcommand{\MembroF}[1]{\providecommand{\imprimirmembrof}{#1}}%% Nome completo do membro F
\newcommand{\TituloDoMembroF}[1]{\providecommand{\imprimirtitulodomembrof}{#1}}%% Título do membro F
\newcommand{\InstituicaoDoMembroF}[1]{\providecommand{\imprimirinstituicaodomembrof}{#1}}%% Nome da instituição do membro F
\newcommand{\AtribuiMembroG}[1]{\providecommand{\imprimiratribuimembrog}{#1}}%% Insere ou remove o membro G
\newcommand{\MembroG}[1]{\providecommand{\imprimirmembrog}{#1}}%% Nome completo do membro G
\newcommand{\TituloDoMembroG}[1]{\providecommand{\imprimirtitulodomembrog}{#1}}%% Título do membro G
\newcommand{\InstituicaoDoMembroG}[1]{\providecommand{\imprimirinstituicaodomembrog}{#1}}%% Nome da instituição do membro G
\newcommand{\Dia}[1]{\providecommand{\imprimirdia}{#1}}%% Dia com número de dígitos exatos
\newcommand{\MesPorExtenso}[1]{\providecommand{\imprimirmesporextenso}{#1}}%% Mês por extenso
\newcommand{\Ano}[1]{\providecommand{\imprimirano}{#1}}%% Ano com quatro dígitos
\newcommand{\NumeroDePalavrasChave}[1]{\providecommand{\imprimirnumerodepalavraschave}{#1}}%% Número de palavras-chave (máximo 5)
\newcommand{\PalavraChaveA}[1]{\providecommand{\imprimirpalavrachavea}{#1}}%% Palavra-chave A
\newcommand{\PalavraChaveB}[1]{\providecommand{\imprimirpalavrachaveb}{#1}}%% Palavra-chave B
\newcommand{\PalavraChaveC}[1]{\providecommand{\imprimirpalavrachavec}{#1}}%% Palavra-chave C
\newcommand{\PalavraChaveD}[1]{\providecommand{\imprimirpalavrachaved}{#1}}%% Palavra-chave D
\newcommand{\PalavraChaveE}[1]{\providecommand{\imprimirpalavrachavee}{#1}}%% Palavra-chave E
\newcommand{\NumeroDeKeywords}[1]{\providecommand{\imprimirnumerodekeywords}{#1}}%% Número de keywords (máximo 5)
\newcommand{\KeywordA}[1]{\providecommand{\imprimirkeyworda}{#1}}%% Keyword A
\newcommand{\KeywordB}[1]{\providecommand{\imprimirkeywordb}{#1}}%% Keyword B
\newcommand{\KeywordC}[1]{\providecommand{\imprimirkeywordc}{#1}}%% Keyword C
\newcommand{\KeywordD}[1]{\providecommand{\imprimirkeywordd}{#1}}%% Keyword D
\newcommand{\KeywordE}[1]{\providecommand{\imprimirkeyworde}{#1}}%% Keyword E
\newcommand{\imprimirppgoudepartamento}{%% Programa de pós-graduação ou departamento
  \ifthenelse{\equal{\imprimirtipodedocumento}{Tese}\or\equal{\imprimirtipodedocumento}{Dissertação}}%% Tese ou dissertação
  {Programa de Pós-Graduação em \imprimircurso}%% Programa de pós-graduação
  {\imprimirdepartamento}%% Departamento
}
\let\Instituicao\instituicao%% Instituição

%% Informações nas propriedades do documento do arquivo pdf
\AtBeginDocument{%% Definições carregadas no início do documento
  \ifthenelse{\imprimirnumerodepalavraschave > 0}%% Palavra-chave A
    {\newcommand{\pdfkeyworda}{\imprimirpalavrachavea}}%%
    {\newcommand{\pdfkeyworda}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 1}%% Palavra-chave B
    {\newcommand{\pdfkeywordb}{. \imprimirpalavrachaveb}}%%
    {\newcommand{\pdfkeywordb}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 2}%% Palavra-chave C
    {\newcommand{\pdfkeywordc}{. \imprimirpalavrachavec}}%%
    {\newcommand{\pdfkeywordc}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 3}%% Palavra-chave D
    {\newcommand{\pdfkeywordd}{. \imprimirpalavrachaved}}%%
    {\newcommand{\pdfkeywordd}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 4}%% Palavra-chave E
    {\newcommand{\pdfkeyworde}{. \imprimirpalavrachavee}}%%
    {\newcommand{\pdfkeyworde}{}}%%
  \ifthenelse{\imprimirnumerodepalavraschave > 0}%% Ponto final
    {\newcommand{\pdfkeywordfinalpoint}{.}}%%
    {\newcommand{\pdfkeywordfinalpoint}{}}%%
  % Luiz: pdfa: comentado para remover os warnnings do pdfa - ficava duplicado
  %\hypersetup{%% Propriedades do documento do arquivo pdf
  %  pdftitle={\@title},%% Título
  %  pdfauthor={\@author},%% Autor
  %  pdfsubject={\imprimirtipodedocumento} de {\imprimirniveldeformacao},%% Descrição
  %  pdfkeywords={{\pdfkeyworda}{\pdfkeywordb}{\pdfkeywordc}{\pdfkeywordd}{\pdfkeyworde}{\pdfkeywordfinalpoint}},%% Palavras-chave
  %}
}

%% Configuração de fontes
\RequirePackage{times}%% Seleção da fonte Adobe Times Roman (ou equivalente) como fonte padrão

\renewcommand{\rmdefault}{ptm}%% Fonte Adobe Times
\renewcommand{\sfdefault}{phv}%% Fonte Adobe Helvetica
\renewcommand{\ttdefault}{pcr}%% Fonte Adobe Courier


\ifthenelse{\equal{\familydefault}{\sfdefault}}{%% Fonte arial com fator de escala de 1.0 (fonte principal arial)
  \RequirePackage{helvet}%% Seleção da fonte Arial (ou equivalente) como fonte padrão
  % \RequirePackage{sfmath}%% Fonte Helvetica no modo matemático
}{%% Fonte arial com fator de escala de 0.9 (fonte principal times)
  \RequirePackage[scaled=0.9]{helvet}%% Seleção da fonte Arial (ou equivalente) como fonte padrão
}
\normalsize%% Tamanho padrão de fonte
%%luiz - removi isso, se não partes do texto ficavam com fontes distintas (removi em outras partes também).
%\renewcommand{\ABNTEXpartfont}{\fontfamily{\@tipodefonte}\bfseries}%% Estilo da fonte da parte
\renewcommand{\ABNTEXpartfont}{\bfseries}%% Estilo da fonte da parte
\renewcommand{\ABNTEXpartfont}{\bfseries}%% Estilo da fonte da parte
%%
\renewcommand{\ABNTEXpartfontsize}{\normalsize}%% Tamanho da fonte da parte
\renewcommand{\ABNTEXchapterfont}{\ABNTEXpartfont}%% Estilo da fonte do capítulo
\renewcommand{\ABNTEXchapterfontsize}{\ABNTEXpartfontsize}%% Tamanho da fonte do capítulo
% Luiz: alterado para a seção ser negrito
\renewcommand{\ABNTEXsectionfont}{\normalfont\bfseries}%% Estilo da fonte da seção
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}%% Tamanho da fonte da seção
\renewcommand{\ABNTEXsubsectionfont}{\ABNTEXsectionfont}%% Estilo da fonte da subseção
% Luiz: alterado para a subseção não ser negrito
\renewcommand{\ABNTEXsubsectionfontsize}{\ABNTEXsectionfontsize\normalfont}%% Tamanho da fonte da subseção
\renewcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont}%% Estilo da fonte da subsubseção
\renewcommand{\ABNTEXsubsubsectionfontsize}{\ABNTEXsubsectionfontsize}%% Tamanho da fonte da subsubseção

%% Formatação das páginas no documento
\let\newtextual\textual%% Elementos textuais
\let\newpretextual\pretextual%% Elementos pré-textuais
\if@twoside%% Estilo de impressão para elementos textuais e pós-textuais (anverso e verso)
  \renewcommand{\textual}{\setboolean{@twoside}{true}\glsresetall\newtextual}%% Redefinição dos elementos textuais
\else%% Estilo de impressão para elementos textuais e pós-textuais (anverso)
  \renewcommand{\textual}{\setboolean{@twoside}{false}\glsresetall\newtextual}%% Redefinição dos elementos textuais
\fi
\if@pretexttwoside%% Estilo de impressão para elementos pré-textuais (anverso e verso)
  \renewcommand{\pretextual}{\setboolean{@twoside}{true}\newpretextual}%% Redefinição dos elementos pré-textuais
\else%% Estilo de impressão para elementos pré-textuais (anverso)
  \renewcommand{\pretextual}{\setboolean{@twoside}{false}\newpretextual}%% Redefinição dos elementos pré-textuais
\fi

%% tamanho fonte do número de páginas
% \renewcommand{\footnotesize}{\small}

%% Formatação e espaçamentos nas páginas
\newgeometry{%
  top      = 30mm,%
  left     = 30mm,%
  right    = 20mm,%
  bottom   = 20mm,%
  head     = 10mm,%
  headsep  = 10mm,%
  footskip = 5mm,%
}%
\savegeometry{standard}
\AtBeginDocument{%
  \ifthenelse{\equal{\imprimirtipodedocumento}{Tese}\or\equal{\imprimirtipodedocumento}{Dissertação}}{%
    \newgeometry{%
      top         = 30mm,%
      left        = 30mm,%
      right       = 20mm,%
      bottom      = 20mm,%
      head        = 20mm,%
      headsep     = 0mm,%
      footskip    = 5mm,%
      includehead = true,%
    }%
  }{%
    \newgeometry{%
      top         = 30mm,%
      left        = 30mm,%
      right       = 20mm,%
      bottom      = 20mm,%
      head        = 25mm,%
      headsep     = 0mm,%
      footskip    = 5mm,%
      includehead = true,%
    }%
  }%
  \savegeometry{approvalterm}%
  \loadgeometry{standard}%
}
\frenchspacing%% Remoção de espaço adicional após ponto final
\raggedbottom%% Remoção de espaços adicionais no texto
\sloppy%% Força todas as linhas ficarem dentro das margens
\newlength{\linha}%% Escala linha
\setlength{\linha}{\baselineskip}%% Espessura da escala linha
\setlength{\parskip}{0pt}%% Espaçamento entre parágrafos
\setlength{\parindent}{12.5mm}%% Recuo dos parágrafos
% \setlength{\hoffset}{-1in}%% Deslocamento horizontal
% \setlength{\voffset}{-1in}%% Deslocamento vertical
% \setlength{\headheight}{\linha}%% Espessura do cabeçalho
% \setlength{\headsep}{10mm}%% Espaçamento entre texto e cabeçalho
% \setlength{\footskip}{5mm}%% Espaçamento entre texto e rodapé
% \setlength{\topmargin}{30mm-\headsep-\headheight}%% Margem superior
% \setlength{\oddsidemargin}{30mm}%% Margem lateral da página impar
% \setlength{\evensidemargin}{20mm}%% Margem lateral da página par
% \setlength{\marginparsep}{0pt}%% Espaçamento horizontal entre a margem e a nota de margem
% \setlength{\marginparpush}{0pt}%% Espaçamento vertical mínimo entre duas notas de margem
% \setlength{\marginparwidth}{0pt}%% Largura da nota de margem
\setlength{\abovecaptionskip}{1pt}%% Espaçamento acima da legenda
\setlength{\belowcaptionskip}{1pt}%% Espaçamento abaixo da legenda
\if@fleqn\setlength{\mathindent}{\parindent}\fi%% Recuo dos parágrafos de equações alinhadas à esquerda (em ambiente matemático)
\renewcommand{\baselinestretch}{1.5}%% Espaçamento entre linhas (1, 1,5 ou 2)

%% Formatação dos cabeçalhos
\makepagestyle{abntheadings}%% Cabeçalho
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{}%% Formatação do cabeçalho (par)
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}%% Formatação do cabeçalho (ímpar)
\makeheadrule{abntheadings}{0pt}{\normalrulethickness}%% Formatação da regua do cabeçalho
\makepagestyle{abntchapfirst}%% Cabeçalho do início do capítulo
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}%% Formatação do cabeçalho do início do capítulo (ímpar)

%% luiz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title pages.
%
\RequirePackage{pdfpages}
\RequirePackage{lastpage}
\RequirePackage{chngpage}

\def\authorbib#1{\gdef\@authorbib{#1}}%
\def\@authorbib{\@latex@error{No \noexpand\authorbib given}\@ehc}%

\def\titleen#1{\gdef\@titleen{#1}}%
\def\@titleen{\@latex@error{No \noexpand\titleen given}\@ehc}%

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\coadvisor#1{\gdef\@coadvisor{#1}}%

\def\advisorsspacing#1{\gdef\@advisorsspacing{#1}}
\def\@advisorsspacing{.50}

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%

\def\addressen#1{\gdef\@addressen{#1}}%
\def\@addressen{\@latex@error{No \noexpand\addressen given}\@ehc}%

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\universityen#1{\gdef\@universityen{#1}}%
\def\@universityen{\@latex@error{No \noexpand\universityen given}\@ehc}%

\def\universitycampus#1{\gdef\@universitycampus{#1}}%
\def\@universitycampus{\@latex@error{No \noexpand\universitycampus given}\@ehc}%

\def\universityunit#1{\gdef\@universityunit{#1}}%
\def\@universityunit{\@latex@error{No \noexpand\universityunit given}\@ehc}%

\def\program#1{\gdef\@program{#1}}%
\def\@program{\@latex@error{No \noexpand\program given}\@ehc}%

\def\programen#1{\gdef\@programen{#1}}%
\def\@programen{\@latex@error{No \noexpand\programen given}\@ehc}%

\def\course#1{\gdef\@course{#1}}%
\def\@course{\@latex@error{No \noexpand\course given}\@ehc}%

\def\courseen#1{\gdef\@courseen{#1}}%
\def\@courseen{\@latex@warning{No \noexpand\courseen given}\@ehc}%

\def\depositshortdate#1{\gdef\@depositshortdate{#1}}%
\def\@depositshortdate{\@latex@error{No \noexpand\depositshortdate given}\@ehc}%

\def\approvaldate#1{\gdef\@approvaldate{#1}}%
\def\@approvaldate{\@latex@error{No \noexpand\approvaldate given}\@ehc}%


%CC
\def\licenca#1{\gdef\@licenca{#1}}%
\def\@licenca{\@latex@error{No \noexpand\licenca given}\@ehc}%

\def\goal#1{\gdef\@goal{#1}}%
\def\@goal{\@latex@error{No \noexpand\goal given}\@ehc}%

\def\goalen#1{\gdef\@goalen{#1}}%
\def\@goalen{\@latex@warning{No \noexpand\goalen given}\@ehc}%

\def\degree#1{\gdef\@degree{#1}}%
\def\@degree{\@latex@error{No \noexpand\degree given}\@ehc}%

\def\degreeen#1{\gdef\@degreeen{#1}}%
\def\@degreeen{\@latex@warning{No \noexpand\degreeen given}\@ehc}%

\def\degreetype#1{\gdef\@degreetype{#1}}%
\def\@degreetype{\@latex@error{No \noexpand\degreetype given}\@ehc}%

\def\documenttype#1{\gdef\@documenttype{#1}}%
\def\@documenttype{\@latex@error{No \noexpand\documenttype given}\@ehc}%

\def\documenttypeen#1{\gdef\@documenttypeen{#1}}%
\def\@documenttypeen{\@latex@error{No \noexpand\documenttypeen given}\@ehc}%

\def\degreearea#1{\gdef\@degreearea{#1}}%
\def\@degreearea{\@latex@error{No \noexpand\degreearea given}\@ehc}%

\def\degreeareaen#1{\gdef\@degreeareaen{#1}}%
\def\@degreeareaen{\@latex@warning{No \noexpand\degreeareaen given}\@ehc}%

\newcommand{\advisorlabel}{Orientador}
\newcommand{\coadvisorlabel}{Coorientador}

% Capa, conforme modelo em https://nuvem.utfpr.edu.br/index.php/s/QMqXIH2iVMlXSKi
%
\newcommand{\coverpageone}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\centering
		{
			\singlespacing
			\large\textbf{\allcaps{\@university}}\\
			% \large\allcaps{\@universitycampus}\\
			% \large\allcaps{\@universityunit}\\
			\ifthenelse{\equal{Mestrado}{\degree{}}}{\large\allcaps{\@program}}
            \par	
		}
		%\vspace{56pt}
		\vspace{45mm}
		{
			%\singlespacing
			\large\textbf{\allcaps{\@author}}\\
		}
		%\vfill
		\vspace{60mm}
		{
			\singlespacing
			\large\textbf{\allcaps{\@title}} \par 
		}
		\vfill
		\large\textbf{\allcaps{\@address}}\par
		\large\textbf{\allcaps{\@depositshortdate}}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
}
%% luiz

%% luiz folha rosto e com licença
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE ROSTO 

\newcommand{\esporient}[2]
{
	\leftskip 0em
	\@tempdima 5.0em
	\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{#1#2\hfil}
}

\newcommand{\@goalfulltext}{
	\@latex@error{No \noexpand\goalfulltext given}\@ehc
}

\renewcommand{\@goalfulltext}{
    \ifthenelse{\equal{Mestrado}{\degree{}}}{
    	\@goal{} apresentado como requisito para obtenção do título de \@degree{}
        em \@degreearea{} do \@program{} da \@university{}.
    }{
    	\@goal{} apresentado à disciplina de \@course, do \@program{} do \@universityunit{}
        da \@university{}, como requisito parcial para obtenção do título de \@degree{}
        em \@degreearea{}.
    }
}

% Creative Commons
\RequirePackage[scale=2]{ccicons}

% Criar tabela CC na folha de rosto
% #1: figura (comando que insere a figura da licença)
% #2: Texto da licença
% #3: tamanho da figura
% #4: link da licença CC
\newcommand{\licencaCCTabela}[4]{
    \begin{tabular}[t]{@{}p{#3}@{}p{13.2cm}@{}}
        \setstretch{.8}
        \centering \includegraphics[scale=0.6]{./dados-modelo/creative-commons/#1} & \multirow{2}{*}{\setstretch{.9} \small \begin{tabular}{p{13.2cm}}\vspace{-1.2cm}#2\end{tabular}} \\
        \centering \vspace{-0.7cm} \href{#4}{~\textcolor{blue}{\small\underline{4.0 Internacional}}} &
    \end{tabular}
}
% luiz: old
% \newcommand{\licencaCCTabela}[4]{
%     \begin{tabular}[t]{@{}p{#3}@{}p{13.2cm}@{}}
%         \setstretch{.8}
%         \centering #1 & \multirow{2}{*}{\setstretch{.9} \small \begin{tabular}{p{13.2cm}}\vspace{-.7cm}#2\end{tabular}} \\
%         \centering \href{#4}{~\textcolor{blue}{\small\underline{\textit{4.0 International}}}} &
%     \end{tabular}
% }


\newboolean{default}
\newcommand{\case}{}
\newcommand{\default}{}
\newenvironment{switch}[1]{%
    \setboolean{default}{true}
    \renewcommand{\case}[2]{\ifthenelse{\equal{#1}{##1}}{%
        \setboolean{default}{false}##2}{}}%
    \renewcommand{\default}[1]{\ifthenelse{\boolean{default}}{##1}{}}
}{}

\newcommand{\printlicense}[1]{
  \begin{switch}{#1}  
    \case{ccby}{\licencaCCTabela{by}{Esta licença permite compartilhamento, remixe, adaptação e criação a partir do trabalho, mesmo para fins comerciais, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}{3.2cm}{https://creativecommons.org/licenses/by/4.0/deed.pt_BR}}  
    \case{ccbysa}{\licencaCCTabela{by-sa}{Esta licença permite remixe, adaptação e criação a partir do trabalho, mesmo para fins comerciais, desde que sejam atribuídos créditos ao(s) autor(es) e que licenciem as novas criações sob termos idênticos. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}{3.2cm}{https://creativecommons.org/licenses/by-sa/4.0/deed.pt_BR}}
    \case{ccbynd}{\licencaCCTabela{by-nd}{Esta licença permite compartilhamento do trabalho, mesmo para fins comerciais, sem a possibilidade de alterá-lo, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}{3.2cm}{https://creativecommons.org/licenses/by-nd/4.0/deed.pt_BR}} 
    \case{ccbync}{\licencaCCTabela{by-nc}{Esta licença permite remixe, adaptação e criação a partir do trabalho, para fins não comerciais, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}{3.2cm}{https://creativecommons.org/licenses/by-nc/4.0/deed.pt_BR}} 
    \case{ccbyncsa}{\licencaCCTabela{by-nc-sa}{Esta licença permite remixe, adaptação e criação a partir do trabalho, para fins não comerciais, desde que sejam atribuídos créditos ao(s) autor(es) e que licenciem as novas criações sob termos idênticos. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}{3.2cm}{https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt_BR}} 
    \case{ccbyncnd}{\licencaCCTabela{by-nc-nd}{Esta licença permite download e compartilhamento do trabalho desde que sejam atribuídos créditos ao(s) autor(es), sem a possibilidade de alterá-lo ou utilizá-lo para fins comerciais. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}{3.2cm}{https://creativecommons.org/licenses/by-nc-nd/4.0/deed.pt_BR}} 
    \default{
    % deixar sem licença, pois alguns trabalhos já foram enviados sem licença para a biblioteca.
    %\licencaCCTabela{\ccby}{Licença Creative Commons 4.0: CC BY - Esta licença permite que outros distribuam, remixem, adaptem e criem a partir do trabalho, mesmo para fins comerciais, desde que atribuam o devido crédito pela criação original.}{1.5cm}
    }  
  \end{switch}
}

% Folha de rosto conforme modelo em https://cloud.utfpr.edu.br/index.php/s/ikVG7RiFjfE3PWI
%
\newcommand{\coverpagetwo}
{
    \cleardoublepage
    % luiz - iniciar contagem depois da folha de rosto
    \setcounter{page}{1}
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\begin{center}
				\singlespacing
				\large\textbf{\allcaps{\@author}}\\
		\end{center}
		\vfill
		\begin{center}
			\large\textbf{\allcaps{\@title}}\par
		\end{center}
		\vspace{1cm}
		\begin{center}
			\large\textbf{\@titleen}\par
		\end{center}

		\vspace{60pt}
		\hfill\begin{minipage}{\@advisorsspacing\textwidth}
				\singlespacing
				\hyphenpenalty=10000
				\@goalfulltext\par
				\vspace{-.3cm}
				\esporient{\numberline{\advisorlabel:}}{\hspace{3pt}\@advisor}\par
				\@ifundefined{@coadvisor}{}{
					\vspace{-8pt}
					\esporient{\numberline{\coadvisorlabel:}}{\hspace{15pt}\@coadvisor}\par
				}
		\end{minipage}
		\vfill
		\begin{center}
			\textbf{\allcaps{\@address}}\par
			\textbf{\@depositshortdate}\par
			\vspace{1cm}
			\printlicense{\@licenca}
		\end{center}
	\end{adjustwidth}
}

\newcommand{\printevalboard}{}
\newcommand{\evalboardmember}[3]{
    \g@addto@macro\printevalboard{
        \vspace{.4cm}
        \begin{singlespacing}
            \par\noindent\rule{.8\textwidth}{0.4pt}\\
            #1\\
            #2\\
            #3\\
        \end{singlespacing}
    }
}
%%


%% Errata
\let\errataoriginal\errata%% Formatação do ambiente errata (original)
\renewenvironment{errata}{%% Formatação do ambiente errata
  \begin{errataoriginal}%% Ambiente errata (original)
    \vspace*{0.5\linha}%% Espaçamento vertical
    \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
      \begin{flushleft}%% Alinhamento à esquerda
        \MakeUppercase{\imprimirsobrenomedoautor}, \imprimirprenomedoautor
        \ifthenelse{\equal{\imprimiratribuioutroautor}{true}}%% Verificação do(a) outro(a) autor(a)
          {; \MakeUppercase{\imprimirsobrenomedooutroautor}, \imprimirprenomedooutroautor.}{.}
        {\bfseries\imprimirtitulododocumento\unskip}. \imprimirano. \pageref{LastPage}~f. \imprimirtipodedocumento\
        (\imprimirniveldeformacao\ em \imprimircurso) -- \imprimirinstituicao. \imprimircidade, \imprimirano.
      \end{flushleft}
}{%%
    \end{Spacing}
  \end{errataoriginal}
  \cleardoublepage%% Página de verso
}

%% luiz
% Folha de aprovação conforme https://nuvem.utfpr.edu.br/index.php/s/wnyqFDiIY6tXc9h
%
\newcommand{\approvalpage}
{
    \cleardoublepage
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\begin{center}
			\singlespacing
			\large\textbf{\allcaps{\@author}}\\
		\end{center}
		%\vspace{30mm}
		\vspace{15mm}
		\begin{center}
			\large\textbf{\allcaps{\@title}}\par
		\end{center}
		%\vspace{60pt}
		\vspace{10mm}
		\hfill\begin{minipage}{.5\textwidth}
				\singlespacing
				\hyphenpenalty=10000
				\@goalfulltext\par
		\end{minipage}
		%\vspace{15mm}
		\vspace{10mm}
		\begin{center}
		    {\large Data de aprovação: \@approvaldate}
		    \vspace{0,6cm}
		    \printevalboard
		\end{center}
		\vfill
		\begin{center}
			\textbf{\allcaps{\@address}}\par
			\textbf{\@depositshortdate}\par
		\end{center}
	\end{adjustwidth}
}
%% luiz - fim

%% Dedicatória
\let\dedicatoriaoriginal\dedicatoria%% Formatação do ambiente dedicatoria (original)
\renewenvironment{dedicatoria}{%% Formatação do ambiente dedicatoria
  \begin{dedicatoriaoriginal}%% Ambiente dedicatoria (original)
    \null
    \vfill
    \begin{flushright}%% Alinhamento à direita
      \begin{minipage}{0.5\textwidth}%% Caixa de texto
        \singlespacing
        \raggedleft
}{%%
      \end{minipage}
    \end{flushright}
    \vspace{2cm}
  \end{dedicatoriaoriginal}
}

%% Epígrafe
\let\epigrafeoriginal\epigrafe%% Formatação do ambiente epigrafe (original)
\renewenvironment{epigrafe}{%% Formatação do ambiente epigrafe
  \begin{epigrafeoriginal}%% Ambiente epigrafe (original)
    \vspace*{0.6\textheight}%% Espaçamento vertical
    \begin{flushright}%% Alinhamento à direita
      \begin{minipage}{0.5\textwidth}%% Caixa de texto
        \singlespacing
        \raggedleft
}{%%
      \end{minipage}
    \end{flushright}
  \end{epigrafeoriginal}
  \cleardoublepage%% Página de verso
}

%% Resumo
\AtBeginDocument{%% Definições carregadas no início do documento
  \renewcommand{\abstracttextfont}{\normalfont\normalsize}%% Fonte do texto do resumo
  \setlength{\absleftindent}{0pt}%% Recuo esquerdo do resumo
  \setlength{\absrightindent}{0pt}%% Recuo direito do resumo
  \setlength{\absparindent}{0pt}%% Recuo dos parágrafos do resumo
  \setlength{\absparsep}{-10pt}%% Espaçamento entre parágrafos
  %\setlength{\abstitleskip}{\linha}%% Espaçamento após o título do resumo
}
\newenvironment{resumoutfpr}{%% Formatação do ambiente resumoutfpr
  \begin{resumo}%% Ambiente resumo
    \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
      \begin{flushleft}%% Alinhamento à esquerda
      \end{flushleft}
      %\singlespacing
}{%%
      \\
      \par\textbf{\nomepalavraschave:}
      \ifthenelse{\imprimirnumerodepalavraschave > 0}{\imprimirpalavrachavea}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 1}{; \imprimirpalavrachaveb}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 2}{; \imprimirpalavrachavec}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 3}{; \imprimirpalavrachaved}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 4}{; \imprimirpalavrachavee}{}%%
      \ifthenelse{\imprimirnumerodepalavraschave > 0}{.}{}%%
    \end{Spacing}
  \end{resumo}
}

%% Abstract
\newenvironment{abstractutfpr}{%% Formatação do ambiente abstractutfpr
  \begin{resumo}[\nomeabstract]%% Ambiente resumo (abstract)
    \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
      \begin{flushleft}%% Alinhamento à esquerda
      \end{flushleft}
      %\singlespacing
}{%%
      \\
      \par\textbf{\nomekeywords:}
      \ifthenelse{\imprimirnumerodekeywords > 0}{\imprimirkeyworda}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 1}{; \imprimirkeywordb}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 2}{; \imprimirkeywordc}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 3}{; \imprimirkeywordd}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 4}{; \imprimirkeyworde}{}%%
      \ifthenelse{\imprimirnumerodekeywords > 0}{.}{}%%
    \end{Spacing}
  \end{resumo}
}

%% Lista de algoritmos
\newlistof{listofalgorithms}{loa}{\listalgorithmname}%% Lista de objetos flutuantes (algoritmos)
\newlistentry{algorithm}{loa}{0}%% Entrada da lista de objetos flutuantes (algoritmo)
\newfloat{algorithm}{loa}{\algorithmname}%% Objeto flutuante (algoritmo)
\renewcommand{\cftalgorithmname}{\algorithmname\space}%% Nome da entrada na lista de objetos flutuantes (algoritmo)
\renewcommand*{\cftalgorithmaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (algoritmo)
\renewcommand{\afterloatitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (algoritmo)
\setfloatadjustment{algorithm}{\centering}%% Ajuste do objeto flutuante (algoritmo)
\AtBeginEnvironment{algorithmic}{\ABNTEXfontereduzida}%% Formatação do ambiente algorithmic
\newcommand{\incluirlistadealgoritmos}{%% Definição do comando para inclusão da lista de algoritmos
  \pdfbookmark[0]{\listalgorithmname}{loa}%% Marcador
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \listofalgorithms*%% Impressão da lista de algoritmos
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%% Listagem de Códigos fonte
\usepackage{listings}
\lstset{ 
  numbers=left,
  numberstyle=\small,
  basicstyle=\small,
  keepspaces=true,
  showspaces=false, 
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
  aboveskip=0.75em,
  belowcaptionskip=0em,
  belowskip=0em,
  literate=
    {á}{{\'a}}1
    {à}{{\`a}}1
    {ã}{{\~a}}1
    {é}{{\'e}}1
    {ê}{{\^e}}1
    {í}{{\'i}}1
    {ó}{{\'o}}1
    {õ}{{\~o}}1
    {ú}{{\'u}}1
    {ü}{{\"u}}1
    {ç}{{\c{c}}}1
}
\newfloat[chapter]{sourcecode}{loc}{\sourcecodename}
\newlistof{listofsourcecodes}{loc}{\listofsourcecodesname}
\newlistentry{sourcecode}{loc}{0}

% configurações para atender às regras da ABNT
\setfloatadjustment{sourcecode}{\centering}
\counterwithout{sourcecode}{chapter}
\renewcommand{\cftsourcecodename}{\sourcecodename\space} 
\renewcommand*{\cftsourcecodeaftersnum}{\hfill--\hfill}

\newcommand{\incluirlistadecodigosfonte}{%% Definição do comando para inclusão da lista de ilustrações
  \pdfbookmark[0]{\listofsourcecodesname}{loc}%% Marcador
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \listofsourcecodes*
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

% luiz - lista figura negrito
\renewcommand{\cftfigurepagefont}{\bfseries}
\renewcommand{\cftfigurefont}{\bfseries}
% lista tabelas em negrito
\renewcommand{\cfttablepagefont}{\bfseries}
\renewcommand{\cfttablefont}{\bfseries}
% lista de código fonte em negrito
\renewcommand{\cftsourcecodepagefont}{\bfseries}
\renewcommand{\cftsourcecodefont}{\bfseries}


%% Lista de Figuras
% \renewcommand{\cftfigurename}{\figurename\space}%% Nome da entrada na lista de objetos flutuantes (figura)
\renewcommand*{\cftfigureaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (figura)
\renewcommand{\afterloftitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (figura)
\setfloatadjustment{figure}{\centering}%% Ajuste do objeto flutuante (figura)
%\newlistof{listofphotographs}{lop}{}%% Lista de objetos flutuantes (fotografia)
%\newlistentry{photograph}{lop}{0}%% Entrada da lista de objetos flutuantes (fotografia)
%\newfloat{photograph}{lop}{\photographname}%% Objeto flutuante (fotografia)
%\renewcommand{\cftphotographname}{\photographname\space}%% Nome da entrada na lista de objetos flutuantes (fotografia)
%\renewcommand*{\cftphotographaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (fotografia)
%\renewcommand{\afterloptitle}{}%% Espaçamento após o título da lista (fotografia)
%\setfloatadjustment{photograph}{\centering}%% Ajuste do objeto flutuante (fotografia)
%\newlistof{listofgraphs}{loh}{}%% Lista de objetos flutuantes (gráfico)
%\newlistentry{graph}{loh}{0}%% Entrada da lista de objetos flutuantes (gráfico)
%\newfloat{graph}{loh}{\graphname}%% Objeto flutuante (gráfico)
%\renewcommand{\cftgraphname}{\graphname\space}%% Nome da entrada na lista de objetos flutuantes (gráfico)
%\renewcommand*{\cftgraphaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (gráfico)
%\renewcommand{\afterlohtitle}{}%% Espaçamento após o título da lista (gráfico)
%\setfloatadjustment{graph}{\centering}%% Ajuste do objeto flutuante (gráfico)
\newcommand{\incluirlistadeilustracoes}{%% Definição do comando para inclusão da lista de ilustrações
  \pdfbookmark[0]{\listfigurename}{lof}%% Marcador
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \listoffigures*%% Impressão da lista de figuras
    
    %% Lista de fotografias e gráficos estão separadas
    %\section*{Fotografias}%% Seção fotografias
    %\listofphotographs*%% Impressão da lista de fotografias
    %\section*{Gráficos}%% Seção gráficos
    %\listofgraphs*%% Impressão da lista de gráficos
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%% Lista de Fotografias
%\newfloat[chapter]{sourcecode}{loc}{\sourcecodename}
%\newlistof{listofsourcecodes}{loc}{\listofsourcecodesname}
%\newlistentry{sourcecode}{loc}{0}


\newlistof{listofphotographs}{lop}{\listphotographname}%% Lista de objetos flutuantes (fotografia)
\newlistentry{photograph}{lop}{0}%% Entrada da lista de objetos flutuantes (fotografia)
\newfloat{photograph}{lop}{\photographname}%% Objeto flutuante (fotografia)
\renewcommand{\cftphotographname}{\photographname\space}%% Nome da entrada na lista de objetos flutuantes (fotografia)
\renewcommand*{\cftphotographaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (fotografia)
\renewcommand{\afterloftitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (fotografia)
\setfloatadjustment{photograph}{\centering}%% Ajuste do objeto flutuante (fotografia)

% luiz - lista de fotografias em negrito
\renewcommand{\cftphotographpagefont}{\bfseries}
\renewcommand{\cftphotographfont}{\bfseries}

\newcommand{\incluirlistadefotografias}{%% Definição do comando para inclusão da lista de ilustrações
  \pdfbookmark[0]{\listphotographname}{lop}%% Marcador
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \listofphotographs*%% Impressão da lista de fotografias
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%% Lista de Gráficos
\newlistof{listofgraphs}{loh}{\listgraphname}%% Lista de objetos flutuantes (gráfico)
\newlistentry{graph}{loh}{0}%% Entrada da lista de objetos flutuantes (gráfico)
\newfloat{graph}{loh}{\graphname}%% Objeto flutuante (gráfico)
\renewcommand{\cftgraphname}{\graphname\space}%% Nome da entrada na lista de objetos flutuantes (gráfico)
\renewcommand*{\cftgraphaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (gráfico)
\renewcommand{\afterloftitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (gráfico)
\setfloatadjustment{graph}{\centering}%% Ajuste do objeto flutuante (gráfico)

% luiz - lista de gráficos em negrito
\renewcommand{\cftgraphpagefont}{\bfseries}
\renewcommand{\cftgraphfont}{\bfseries}

\newcommand{\incluirlistadegraficos}{%% Definição do comando para inclusão da lista de ilustrações
  \pdfbookmark[0]{\listgraphname}{loh}%% Marcador
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \listofgraphs*%% Impressão da lista de fotografias
  \end{Spacing}
  \cleardoublepage%% Página de verso
}



%% Lista de quadros
\newlistof{listoftabframeds}{lod}{\listtabframedname}{}%% Lista de objetos flutuantes (quadro)
\newlistentry{tabframed}{lod}{0}%% Entrada da lista de objetos flutuantes (quadro)
\newfloat{tabframed}{lod}{\tabframedname}%% Objeto flutuante (quadro)
\renewcommand{\cfttabframedname}{\tabframedname\space}%% Nome da entrada na lista de objetos flutuantes (quadro)
\renewcommand*{\cfttabframedaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (quadro)
\renewcommand{\afterlodtitle}{}%% Espaçamento após o título da lista (quadro)
\setfloatadjustment{tabframed}{\centering}%% Ajuste do objeto flutuante (quadro)
\renewcommand*{\cfttabframedaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (quadro)
\renewcommand{\afterlodtitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (quadro)
\setfloatadjustment{tabframed}{\centering}%% Ajuste do objeto flutuante (quadro)

% luiz - lista de quadros em negrito
\renewcommand{\cfttabframedpagefont}{\bfseries}
\renewcommand{\cfttabframedfont}{\bfseries}

\newcommand{\incluirlistadequadros}{%% Definição do comando para inclusão da lista de quadros
  \pdfbookmark[0]{\listtabframedname}{lod}%% Marcador
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \listoftabframeds*%% Impressão da lista de quadros
  \end{Spacing}
  \cleardoublepage%% Página de verso
}


%% Lista de tabelas
% \renewcommand{\cfttablename}{\tablename\space}%% Nome da entrada na lista de objetos flutuantes (tabela)
\renewcommand*{\cfttableaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (tabela)
\renewcommand{\afterlottitle}{\afterchaptertitle\vspace*{0.5\linha}}%% Espaçamento após o título da lista (tabela)
\setfloatadjustment{table}{\centering}%% Ajuste do objeto flutuante (tabela)
\AtBeginEnvironment{tabular}{\ABNTEXfontereduzida}%% Formatação do ambiente tabular
\AtBeginEnvironment{tabularx}{\ABNTEXfontereduzida}%% Formatação do ambiente tabularx
\AtBeginEnvironment{longtable}{\linespread{1}\ABNTEXfontereduzida}%% Formatação do ambiente longtable
\setlength\LTcapwidth{\textwidth}%% Largura do \parbox contendo a legenda do ambiente longtable
\setlength\LTleft{0pt}%% Largura da margem esquerda do ambiente longtable
\setlength\LTright{0pt}%% Largura da margem direita do ambiente longtable
\newcommand{\incluirlistadetabelas}{%% Definição do comando para inclusão da lista de tabelas
  \pdfbookmark[0]{\listtablename}{lot}%% Marcador
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \listoftables*%% Impressão da lista de tabelas
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%% Lista de abreviaturas, siglas e acrônimos (configuração do arquivo ./PreTexto/lista-acronimos.tex)
\newcommand{\listadeabrevsiglaseacr}{%% Formatação da lista de abreviaturas, siglas e acrônimos
  \pretextualchapter{\nomelistadeacronimos}%% Estilo da página e marcador
  \vspace*{7.5pt}%% Espaçamento vertical
}
\newenvironment{listadeabreviaturas}{%% Formatação do ambiente listadeabreviaturas
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \section*{\nomeabreviaturas}%% Seção abreviaturas
    \begin{xtabular}{@{}p{25mm}@{}p{135mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadesiglas}{%% Formatação do ambiente listadesiglas
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \section*{\nomesiglas}%% Seção siglas
    \begin{xtabular}{@{}p{25mm}@{}p{135mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadeacronimos}{%% Formatação do ambiente listadeacronimos
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \section*{\nomeacronimos}%% Seção acrônimos
    \begin{xtabular}{@{}p{25mm}@{}p{135mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

%% Lista de abreviaturas, siglas e acrônimos (configuração do pacote glossaries)
\newcommand{\pseudoacronymtype}{sigla}%% Tipo de acrônimo (sigla)
\newcommand{\abbreviationtype}{abreviatura}%% Tipo de acrônimo (abreviatura)
\newglossary[alg2]{\pseudoacronymtype}{acr2}{acn2}{\nomesiglas}%% Subtipo de glossário (siglas)
\newglossary[alg3]{\abbreviationtype}{acr3}{acn3}{\nomeabreviaturas}%% Subtipo de glossário (abreviaturas)
\newcommand{\imprimirlistadeacronimos}{%% Definição do comando para inclusão da lista de abreviaturas, siglas e acrônimos
  \newglossarystyle{myxtab}{%% Estilo de glossário personalizado
    \glossarystyle{long}%% Estilo de glossário base
    \renewcommand*{\glossaryheader}{}%% Conteúdo do cabeçalho do glossário
    \renewcommand*{\glsgroupheading}[1]{}%% Conteúdo do cabeçalho de itens no glossário
    \renewcommand*{\glsgroupskip}{}%% Espaçamento entre itens
    \renewcommand*{\glspostdescription}{}%% Remoção do ponto no final das descrições do glossário
    \renewcommand*{\glossarypreamble}{\vspace*{0pt}}%% Definição de comandos antes do glossário
    \renewcommand*{\glossarypostamble}{\vspace*{0pt}}%% Definição de comandos após o glossário
    \setglossarysection{section}%% Estilo de seção do glossário
    \setlength{\glsdescwidth}{135mm}%% Comprimento da descrição
    \setlength{\glspagelistwidth}{0pt}%% Comprimento da lista de páginas
    \renewenvironment{theglossary}{%% Formatação do glossário
      \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
        \begin{xtabular}{@{}p{25mm}@{}p{\glsdescwidth}}%% Ambiente xtabular
    }{%%
        \end{xtabular}
      \end{Spacing}
    }
  }
  \pretextualchapter{\nomelistadeacronimos}%% Marcador
  \printglossary[type = \abbreviationtype, title = \nomeabreviaturas, style = myxtab, nonumberlist = true]%% Lista de abreviaturas
  \printglossary[type = \pseudoacronymtype, title = \nomesiglas, style = myxtab, nonumberlist = true]%% Lista de siglas
  %\printglossary[type = \acronymtype, title = \nomeacronimos, style = myxtab, nonumberlist = true ]%% Lista de acrônimos
  \cleardoublepage%% Página de verso
}
\newcommand{\abreviatura}[3]{\newacronym[type = \abbreviationtype]{#1}{#2}{#3}}%% Entrada de abreviatura
\newcommand{\sigla}[3]{\newacronym[type = \pseudoacronymtype]{#1}{#2}{#3}}%% Entrada de sigla
\newcommand{\acronimo}[3]{\newacronym[type = \acronymtype]{#1}{#2}{#3}}%% Entrada de acrônimo

%% Lista de abreviaturas, siglas e acrônimos
\newcommand{\incluirlistadeacronimos}[1]{%% Definição do comando para inclusão da lista de abreviaturas, siglas e acrônimos
  \ifthenelse{\equal{#1}{file}}{%% Lista de abreviaturas, siglas e acrônimos usando arquivo
    \include{./pre-texto/lista-acronimos}%% Impressão da lista de abreviaturas, siglas e acrônimos
    \cleardoublepage%% Página de verso
  }{%%
    \ifthenelse{\equal{#1}{glossaries}}{%% Lista de abreviaturas, siglas e acrônimos através do pacote glossaries
      \imprimirlistadeacronimos%% Impressão da lista de abreviaturas, siglas e acrônimos
    }{}%% Desativa lista de abreviaturas, siglas e acrônimos
  }
}

%% Lista de símbolos (configuração do arquivo ./PreTexto/lista-simbolos.tex)
\newcommand{\unidade}[1]{\SI{}{[#1]}}%% Formatação da unidade na lista de símbolos
\newcommand{\listadesimbolos}{%% Formatação da lista de símbolos
  \pretextualchapter{\listadesimbolosname}%% Estilo da página e marcador
  \vspace*{7.5pt}%% Espaçamento vertical
}
\newenvironment{listadeletraslatinas}{%% Formatação do ambiente listadeletraslatinas
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \section*{\nomeletraslatinas}%% Seção letras latinas
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadeletrasgregas}{%% Formatação do ambiente listadeletrasgregas
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomeletrasgregas}%% Seção letras gregas
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadesobrescritos}{%% Formatação do ambiente listadesobrescritos
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \section*{\nomesobrescritos}%% Seção sobrescritos
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadesubscritos}{%% Formatação do ambiente listadesubscritos
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \section*{\nomesubscritos}%% Seção subscritos
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}
\newenvironment{listadenotacoes}{%% Formatação do ambiente listadenotacoes
  \begin{Spacing}{1.0}%% Espaçamento simples entre linhas
    \section*{\nomenotacoes}%% Seção notações
    \begin{xtabular}{@{}p{25mm}@{}p{110mm}@{}>{\hspace*{\fill}}p{25mm}}%% Ambiente xtabular
}{%%
    \end{xtabular}
  \end{Spacing}
  \vspace*{0pt}%% Espaçamento vertical
}

%% Lista de símbolos (configuração do pacote nomencl)
\newlength{\rmnomlabel}%% Escala espaçamento do rótulo de símbolo
\setlength{\nomlabelwidth}{23mm}%% Largura do rótulo do símbolo
\setlength{\rmnomlabel}{\nomlabelwidth+\labelsep}%% Tamanho da escala espaçamento do rótulo de símbolo
\setlength{\nomitemsep}{-2.75pt}%% Tamanho do espaçamento entre itens da lista de símbolo
\newcommand{\nomunit}[1]{\abntex@ifnotempty{#1}{\renewcommand{\nomentryend}{\hspace*{\fill}\SI{}{[#1]}}}}%% Unidade do símbolo
\renewcommand{\nomgroup}[1]{%% Grupos de símbolos
  \ifthenelse{\equal{#1}{A}}{\item[\normalfont\normalsize\MakeUppercase{\nomeletraslatinas}]}%% Letras latinas
    {\ifthenelse{\equal{#1}{B}}{\item[\normalfont\normalsize\MakeUppercase{\nomeletrasgregas}]}%% Letras gregas
      {\ifthenelse{\equal{#1}{C}}{\item[\normalfont\normalsize\MakeUppercase{\nomesobrescritos}]}%% Sobrescritos
        {\ifthenelse{\equal{#1}{D}}{\item[\normalfont\normalsize\MakeUppercase{\nomesubscritos}]}%% Subscritos
          {\ifthenelse{\equal{#1}{E}}{\item[\normalfont\normalsize\MakeUppercase{\nomenotacoes}]}%% Notações
            {}}}}\vspace*{12.25pt}}
  \item[]\vspace*{12.25pt}
}
\renewcommand{\thenomenclature}{%% Inicialização da formatação da lista de símbolos
  \pretextualchapter{\listadesimbolosname}%% Estilo da página e marcador
  \vspace*{12pt}%% Espaçamento vertical
  \nompreamble%% Pré-texto da nomeclatura
  \begin{Spacing}{0.0}%% Espaçamento simples entre linhas
  \list{}{%% Estilo da lista de itens
    \labelwidth\nom@tempdim
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \itemsep\nomitemsep
    \let\makelabel\nomlabel
  }
}
\renewcommand{\endthenomenclature}{%% Finalização da formatação da lista de símbolos
  \endlist
  \nompostamble%% Pós-Texto da nomeclatura
  \end{Spacing}
  \cleardoublepage%% Página de verso
}
\newcommand{\letralatina}[4]{\nomenclature[A#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de letra latina
\newcommand{\letragrega}[4]{\nomenclature[B#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de letra grega
\newcommand{\sobrescrito}[4]{\nomenclature[C#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de sobrescrito
\newcommand{\subscrito}[4]{\nomenclature[D#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de subscrito
\newcommand{\notacao}[4]{\nomenclature[E#1]{$#2$}{#3 \nomunit{#4}}}%% Entrada de notação

%% Lista de símbolos
\newcommand{\incluirlistadesimbolos}[1]{%% Definição do comando para inclusão da lista de símbolos
  \ifthenelse{\equal{#1}{file}}{%% Lista de símbolos usando arquivo
    \include{./pre-texto/lista-simbolos}%% Impressão da lista de símbolos
    \cleardoublepage%% Página de verso
  }{%%
    \ifthenelse{\equal{#1}{nomencl}}{%% Lista de símbolos através do pacote nomencl
      \printnomenclature%% Impressão da lista de símbolos
    }{}%% Desativa lista de símbolos
  }
}

%% Sumário
\settocpreprocessor{part}{%% Título da parte no sumário em letras maíusculas
  \let\tempf@rtoc\f@rtoc\def\f@rtoc{\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%%
}
\settocpreprocessor{chapter}{%% Título do capítulo no sumário em letras maíusculas
  \let\tempf@rtoc\f@rtoc\def\f@rtoc{\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%%
}

%% luiz : TODO - fazer só a primeira letra maiúscula e o resto minusculo automático - tentei mas perdeu a formatação, sugestão: https://tex.stackexchange.com/questions/380500/first-letter-upper-case-and-other-letters-in-lower-case


\let\oldcontentsline\contentsline%% Título da seção no sumário em letras maíusculas
\def\contentsline#1#2{%%
  \expandafter\ifx\csname l@#1\endcsname\l@section\expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi%%
  {\oldcontentsline{#1}{#2}}{\oldcontentsline{#1}{#2}}%%
} % ver o caixa alta no sumário e no texto... 

% fim

\renewcommand{\cftpartfont}{\normalfont\normalsize\bfseries}%% Estilo da parte no sumário
\renewcommand{\cftchapterfont}{\normalfont\normalsize\bfseries}%% Estilo do capítulo no sumário
% luiz - sumário em negrito
\renewcommand{\cftsectionfont}{\normalfont\normalsize\scshape\bfseries}%% Estilo da seção no sumário
\renewcommand{\cftsubsectionfont}{\normalfont\normalsize}%% Estilo da subseção no sumário
\renewcommand{\cftsubsubsectionfont}{\normalfont\normalsize}%% Estilo da subsubseção no sumário
\renewcommand{\cftparagraphfont}{\normalfont\normalsize\itshape}%% Estilo do parágrafo no sumário
\renewcommand{\cftsubparagraphfont}{\normalfont\normalsize}%% Estilo do subparágrafo no sumário
\renewcommand{\cftpartpagefont}{\normalfont\normalsize\bfseries}%% Estilo da página da parte no sumário
\renewcommand{\cftchapterpagefont}{\normalfont\normalsize\bfseries}%% Estilo da página do capítulo no sumário
\renewcommand{\cftsectionpagefont}{\normalfont\normalsize}%% Estilo da página da seção no sumário
\renewcommand{\cftsubsectionpagefont}{\normalfont\normalsize}%% Estilo da página da subseção no sumário
\renewcommand{\cftsubsubsectionpagefont}{\normalfont\normalsize}%% Estilo da página da subsubseção no sumário
\renewcommand{\cftparagraphpagefont}{\normalfont\normalsize}%% Estilo da página do parágrafo no sumário
\renewcommand{\cftsubparagraphpagefont}{\normalfont\normalsize}%% Estilo da página do subparágrafo no sumário
% \if@semrecuonosumario%% Remoção do recuo dos itens no sumário
  \setlength{\cftpartindent}{0pt}%% Recuo do título da parte
  \setlength{\cftchapterindent}{0pt}%% Recuo do título do capítulo
  \setlength{\cftsectionindent}{0pt}%% Recuo do título da seção
  \setlength{\cftsubsectionindent}{0pt}%% Recuo do título da subseção
  \setlength{\cftsubsubsectionindent}{0pt}%% Recuo do título da subsubseção
  \setlength{\cftparagraphindent}{0pt}%% Recuo do título do parágrafo
  \setlength{\cftsubparagraphindent}{0pt}%% Recuo do título do subparágrafo
%\fi
\setlength{\cftbeforepartskip}{2em\@plus\p@}%% Remoção de espaço adicional antes de uma parte nas listas
\setlength{\cftbeforechapterskip}{0.1em\@plus\p@}%% Remoção de espaço adicional antes de um capítulo nas listas
\renewcommand*{\insertchapterspace}{}%% Remoção do espaço vertical de um capítulo nas listas
\renewcommand{\aftertoctitle}{\afterchaptertitle\vspace*{-0.25\linha}}%% Espaçamento após o título do sumário
\newcommand{\incluirsumario}{%% Definição do comando para inclusão do sumário
  \pdfbookmark[0]{\contentsname}{toc}%% Marcador
  \begin{Spacing}{1.5}%% Espaçamento simples entre linhas
    \tableofcontents*%% Impressão do sumário
  \end{Spacing}
  \cleardoublepage%% Página de verso
}

%% Referências
\let\arquivosdereferencias\bibliography%% Arquivos da lista de referências
\renewcommand{\prebibhook}{\vspace*{0.5\linha}}%% Conteúdo após o título da lista de referências
\renewcommand{\bibsection}{%% Formatação da lista de referências
  \chapter*{\bibname}
  \bibmark
  % luiz
  \singlespacing
  \ifnobibintoc\else
    \phantomsection
    \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{\bibname}}{\bibname}}%% Adição da lista de referências ao sumário
  \fi
  \prebibhook
}
\setlength{\bibitemsep}{0.1\linha}%% Espaçamento entre itens da lista de referências

%% Glossário
\renewcommand*{\glsseeformat}[3][\seename]{{#1}\space\glsseelist{#2}.}%% Formatação do texto "veja..." no glossário
\newcommand{\incluirglossario}{%% Definição do comando para inclusão do glossário
  \setlength{\glstreeindent}{\parindent}%% Recuo dos itens do glossário
  \cleardoublepage%% Página de verso
  \phantomsection%% Atalho do sumário
  \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{\glossaryname}}{\glossaryname}}%% Adição do glossário ao sumário
  \printglossary%% Impressão do glossário
}

\def\@chapapp{Chapter}%
\makechapterstyle{postext}{%%
    \chapterstyle{default}%
    \renewcommand*{\chapterheadstart}{}%
    \renewcommand{\chapterheadstart}{}%
    \renewcommand*{\printchaptername}{}%
    \renewcommand*{\chapternamenum}{}%
    \renewcommand*{\chapnumfont}{\normalfont\scshape\MakeTextLowercase}%
    \renewcommand*{\printchapternum}{}%
    \renewcommand*{\afterchapternum}{}%
    \renewcommand*{\printchapternonum}{}%
    \renewcommand*{\chaptitlefont}{\normalfont\large\bfseries}%
    \renewcommand*{\printchaptertitle}[1]{%%
        \null
        \vfill
        \centering %
        \chaptitlefont{\@chapapp\ \thechapter\ -- ##1}%
        \vfill
        \cleardoublepage
    }%
}%

%% Apêndices
\newenvironment{arquivosdeapendices}{%% Definição do ambiente arquivosdeapendices
  \chapterstyle{postext}
  \begin{apendicesenv}%% Ambiente apendicesenv
    \renewcommand{\appendixtocname}{%% Nome da parte apêndices no sumário
      \texorpdfstring{\uppercase{\apendicesname}}{\apendicesname}%%
    }
    \setlength{\afterchapskip}{\linha}%% Espaçamento após o título
}{%%
  \end{apendicesenv}
}

%% Anexos
\newenvironment{arquivosdeanexos}{%% Definição do ambiente arquivosdeanexos
  \chapterstyle{postext}
  \renewcommand{\Hy@appendixstring}{anexo}%% Definição do comando para o rótulo anexo
  \xdef\Hy@chapapp{\Hy@appendixstring}%% Definição do rótulo anexo
    \begin{anexosenv}%% Ambiente anexosenv
      %\renewcommand{\appendixtocname}{Anexo}
      \renewcommand{\appendixtocname}{%% Nome da parte anexos no sumário
      \texorpdfstring{\uppercase{\anexosname}}{\anexosname}%%
    }
    \setlength{\afterchapskip}{\linha}%% Espaçamento após o título
}{%%
  \end{anexosenv}
}

%% Índice
\newcommand{\incluirindice}{%% Definição do comando para inclusão do índice
  \renewenvironment{theindex}{%% Formatação do índice
    \clearforchapter
    \if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
    \ifonecolindex
      \onecolumn
      \chapter*{\indexname}
      \preindexhook
    \else
      \setlength{\columnseprule}{\indexrule}
      \setlength{\columnsep}{\indexcolsep}
      \twocolumn[\@makeschapterhead{\indexname}\preindexhook]
    \fi
    \indexmark
    \ifnoindexintoc\else
      \phantomsection
      \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{\indexname}}{\indexname}}%% Adição do índice ao sumário
    \fi
    \thispagestyle{indextitlepagestyle}\parindent\z@
    \parskip\z@ \@plus 0.3\p@\relax
    \let\item\@idxitem
  }{%%
    \if@restonecol\onecolumn\else\twocolumn\fi
  }
  \bookmarksetup{startatroot}%% Capítulos após este comando criam marcadores do pdf na raiz
  \printindex%% Impressão do índice
  \cleardoublepage%% Página de verso
}

%% Partes
\renewcommand{\partnamefont}{\normalfont\normalsize\bfseries\MakeUppercase}%% Fonte do nome da parte
\renewcommand{\partnumfont}{\normalfont\normalsize\bfseries\MakeUppercase}%% Fonte da página da parte
\renewcommand{\parttitlefont}{\normalfont\normalsize\bfseries\MakeUppercase}%% Fonte do título da parte

%% Parágrafos
\setparaheadstyle{\normalfont\normalsize\itshape}%% Estilo do título do parágrafo
\setafterparaskip{\aftersubsubsecskip}%% Espaçamento após título do parágrafo

%% Espaçamentos em capítulos, seções, subseções, subsubseções, parágrafos e subparágrafos
\setlength{\beforechapskip}{0pt}%% Espaçamento antes do título do capítulo
\setlength{\afterchapskip}{\linha}%% Espaçamento após o título do capítulo
\setlength{\beforesecskip}{\linha}%% Espaçamento antes do título da seção
\setlength{\aftersecskip}{\linha}%% Espaçamento após o título da seção
\setlength{\beforesubsecskip}{\linha}%% Espaçamento antes do título da subsubseção
\setlength{\aftersubsecskip}{\linha}%% Espaçamento após o título da subsubseção
\setlength{\beforesubsubsecskip}{\linha}%% Espaçamento antes do título da subsubseção
\setlength{\aftersubsubsecskip}{\linha}%% Espaçamento após o título da subsubseção
\setlength{\beforeparaskip}{\linha}%% Espaçamento antes do título do parágrafo
\setlength{\afterparaskip}{\linha}%% Espaçamento após o título do parágrafo
\setlength{\beforesubparaskip}{\linha}%% Espaçamento antes do título do subparágrafo
\setlength{\aftersubparaskip}{\linha}%% Espaçamento após o título do subparágrafo

%% Níveis de seções no documento e no sumário
\setsecnumdepth{all}%% Utilizado no documento
\maxsecnumdepth{all}%% Máximo no documento
\maxtocdepth{all}%% Utilizado no sumário
\settocdepth{all}%% Máximo no sumário

%% Estilo de numeração de algoritmos, figuras, tabelas e equações
\counterwithout{algorithm}{chapter}%% Numeração contínua ao longo dos capítulos para algoritmos
\counterwithout{figure}{chapter}%% Numeração contínua ao longo dos capítulos para figuras
\counterwithout{table}{chapter}%% Numeração contínua ao longo dos capítulos para tabelas
\counterwithout{equation}{chapter}%% Numeração contínua ao longo dos capítulos para equações

%% Legendas de objetos flutuantes
\hangcaption%% Recuo do texto das legendas
\if@legendascentralizadas%% Alinhamento das legendas centralizado
  \gdef\@captionjustification{on}%% Ativa alinhamento justificado
  \captionstyle{}%% Estilo das legendas
\else%% Alinhamento das legendas à esquerda
  \gdef\@captionjustification{off}%% Desativa alinhamento justificado
  \captionstyle[\raggedright]{\raggedright}%% Estilo das legendas
\fi
\captiondelim{\space--\space}%% Delimitador das legendas
\captionnamefont{\ABNTEXfontereduzida\bfseries}%% Fonte do nome das legendas
\captiontitlefont{\ABNTEXfontereduzida\bfseries}%% Fonte do título das legendas
\captionsetup{%% Formatação das legendas
  format=hang,%%
  singlelinecheck=\@captionjustification,%%
  font={footnotesize,bf,singlespacing},%%
  labelfont={footnotesize,bf,singlespacing},%%
  textfont={footnotesize,bf,singlespacing},%%
  labelsep={endash},%%
  skip=1pt%%
}

% Luiz - tamanho da linha de cima da nota de rodapé
\renewcommand{\footnoterule}{\kern-3pt \hrule width 5cm \kern 2.6pt}

% Luiz - comando fonte - se deixar em branco (ex. /fonte{}  - sem espaço) será preenchido automático com autor e ano.
% comandos para figuras e tabelas com fonte:
\renewcommand{\fonte}[1]{
\ifx\hfuzz#1\hfuzz
    \caption*{\ABNTEXfontereduzida{\bfseries\nomefonte: Autoria própria (\the\year).}}
\else
    \caption*{\ABNTEXfontereduzida{\bfseries\nomefonte: {#1}.}} 
\fi
}


%% Compilação de índices utilizando makeindex (se habilitada)
\if@usemakeindex
  \immediate\write18{makeindex \jobname.idx}\relax%% Compilação do índice
  \immediate\write18{makeindex -s \jobname.ist -t \jobname.glg -o \jobname.gls \jobname.glo}\relax%% Compilação do glossário
  \immediate\write18{makeindex -s \jobname.ist -t \jobname.alg -o \jobname.acr \jobname.acn}\relax%% Compilação dos acrônimos
  \immediate\write18{makeindex -s \jobname.ist -t \jobname.alg2 -o \jobname.acr2 \jobname.acn2}\relax%% Compilação das siglas
  \immediate\write18{makeindex -s \jobname.ist -t \jobname.alg3 -o \jobname.acr3 \jobname.acn3}\relax%% Compilação das abreviaturas
  \immediate\write18{makeindex \jobname.nlo -s nomencl.ist -o \jobname.nls}\relax%% Compilação dos símbolos
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting

% Command to turn all letters uppercase
\newcommand{\allcaps}[1]{\uppercase\expandafter{#1}}

% Command to underline the text
\newcommand{\underln}[1]{$\underline{\text{#1}}$}

 \renewcommand*{\l@section}[2]
 {% luiz - o xmakefirstuc está funcionando, todavia a primeira coisa que vem é o número... e depois o texto, então ele não deixa a primeira letra maiúscula por causa disso... tem que ver como resolver
     \l@chapapp{\ABNTEXsectionfont\xmakefirstuc{#1}}{#2}{\cftsectionname}
 }
 
%\renewcommand{\ABNTEXsectionfont}{\usefont{T1}{cmr}{m}{n}}

%%
%% Comandos úteis para matemática
%%

% Função piso (floor) com altura ajustada ao conteúdo
% Autor: Marco Aurélio Graciotto Silva
% Referências: https://www.physicsread.com/latex-floor-symbol/
%
\newcommand{\floor}[1]{\left \lfloor #1 \right \rfloor}

% Função teto (ceil) com altura ajustada ao conteúdo
% Autor: Marco Aurélio Graciotto Silva
% Referências: https://www.physicsread.com/latex-floor-symbol/
%
\newcommand{\ceil}[1]{\left \lceil #1 \right \rceil}