## [5.1.38.5224]

**Novidades**

**DSML-766** - Compatibilização do evento [S-1210](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17713597875095) - Pagamentos de Rendimentos do Trabalho, com a versão S-1.2 do eSocial;

**DSML-905** - Compatibilização do evento [S-2501](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17828999831319) - Informações de Tributos Decorrentes de Processo Trabalhista, com a versão S-1.2 do eSocial;

**DSML-762** - Novo evento [S-8200](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/18003040468631) -  Anotação Judicial do Vínculo, versão S-1.2 do eSocial;

**DSML-863** - Novo evento [S-5503](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/18297859728791) -   Informações do FGTS por Trabalhador em Processo Trabalhista;

**DSML-907** - Compatibilização com a versão S-1.2 do eSocial, eventos:
-  [S-2200](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17873519057943) - Condições Ambientais do Trabalho - Agentes Nocivos;
- [S-2405](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17881322653463) - Cadastro de Beneficiário - Entes Públicos - Alteração;
- [S-2500](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17884643920151) - Processo Trabalhista;
- [S-2299](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17988932221207) - Desligamento;

**DSML-906** - Compatibilização com a versão S-1.2 do eSocial, eventos:
-  [S-2240](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17885147585175) - Cadastramento Inicial do Vínculo e Admissão/Ingresso de Trabalhador;
- [S-2205](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17994486383639) - Alteração de Dados Cadastrais do Trabalhador;
- [S-2300](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/17996045362327) - Trabalhador Sem Vínculo de Emprego/Estatutário - Início;
- [S-2306](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/18002650538647) - Trabalhador Sem Vínculo de Emprego/Estatutário - Alteração Contratual;

**DSML-941** - Compatibilização com a versão S-1.2 do eSocial, eventos:
-  [S-5002](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/18362400502295) - Imposto de Renda Retido na Fonte por Trabalhador;
- [S-5012](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/18381989881879) - Imposto de Renda Retido na Fonte Consolidado por Contribuinte;

**Correções**

**DSML-784** - Correção ao converter Tx2 em XML, aumentado o limite dos eventos S2200 e S2206;

**DSML-916** - Correção ao consultar o retorno do evento S5003, limpeza da lista InfoBasePerApur antes de clonar;

## [5.1.37.5218]

**Novidades**

* DSP4G-1131 PDCA -  Apresentar status "Em processamento" portal eSocial TecnoSpeed
* DSP4G-1148 GUI eSocial: Resize linha de acordo com o tamanho da tela
* DSP4G-1150 Gui eSocial: Pesquisa por empregador ao selecionar na pré listagem não filtra especifico
* DSP4G-1154 Gui esocial: Remover do filtro "evento" os eventos de retorno - versão S1.1.0.0
* DSP4G-1182 PDCA - Portal eSocial: Melhoria no status de retorno "301"
* DSP4G-1121 API eSocial: Rota para integrar arquivos JSON
  
**Correções**
* DSML-690 - Orreção na falha de formato do recibo;
* DSP4G-1149 Gui eSocial: Encontrando mais dados ao filtrar por certificado os empregadores

## [4.1.37.5216]

**Correções**
* DSML-751 - Correção da duplicidade ao consultar o evento S5013;
* DSML-784 - Correção ao converter Tx2 em XML, aumentado o limite dos eventos S2200 e S2206;

## [4.1.37.5211]

**Novidades**

- DSP4G-492 - criada propriedade [DiretorioLog](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360005419193-Propriedades-Componente-eSocial-)
- DSP4G-376 - Rota de remoção de certificado
- DSP4G-500 - ESOCIAL API MELHORIA ROTA - CONSULTA LOTES POR PERIODO
- DSP4G-971 - API eSocial: Atualizar lib Tecnolicense para a versão 2.0.21
- DSP4G-1070 - rota logout management api
- DSP4G-1077 - PORTAL ESOCIAL - INCLUSÃO EMPREGADOR - ERRO AO INCLUIR EMPREGADOR COM NOME JÁ EXISTENTE
**Correções**
eSocial: API - Retorno indevido da rota Consultar empregador

## [4.1.36.5204]



**Novidades**
* DSP4G-788 - Compatibilizado com atualizações do componente indy

## [4.1.36.5202]

**Novidades**

* Compatibilizado o Componente com a nova versão simplificada S-1.1.


## [4.1.36.5201]

**Novidades**

* DSML-153 - Correção da versão OCX
* DSP4G-85 - Implementando método ConsultarLotesPorPeriodo, [clique para mais informações](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/7780267992343)
* DSP4G-390 - Disponibilizado novo método GetNomeCertificadoViaCaminho, [clique para mais informações](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/8549400144023)
* DSP4G-436 - Compatibilizando eSocial S-1.0 com a NT 06/2022.
* DSP4G-522 - Compatibilizado eSocial S-1.1 para os eventos S-2500, S-2501 e S-3500



## [4.1.36.5189]

* DSP4G-90 - criado prioridade [ListValidCertificates](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360005419193), quando ativado listará no metodo [ListarCertificado ](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360006419813)somente certificados que não estejam vencidos
* DSP4G-396 - Adicionado ao pacote de instalação do componente o arquivo "IDs_LIBs_eSocial.ini" contendo os ID´s das OCXs.










