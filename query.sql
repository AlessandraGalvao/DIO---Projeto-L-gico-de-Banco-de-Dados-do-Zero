Use bdigrejas;

-- BUSCA DE TODOS OS NOMES QUE COMECEM COM A LETRA A.
SELECT
        a.nome, date_format(a.dataNasc,'%d/%m/%Y') as nascimenton, a.mae, a.pai, a.foto, i.imgrelatorios, i.nomeigr
FROM membro AS a, igreja AS i where a.nome LIKE "%_A";

-- BUSCA DE TODOS OS MEMBROS DO BD QUE SE ENCONTAM INATIVOS
SELECT
     m.`nome`,
     m.`tpCadastro`,
     m.`modoAdesao`
FROM
    igreja as i, membro as m
INNER JOIN bairro AS b ON m.id_bairro=b.id 
WHERE  m.adesao= 'inativo'  
ORDER BY m.nome;

-- RELATÓRIO DE MEMBROS E CONGREGADOS POR IDADE MINÍMA E MÁXIMA
SELECT
 TIMESTAMPDIFF(YEAR,dataNasc,CURDATE()) as 'idade',
     m.`nome`,
     m.`dataNasc`,
     m.`telRes`, 
     m.`celular`,
     m.`email` ,
     m.`tpLogradouro` ,
     m.`logradouro`,
     m.`id_bairro`,
     b.`nome`  as 'bairro',
     i.nomeigr,i.`vers`,
     i.imgrelatorios

 FROM
    `igreja` as i,
	`membro` as m
INNER JOIN `bairro` AS b ON m.`id_bairro`=b.`id` 
WHERE TIMESTAMPDIFF(YEAR,dataNasc,CURDATE()) BETWEEN 15 AND 60
and adesao= 'ativo' 
ORDER BY m.`nome`;


-- LISTA COM NOME PARA ASSINATURA COM TODOS OS MEMBROS ATIVOS NO BD
SELECT
     m.`nome`,
    
     i.`imgrelatorios`, i.`vers`,
     i.`nomeigr`
     
FROM
    igreja as i, membro as m

WHERE m.`tpCadastro`='membro'
and m.adesao= 'ativo' 
ORDER BY m.nome;

-- LISTA COM DADOS PARA CONFECÇÃO DE CARTEIRA DE MEMBROS DO BD
SELECT
     DATE_FORMAT(dataNasc,'%d/%m/%Y') AS `nascimento`,
     Date_Format(DatadeBatismo,'%d/%m/%y') AS `batismo`,
     m.`CPF`, m.`funcaoMin`,
     m.`foto`, m.`logradouro`, 
     m.`membroDesde`, p.`nome`, 
     m.`id`,
     m.`nome` as `m_nome`,
     m.`mae` ,
     m.`pai`,
     m.`tpLogradouro` ,
     m.`RG` ,
     m.`tpCadastro`,
     m.`adesao` ,
     m.`estCivil`,
     p.`nome` AS `nacion`,
     c.`nome` AS `natural`,
     i.`nomeigr`, b.`nome` as `bairro`, i.imgrelatorios,i.slogan,
     i.`endereco`, i.`telsec`, i.`email`, i.`cnpj`


FROM 
 `igreja` as i
INNER JOIN `bairro` as b ON i.`id_bairro` = b.`id`,

`membro` as m
INNER JOIN `pais` as p ON m.`id_nacion` = p.`id`
INNER JOIN `uf` as c ON m.`id_natural` = c.`id`

 WHERE
     m.`tpCadastro` = 'membro'
     and m.`FuncaoMin` IS null 
	 GROUP BY m.nome;
    
SELECT  m.nome, m.telRes, m.celular, m.celular2, m.email, m.email2, i.imgrelatorios, i.nomeigr, i.vers
 FROM membro as m, igreja as i
WHERE m.sexo= "Feminino" and m.adesao= 'ativo'
group by m.nome


   