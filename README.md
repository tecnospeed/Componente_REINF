# Componente Reinf

### Sobre o Componente

Responsável em ser a interface de comunicação utilizada pelos clientes, através do uso de uma DLL (OCX) que expoe uma interface com os métodos que realizam a comunicação com a API Reinf.

O componente do Reinf possui métodos para a utilização direta dos nossos usuários e esses métodos fazem requisições HTTPS.

Para utilizar os métodos é necessário possuir uma conta Tecnospeed e utilizar seu CPF/CNPJ e Token. O componente precisa ser previamente configura com os dados de autenticação, através de suas propriedades também presentes em sua interface.

Todas as rotas chamadas internamente pelo componente precisam conter no header os parametros `token_sh` e `cnpj_sh`.

### Forma de autenticação

A autenticação é feita através de um token vinculado ao CNPJ da software house criado a partir de um cadastro de uma Conta Tecnospeed. (https://conta.tecnospeed.com.br/)
Podemos dizer que usa um esquema SSO, pois com esse token ele pode acessar as API´s de diferentes produtos que estejam em seu contrato.


### Interfaces

#### Métodos

- AssinarEvento
- ListarCertificados
- GerarXMLporTx2
- EnviarLoteEventos
- ConsultarLoteEventos
- ConfigurarSoftwareHouse
- GetVencimentoCertificado
- ListarVersaoManual
- ConsultarIdEvento
- ConsultarEventoPorRecibo

Documentação métodos: https://atendimento.tecnospeed.com.br/hc/pt-br/articles/4405792739863

#### Propriedades

- DiretorioEsquemas
- DiretorioTemplates
- DiretorioLogErro
- TipoCertificado
- NomeCertificado
- Versao
- Ambiente
- Pincode
- CpfCnpjEmpregador
- CaminhoCertificado
- SenhaCertificado
- ProxyServidor
- ProxyUsuario
- ProxySenha
- VersaoManual

Documentação propriedades: https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360005513253

---

### Fluxo
O fluxo entre máquinas fica dentro da infraestrutura da AWS, quando a requisição é tratada pela API, todo o trafégo da informação fica dentro do ambiente
AWS.

---

### Conectividade

A comunicação irá ocorrer utilizando requisições utilizando o protocolo HTTPS sendo recebidas pela API Reinf na AWS.

***

**Para baixar a versão Trial, [clique aqui](https://s3-sa-east-1.amazonaws.com/tecnospeed-trial/setup_reinf_tecnoaccount_5.1.23.229.exe "Baixar o Componente NFe Trial")**.

**Para ver uma lista com o histórico de mudanças, [clique aqui](https://github.com/tecnospeed/Componente_REINF/blob/master/CHANGELOG.md "Changelog").**

