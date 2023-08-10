## [4.0.16.200 - BETA]

* Compatibilizado versão 2.1.02 do Reinf, segue documentação https://atendimento.tecnospeed.com.br/hc/pt-br/articles/12156612241047-Dicion%C3%A1rio-de-dados-EFD-Reinf-2-1-02
 
 ## [4.1.16.197]

**Correções**

* DSML-688 - VERSÃO INSTALADA DIFERE DA LISTADA NA PROPRIEDADE
* DSML-698 - Retorno indevido da rota Consultar empregador
* DSML-739 - ERRO AO GERAR DLL A PARTIR DA OCX



## [4.1.15.193]

**Novidades**
* DSP4G-1003: - Disponibilizado novo método [ConsultarLotesPorPeriodo ](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/13782658193815)

**Correção**

* DSML-688 - Ajuste no Reinf_compile.fbp8, ao realizar build do componente, irá trazer a versão da ocx correta;

## [4.1.14.190]


**Novidades**

* DSP4G-712: - Compatibilização do REINF para a versão 2.1, criação dos Registros reutilizáveis na nova versão.
* DSP4G-716: - Compatibilização do REINF para a versão 2.1, criação do Registro R-4080 - Retenção no recebimento.
* DSP4G-119: - Compatibilização do REINF para a versão 2.1, compatibilização do Registro R-1000 - Informações do contribuinte.
* DSP4G-717: - Compatibilização do REINF para a versão 2.1, criação do Registro R-4099 - Fechamento/reabertura dos eventos da série R-4000.
* DSP4G-722: - Compatibilização do REINF para a versão 2.1, criação do Registro R-9005 - Bases e tributos - retenções na fonte.
* DSP4G-708: - Compatibilização do REINF para a versão 2.1, criação do Registro R-4040 - Pagamentos/créditos a beneficiários não identificados.
* DSP4G-710: - Compatibilização do REINF para a versão 2.1, criação do Registro R-4010 - Pagamentos/créditos a beneficiário pessoa física.
* DSP4G-709: - Compatibilização do REINF para a versão 2.1, criação do Registro R-4020 - Pagamentos/créditos a beneficiário pessoa jurídica.
* DSP4G-718: - Compatibilização do REINF para a versão 2.1,remoção dos Registros R-5011 e R-5001 e criação dos Registros R-9011 - Consolidação de bases e tributos - Contrib. previdenciária e R-9001 - Bases e tributos - contribuição previdenciária.
* DSP4G-919: - Compatibilização do REINF para a versão 2.1,criação das interfaces do Registro R-9015 na ReinfClientX.ocx.
* DSP4G-886: - Compatibilização do REINF para a versão 2.1,criação das interfaces do Registro R-9005 na ReinfClientX.ocx.

## [4.1.14.189]

#Leiame

**Novidades**
* DSP4G-282 - obrigatoriedade da propriedade [CpfCnpjEmpregador](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360005513253) nas requisições feitas a api
* DSP4G-758 - Compatibilizado com atualizações do componente indy
* DSP4G-812 - Propriedade [NotaTecnica](https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360005513253) para permitir alternar entre NT's de uma mesma versão manual 

## [4.1.14.184]
 ## Novidades:

* DSP4G-400 - Adicionado ao pacote de instalação do componente o arquivo "IDs_LIBs_Reinf.ini" contendo os ID´s das OCXs.

* DSP4G-389 - Disponibilizado novo método GetNomeCertificadoViaCaminho, mais informações no link abaixo.
	Link: https://atendimento.tecnospeed.com.br/hc/pt-br/articles/8346786777111.
  
﻿## [4.1.14.171]  
 ## Correções:

* DCEV-507 - Correção do nome do arquivo .xsd no mapping de exclusão do evento R1070.

* DCEV-561 - Compatibilizado o componente com o novo Delphi 11 Alexandria.

﻿## [4.1.14.165]  
 ## Correções:
 
* DC-2954 - Implementado ajuste no retorno do evento 5001 onde estava retornando vazio.

* DC-2778 - Implementado nova propriedade para ativar a função de geração de chave de eventos utilizando os 14 dígitos do CNPJ (Caso obrigatório somente para órgãos públicos).

* DC-3093 - Implementando ajuste na consulta do evento de fechamento R-2099 conforme publicado pela SEFAZ.
          Link: http://sped.rfb.gov.br/pagina/show/5818
          
﻿## [4.1.13.163]  
 ## Correções:        
 
 * DC-2954 - Implementada a correção no retorno tipado do evento R5001 no campo RPrest, agora esse campo pode ser
              um Array.
              
 ﻿## [4.1.12.146]
 ## Novidades:             
 
 * - Nova arquitetura da gov exclusiva por produto.

* - Compatibilizado o componente com o novo Delphi 10.4 Sydney.

* DC-2208 - Compatibilizado componente com o novo Layout 1.5.01 (Até NT 01/2021).
              Atenção! A SEFAZ está com instabilidade no webservice de produção restrita em retornar a resposta para o evento de fechamento R-2099.

* DC-2823 - A partir desta versão a comunicação com a SEFAZ será feita localmente pelo componente.

* DC-2778 - Implementado tratamento para geração do ID´s de evento para orgão público.

 ## Correções: 
* 24457 - Corrigido propriedade PinCode 
 





