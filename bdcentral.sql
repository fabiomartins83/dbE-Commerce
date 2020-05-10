-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 08-Maio-2020 às 18:07
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdcentral`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcargos`
--

DROP TABLE IF EXISTS `tbcargos`;
CREATE TABLE IF NOT EXISTS `tbcargos` (
  `idCargos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(20) NOT NULL,
  PRIMARY KEY (`idCargos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcidades`
--

DROP TABLE IF EXISTS `tbcidades`;
CREATE TABLE IF NOT EXISTS `tbcidades` (
  `idCidade` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Cidade` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UF` varchar(2) NOT NULL,
  PRIMARY KEY (`idCidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbemails`
--

DROP TABLE IF EXISTS `tbemails`;
CREATE TABLE IF NOT EXISTS `tbemails` (
  `idEmail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Usuario` int(10) UNSIGNED NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`idEmail`),
  KEY `relUserEmail` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfotografias`
--

DROP TABLE IF EXISTS `tbfotografias`;
CREATE TABLE IF NOT EXISTS `tbfotografias` (
  `idFoto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Fotografia` varchar(32) NOT NULL,
  PRIMARY KEY (`idFoto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbnegociantes`
--

DROP TABLE IF EXISTS `tbnegociantes`;
CREATE TABLE IF NOT EXISTS `tbnegociantes` (
  `idNegociante` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DataRegNegociante` timestamp NOT NULL,
  `UserRepresentante` int(10) UNSIGNED NOT NULL,
  `CargoRepresentante` int(10) UNSIGNED NOT NULL,
  `RamoDeAtiv` int(10) UNSIGNED NOT NULL,
  `RazaoSocial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CnpjEmpresa` int(14) UNSIGNED ZEROFILL DEFAULT NULL,
  `EmailEmpresa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CepEmpresa` int(8) UNSIGNED ZEROFILL NOT NULL,
  `EnderecoEmpresa` varchar(100) NOT NULL,
  `NumeroEmpresa` smallint(6) NOT NULL,
  `LocalizacaoEmpresa` geometry NOT NULL,
  `TelefoneEmpresa` int(11) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`idNegociante`),
  KEY `relUserComerciante` (`UserRepresentante`),
  KEY `relAtividadeComerciante` (`RamoDeAtiv`),
  KEY `relCargoComerciante` (`CargoRepresentante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpedidos`
--

DROP TABLE IF EXISTS `tbpedidos`;
CREATE TABLE IF NOT EXISTS `tbpedidos` (
  `idNegocio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Produto` int(10) UNSIGNED NOT NULL,
  `Cliente` int(10) UNSIGNED NOT NULL,
  `DataDoPedido` timestamp NOT NULL,
  `Quantidade` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`idNegocio`),
  KEY `relClienteTransacao` (`Cliente`),
  KEY `relProdutoTransacao` (`Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprodutosavenda`
--

DROP TABLE IF EXISTS `tbprodutosavenda`;
CREATE TABLE IF NOT EXISTS `tbprodutosavenda` (
  `idProduto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DataInclusaoProd` datetime NOT NULL,
  `Comerciante` int(10) UNSIGNED NOT NULL,
  `Produto` int(10) UNSIGNED NOT NULL,
  `Marca` varchar(30) DEFAULT NULL,
  `Modelo` varchar(30) DEFAULT NULL,
  `Especificacoes` varchar(30) DEFAULT NULL,
  `DescricaoProduto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `QtdeEstoque` smallint(6) UNSIGNED NOT NULL,
  `ProdutoNovo` tinyint(1) DEFAULT NULL,
  `FotografiaProduto` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `relComercianteProduto` (`Comerciante`),
  KEY `relListaProduto` (`Produto`),
  KEY `relFotografiaProduto` (`FotografiaProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbramodenegocio`
--

DROP TABLE IF EXISTS `tbramodenegocio`;
CREATE TABLE IF NOT EXISTS `tbramodenegocio` (
  `idRamoDeNegocio` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `NomeRamoDeNegocio` varchar(30) NOT NULL,
  PRIMARY KEY (`idRamoDeNegocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbservicosdisponiveis`
--

DROP TABLE IF EXISTS `tbservicosdisponiveis`;
CREATE TABLE IF NOT EXISTS `tbservicosdisponiveis` (
  `idServico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DataInclusaoServ` timestamp NOT NULL,
  `PrestadorServ` int(10) UNSIGNED NOT NULL,
  `Servico` int(10) UNSIGNED NOT NULL,
  `ObservacoesServ` text NOT NULL,
  `FotografiaServ` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idServico`),
  KEY `relServico` (`Servico`),
  KEY `relPrestadorServico` (`PrestadorServ`),
  KEY `relFotografiaServico` (`FotografiaServ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtabeladeprodutos`
--

DROP TABLE IF EXISTS `tbtabeladeprodutos`;
CREATE TABLE IF NOT EXISTS `tbtabeladeprodutos` (
  `idNomeProdServ` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TipoDeProduto` int(10) UNSIGNED NOT NULL,
  `NomeProduto` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idNomeProdServ`),
  KEY `relTipoProduto` (`TipoDeProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtabeladeservicos`
--

DROP TABLE IF EXISTS `tbtabeladeservicos`;
CREATE TABLE IF NOT EXISTS `tbtabeladeservicos` (
  `idServico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TipoDeServico` int(10) UNSIGNED NOT NULL,
  `Servico` varchar(30) NOT NULL,
  PRIMARY KEY (`idServico`),
  KEY `relTipoServico` (`TipoDeServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtelefones`
--

DROP TABLE IF EXISTS `tbtelefones`;
CREATE TABLE IF NOT EXISTS `tbtelefones` (
  `idTelefone` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Usuario` int(10) UNSIGNED NOT NULL,
  `Telefone` int(10) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`idTelefone`),
  KEY `relUserTelefone` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtiposdeprodutos`
--

DROP TABLE IF EXISTS `tbtiposdeprodutos`;
CREATE TABLE IF NOT EXISTS `tbtiposdeprodutos` (
  `idTipoDeProduto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TipoDeProduto` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idTipoDeProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtiposdeservicos`
--

DROP TABLE IF EXISTS `tbtiposdeservicos`;
CREATE TABLE IF NOT EXISTS `tbtiposdeservicos` (
  `idTipoDeServico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TipoDeServico` varchar(30) NOT NULL,
  PRIMARY KEY (`idTipoDeServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuariospf`
--

DROP TABLE IF EXISTS `tbusuariospf`;
CREATE TABLE IF NOT EXISTS `tbusuariospf` (
  `idUser` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DataRegistro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `NomeLoginUser` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NomeCompletoUser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CpfUser` bigint(11) UNSIGNED ZEROFILL NOT NULL,
  `DataNascUser` date NOT NULL,
  `EmailPrincipalUser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TelefoneUser` bigint(11) UNSIGNED NOT NULL,
  `CepUser` int(8) UNSIGNED ZEROFILL NOT NULL,
  `UFUser` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CidadeUser` varchar(30) NOT NULL,
  `LogradouroEndUser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NumEndUser` varchar(6) DEFAULT NULL,
  `ComplEndUser` varchar(20) DEFAULT NULL,
  `LocalizacaoUser` geometry DEFAULT NULL,
  `SenhaUser` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoggedIn` tinyint(1) DEFAULT NULL,
  `UltimoLoginUser` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tbusuariospf`
--

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbemails`
--
ALTER TABLE `tbemails`
  ADD CONSTRAINT `relUserEmail` FOREIGN KEY (`Usuario`) REFERENCES `tbusuariospf` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbnegociantes`
--
ALTER TABLE `tbnegociantes`
  ADD CONSTRAINT `relAtividadeComerciante` FOREIGN KEY (`RamoDeAtiv`) REFERENCES `tbramodenegocio` (`idRamoDeNegocio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relCargoComerciante` FOREIGN KEY (`CargoRepresentante`) REFERENCES `tbcargos` (`idCargos`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relUserComerciante` FOREIGN KEY (`UserRepresentante`) REFERENCES `tbusuariospf` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbpedidos`
--
ALTER TABLE `tbpedidos`
  ADD CONSTRAINT `relClienteTransacao` FOREIGN KEY (`Cliente`) REFERENCES `tbusuariospf` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relProdutoTransacao` FOREIGN KEY (`Produto`) REFERENCES `tbprodutosavenda` (`idProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbprodutosavenda`
--
ALTER TABLE `tbprodutosavenda`
  ADD CONSTRAINT `relComercianteProduto` FOREIGN KEY (`Comerciante`) REFERENCES `tbnegociantes` (`idNegociante`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relFotografiaProduto` FOREIGN KEY (`FotografiaProduto`) REFERENCES `tbfotografias` (`idFoto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relListaProduto` FOREIGN KEY (`Produto`) REFERENCES `tbtabeladeprodutos` (`idNomeProdServ`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbservicosdisponiveis`
--
ALTER TABLE `tbservicosdisponiveis`
  ADD CONSTRAINT `relFotografiaServico` FOREIGN KEY (`FotografiaServ`) REFERENCES `tbfotografias` (`idFoto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relPrestadorServico` FOREIGN KEY (`PrestadorServ`) REFERENCES `tbnegociantes` (`idNegociante`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relServico` FOREIGN KEY (`Servico`) REFERENCES `tbtabeladeservicos` (`idServico`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbtabeladeprodutos`
--
ALTER TABLE `tbtabeladeprodutos`
  ADD CONSTRAINT `relTipoProduto` FOREIGN KEY (`TipoDeProduto`) REFERENCES `tbtiposdeprodutos` (`idTipoDeProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbtabeladeservicos`
--
ALTER TABLE `tbtabeladeservicos`
  ADD CONSTRAINT `relTipoServico` FOREIGN KEY (`TipoDeServico`) REFERENCES `tbtiposdeservicos` (`idTipoDeServico`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbtelefones`
--
ALTER TABLE `tbtelefones`
  ADD CONSTRAINT `relUserTelefone` FOREIGN KEY (`Usuario`) REFERENCES `tbusuariospf` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
