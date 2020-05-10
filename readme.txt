MODELAGEM DE DADOS - ConnectFácil SP

COMO FUNCIONA O BANCO DE DADOS DO PROJETO CONNECTFÁCIL SP:

Há 8 tabelas no banco de dados "bdCentral":
+ tbUsuariosPF
+ tbNegociantes
+ tbTransacoes
+ tbProdutosOfertados
+ tbListaDeProdutos
+ tbTipoDeProdServ
+ tbRamoDeNegocio
+ tbCargos

DEFINIÇÃO E FUNÇÕES DAS TABELAS

As tabelas "tbTipoDeProdServ", "tbRamoDeNegocio" são predefinidas e não são passíveis de inclusão de registros pelo usuário.

Na tabela "tbTipoDeProdServ" estão relacionados os tipos de produtos ou tipo de serviços (por ex: itens de higiene; produtos alimentícios; equipamentos hospitalares; etc) que aparecerão na caixa de seleção sempre que o negociante incluir um novo produto para venda ou disponibilizar um serviço.

Na tabela "tbRamoDeNegocio" constam os ramos de atividade empresarial (por ex: Alimentação; Hospítais; Serviços Domésticos; etc) que aparecerão na caixa de seleção no momento em que o negociante se cadastrar, na área Cadastramento de Negociante (o cadastro só é realizado uma única vez para cada negociante).

A tabela "tbUsuariosPF" é tabela mais importante. Nela estarão incluídos os dados de logon e de registro de todos os usuários (negociantes e clientes). Não será permitido o cadastro de pessoa judírica (as empresas deverão fazer o logon de um responsável pessoa física e em momento posterior efetuar o cadastro de negociantes como PJ, inserindo CNPJ e razão social da empresa).

A tabela "tbNegociantes" é a segunda tabela mais importante. Nela estão incluídos os dados de registro de negociantes, sejam estes PF ou PJ, comerciantes e prestadores de serviço. Cada registro desta tabela(seja PF ou PJ) é vinculado a um registro de usuário Pessoa Física na tabela "tbUsuarios", para fins de estabelecer um responsável pela empresa. Nesta tabela constam também o CNPJ e a razão social da empresa. A tabela é alimentada pelo negociante no momento do cadastramento, na área Cadastrar Negociante.

Na tabela "tbCargos" constam os cargos empresariais (por ex: diretor comercial; representante comercial; chefe executivo; etc) que aparecerão como sugestão na caixa de texto no momento em que o negociante Pessoa Jurídica se cadastrar. Esta tabela é passível de inclusão de novos registros (cargos) pelo próprio usuário, na área Cadastramento de Negociante.

Na tabela "tbListaDeProdutos" constam os nomes dos produtos propriamente ditos (por ex: sabonete; escova dental; arroz; etc), inseridos pelo negociante no momento em que este incluir um novo produto para venda.

Na tabela "tbProdutosOfertados" constam os produtos/serviços que estarão disponíveis para compra/contratação, incluídos pelo negociante na área Incluir Produto/Serviço.

Na tabela "tbTransacoes" constam os produtos/serviços que foram demandados pelo cliente, ou seja, que o cliente manifestou interesse em comprar ou contratar, na área Solicitar Produto/Serviço.