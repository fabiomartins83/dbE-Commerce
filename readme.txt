MODELAGEM DE DADOS - ConnectF�cil SP

COMO FUNCIONA O BANCO DE DADOS DO PROJETO CONNECTF�CIL SP:

H� 8 tabelas no banco de dados "bdCentral":
+ tbUsuariosPF
+ tbNegociantes
+ tbTransacoes
+ tbProdutosOfertados
+ tbListaDeProdutos
+ tbTipoDeProdServ
+ tbRamoDeNegocio
+ tbCargos

DEFINI��O E FUN��ES DAS TABELAS

As tabelas "tbTipoDeProdServ", "tbRamoDeNegocio" s�o predefinidas e n�o s�o pass�veis de inclus�o de registros pelo usu�rio.

Na tabela "tbTipoDeProdServ" est�o relacionados os tipos de produtos ou tipo de servi�os (por ex: itens de higiene; produtos aliment�cios; equipamentos hospitalares; etc) que aparecer�o na caixa de sele��o sempre que o negociante incluir um novo produto para venda ou disponibilizar um servi�o.

Na tabela "tbRamoDeNegocio" constam os ramos de atividade empresarial (por ex: Alimenta��o; Hosp�tais; Servi�os Dom�sticos; etc) que aparecer�o na caixa de sele��o no momento em que o negociante se cadastrar, na �rea Cadastramento de Negociante (o cadastro s� � realizado uma �nica vez para cada negociante).

A tabela "tbUsuariosPF" � tabela mais importante. Nela estar�o inclu�dos os dados de logon e de registro de todos os usu�rios (negociantes e clientes). N�o ser� permitido o cadastro de pessoa jud�rica (as empresas dever�o fazer o logon de um respons�vel pessoa f�sica e em momento posterior efetuar o cadastro de negociantes como PJ, inserindo CNPJ e raz�o social da empresa).

A tabela "tbNegociantes" � a segunda tabela mais importante. Nela est�o inclu�dos os dados de registro de negociantes, sejam estes PF ou PJ, comerciantes e prestadores de servi�o. Cada registro desta tabela(seja PF ou PJ) � vinculado a um registro de usu�rio Pessoa F�sica na tabela "tbUsuarios", para fins de estabelecer um respons�vel pela empresa. Nesta tabela constam tamb�m o CNPJ e a raz�o social da empresa. A tabela � alimentada pelo negociante no momento do cadastramento, na �rea Cadastrar Negociante.

Na tabela "tbCargos" constam os cargos empresariais (por ex: diretor comercial; representante comercial; chefe executivo; etc) que aparecer�o como sugest�o na caixa de texto no momento em que o negociante Pessoa Jur�dica se cadastrar. Esta tabela � pass�vel de inclus�o de novos registros (cargos) pelo pr�prio usu�rio, na �rea Cadastramento de Negociante.

Na tabela "tbListaDeProdutos" constam os nomes dos produtos propriamente ditos (por ex: sabonete; escova dental; arroz; etc), inseridos pelo negociante no momento em que este incluir um novo produto para venda.

Na tabela "tbProdutosOfertados" constam os produtos/servi�os que estar�o dispon�veis para compra/contrata��o, inclu�dos pelo negociante na �rea Incluir Produto/Servi�o.

Na tabela "tbTransacoes" constam os produtos/servi�os que foram demandados pelo cliente, ou seja, que o cliente manifestou interesse em comprar ou contratar, na �rea Solicitar Produto/Servi�o.