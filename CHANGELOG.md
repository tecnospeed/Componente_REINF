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
 

