-- a. Cinco consultas cujos resultados contenham dados provenientes de pelo menos 3 relações.
	-- 1) Liste o nome do escrivão, junto do tipo de crime nos registros e o respectivo meliante
		
	select Nome_esc, Tipo_Crime, Nome_mel from Registro_Criminal
	natural join
		(select Nome as Nome_esc, ID_Func from Escrivao natural join Funcionario natural join Pessoa) Esc
	natural join
		(select Nome as Nome_mel, CPF from Meliante natural join Pessoa) Mel;

	-- 2) Liste o modelo do veículo, junto da data das operações e o nome dos delegados que a lideraram
	select Modelo, Data_Op, Nome from 
		(select * from Veiculo natural join Veiculo_Operacao natural join Operacao) Veic
	natural join
		(select * from Delegado natural join Policial natural join Funcionario natural join Pessoa) Del;

	-- 3) Liste o id do boletim, junto dos nomes da vítima e do atendente
	select ID_Bol, Nome, Nome_atd from Boletim_Ocorrencia
	natural join
		(select Nome, CPF from Vitima natural join Pessoa) Vit
	natural join
		(select Nome as Nome_atd, ID_Func from Atendente natural join Funcionario natural join Pessoa) Atd;

	-- 4) Liste a numeração da arma de fogo, junto do modelo dela e o polícial que a possui
	select ID_Equip, Modelo, Nome from 
		(select * from Arma_Fogo natural join Equipamento) Armas
	natural join
		(select * from Policial natural join Funcionario natural join Pessoa) Pol;

	-- 5) Liste o nome do investigador, a descrição da evidência e o id do boletim correspondente
	select Nome, Descricao, ID_Bol from 
		(select * from Pessoa natural join Funcionario natural join Policial natural join Investigador) Inv
	natural join
		(select * from Evidencias natural join Boletim_Evidencia) Evid;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------
-- b) Cinco consultas que utilizem os operadores de intersecção, união ou subtração.
	-- 1) Liste os policiais que estavam em ambas as operações dos dias “01/01/2024” e “01/02/2024”
	SELECT po1.ID_Func
	FROM Policial_Operacao po1
	INNER JOIN Operacao o1 ON po1.ID_Op = o1.ID_Op
	INNER JOIN Policial_Operacao po2 ON po1.ID_Func = po2.ID_Func
	INNER JOIN Operacao o2 ON po2.ID_Op = o2.ID_Op
	WHERE o1.Data_Op = '2024-01-01'
	AND o2.Data_Op = '2024-02-01';

	-- 2) Liste os policiais que não estavam nas operações do dia “01/01/2024”
	SELECT p.ID_Func, pe.Nome
	FROM Policial p
	INNER JOIN Funcionario f ON p.ID_Func = f.ID_Func
	INNER JOIN Pessoa pe ON f.CPF = pe.CPF
	WHERE p.ID_Func NOT IN (
		SELECT po.ID_Func
		FROM Policial_Operacao po
		INNER JOIN Operacao o ON po.ID_Op = o.ID_Op
		WHERE o.Data_Op = '2024-01-01'
	);

	-- 3) Liste os veículos que ainda não foram utilizados em operações
	SELECT v.Placa, v.Modelo, v.Blindagem
	FROM Veiculo v
	WHERE v.Placa NOT IN (
		SELECT vo.Placa
		FROM Veiculo_Operacao vo
	);
    
	-- 4) Liste o modelo de todas as armas brancas e as armas de fogo cadastradas
	SELECT Modelo
	FROM Arma_Branca
	NATURAL JOIN Equipamento
	UNION
	SELECT Modelo
	FROM Arma_Fogo
	NATURAL JOIN Equipamento;

	-- 5) Liste todos os funcionários que são somente policiais
	SELECT *
	FROM Policial
	NATURAL JOIN Funcionario
	WHERE (ID_Func) NOT IN (
		SELECT ID_Func
		FROM Investigador
		NATURAL JOIN Policial
		NATURAL JOIN Funcionario
		UNION
		SELECT ID_Func
		FROM Delegado
		NATURAL JOIN Policial
		NATURAL JOIN Funcionario
	);
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------
-- c) Quatro consultas para cada tipo de junção (interna, externa total, externa à esquerda, externa à direita).
	-- Liste todos os registros criminais de “Henrique Castro”
	select * from
		(select * from Meliante natural join Pessoa where Nome='Henrique Castro') Hen
	join
		Registro_Criminal
	on Hen.CPF = Registro_Criminal.CPF;

	-- 2) Liste todas as armas brancas de “Robson Pereira“
	select * from
		(select * from Policial natural join Funcionario natural join Pessoa where Nome='Robson Pereira') Rob
	natural join
		(select * from Equipamento) Equip
	join
		Arma_Branca
	on Equip.ID_Equip = Arma_Branca.ID_Equip;

	-- 3) Liste todas as evidências coletadas por “Sertãozinho Chororô”
	select Descricao from
		(select Nome, ID_Func from Pessoa natural join Funcionario natural join Policial natural join Investigador where Nome='Sertãozinho Chororô') Sert
	join
		Evidencias
	on Sert.ID_Func = Evidencias.ID_Func;

	-- 4) Liste todas as operações lideradas pelo delegado “Aleandre de Moraes”
	select * from
		(select * from Delegado natural join Policial natural join Funcionario natural join Pessoa where Nome='Aleandre de Moraes') Ale
	join
		Operacao
	on Ale.ID_Func = Operacao.ID_Func;

	-- 5) Liste todos os policiais que participaram (ou não) de operações (que não necessáriamente possuem policiais)
	(select * from Operacao
	left join
		((select ID_Func_Policial, Nome, ID_Op as ID_Op2 from
			(select ID_Func as ID_Func_Policial, Nome from Policial natural join Funcionario natural join Pessoa) Pol
		left join Policial_Operacao on Pol.ID_Func_Policial = Policial_Operacao.ID_Func)
		union
		(select ID_Func_Policial, Nome, ID_Op as ID_Op2 from
			(select ID_Func as ID_Func_Policial, Nome from Policial natural join Funcionario natural join Pessoa) Pol
		right join Policial_Operacao on Pol.ID_Func_Policial = Policial_Operacao.ID_Func)) Pol_Op
	on Operacao.ID_Op = Pol_Op.ID_Op2)
	union
	(select * from Operacao
	right join
		((select ID_Func_Policial, Nome, ID_Op as ID_Op2 from
			(select ID_Func as ID_Func_Policial, Nome from Policial natural join Funcionario natural join Pessoa) Pol
		left join Policial_Operacao on Pol.ID_Func_Policial = Policial_Operacao.ID_Func)
		union
		(select ID_Func_Policial, Nome, ID_Op as ID_Op2 from
			(select ID_Func as ID_Func_Policial, Nome from Policial natural join Funcionario natural join Pessoa) Pol
		right join Policial_Operacao on Pol.ID_Func_Policial = Policial_Operacao.ID_Func)) Pol_Op
	on Operacao.ID_Op = Pol_Op.ID_Op2);

	-- 6) Liste todos os veículos que foram usados (ou não) em operações (que não necessáriamente possuem veículos)
	(select * from Operacao
	left join 
		((select * from (select Modelo, Blindagem, Placa as Placa2 from Veiculo) Veic2
		left join Veiculo_Operacao
		on Veic2.Placa2 = Veiculo_Operacao.Placa)
		union
		(select * from (select Modelo, Blindagem, Placa as Placa2 from Veiculo) Veic2
		right join Veiculo_Operacao
		on Veic2.Placa2 = Veiculo_Operacao.Placa)) Veic_Op
	on Operacao.ID_Op = Veic_Op.ID_Op)
	union
	(select * from Operacao
	right join 
		((select * from (select Modelo, Blindagem, Placa as Placa2 from Veiculo) Veic2
		left join Veiculo_Operacao
		on Veic2.Placa2 = Veiculo_Operacao.Placa)
		union
		(select * from (select Modelo, Blindagem, Placa as Placa2 from Veiculo) Veic2
		right join Veiculo_Operacao
		on Veic2.Placa2 = Veiculo_Operacao.Placa)) Veic_Op
	on Operacao.ID_Op = Veic_Op.ID_Op);

	-- 7) Liste todos os boletins que possuem (ou não) evidências (que não necessáriamente são de boletins)
	(select * from Evidencias
	left join 
		((select * from (select ID_Bol as ID_Bol2 from Boletim_Ocorrencia) Bol
		left join Boletim_Evidencia
		on Bol.ID_Bol2 = Boletim_Evidencia.ID_Bol)
		union
		(select * from (select ID_Bol as ID_Bol2 from Boletim_Ocorrencia) Bol
		left join Boletim_Evidencia
		on Bol.ID_Bol2 = Boletim_Evidencia.ID_Bol)) Result_Evid
	on Evidencias.ID_Evi = Result_Evid.ID_Evi)
	union
	(select * from Evidencias
	right join 
		((select * from (select ID_Bol as ID_Bol2 from Boletim_Ocorrencia) Bol
		left join Boletim_Evidencia
		on Bol.ID_Bol2 = Boletim_Evidencia.ID_Bol)
		union
		(select * from (select ID_Bol as ID_Bol2 from Boletim_Ocorrencia) Bol
		left join Boletim_Evidencia
		on Bol.ID_Bol2 = Boletim_Evidencia.ID_Bol)) Result_Evid
	on Evidencias.ID_Evi = Result_Evid.ID_Evi);

	-- 8) Liste todos os boletins que possuem (ou não) registros criminais (que não necessáriamente são de boletins)
	(select * from Registro_Criminal
	left join
		((select * from (select ID_Bol as ID_Bol2 from Boletim_Ocorrencia) Bol
		left join Boletim_Registro
		on Bol.ID_Bol2 = Boletim_Registro.ID_Bol)
		union
		(select * from (select ID_Bol as ID_Bol2 from Boletim_Ocorrencia) Bol
		right join Boletim_Registro
		on Bol.ID_Bol2 = Boletim_Registro.ID_Bol)) Result_Bol
	on Registro_Criminal.ID_Reg = Result_Bol.ID_Reg)
	union
	(select * from Registro_Criminal
	right join
		((select * from (select ID_Bol as ID_Bol2 from Boletim_Ocorrencia) Bol
		left join Boletim_Registro
		on Bol.ID_Bol2 = Boletim_Registro.ID_Bol)
		union
		(select * from (select ID_Bol as ID_Bol2 from Boletim_Ocorrencia) Bol
		right join Boletim_Registro
		on Bol.ID_Bol2 = Boletim_Registro.ID_Bol)) Result_Bol
	on Registro_Criminal.ID_Reg = Result_Bol.ID_Reg);

	-- 9) Liste todas as pessoas que são vítimas e seus boletins (Mesmo que não tenham feito nenhum)
	select * from (select * from Vitima natural join Pessoa) Vit
	left join Boletim_Ocorrencia
	on Vit.CPF = Boletim_Ocorrencia.CPF;

	-- 10) Liste todas as pessoas que são meliantes e seus registros (Mesmo que ainda não possuam)
	select * from (select * from Meliante natural join Pessoa) Mel
	left join Registro_Criminal
	on Mel.CPF = Registro_Criminal.CPF;

	-- 11) Liste todas as armas de fogo e seus acesśorios (Mesmo que ainda não possuam nenhum)
	select * from (select * from Arma_Fogo natural join Equipamento) Armas
	left join Acessorio
	on Armas.ID_Equip = Acessorio.ID_Equip;

	-- 12) Liste todas os investigadores e suas evidências (Mesmo que ainda não tenham coletado nenhum)
	select * from (select * from Investigador natural join Policial natural join Funcionario natural join Pessoa) Invest
	left join Evidencias
	on Invest.ID_Func = Evidencias.ID_Func;


	-- 13) Liste os registros criminais junto de todos os escrivões (Mesmo que ainda não tenham registrado nenhum)
	select * from Registro_Criminal
	right join (select ID_Func, Nome from Escrivao natural join Funcionario natural join Pessoa) Esc
	on Registro_Criminal.ID_Func = Esc.ID_Func;

	-- 14) Liste as operações junto de todos os delegados (Mesmo que ainda não tenham liderado nenhuma)
	select * from Operacao
	right join (select * from Delegado natural join Policial natural join Funcionario natural join Pessoa) Del
	on Operacao.ID_Func = Del.ID_Func;

	-- 15) Liste os equipamentos junto de todos os policiais (Mesmo que ainda não possuam nenhum)
	select * from Equipamento
	right join (select * from Policial natural join Funcionario natural join Pessoa) Pol
	on Equipamento.ID_Func = Pol.ID_Func;

	-- 16) Liste os boletins junto de todos os atendentes (Mesmo que ainda não tenham registrado nenhum)
	select * from Boletim_Ocorrencia
	right join (select * from Atendente natural join Funcionario natural join Pessoa) Atd
	on Boletim_Ocorrencia.ID_Func = Atd.ID_Func;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------
-- d) Duas consultas usando o operador de divisão.
	-- 1) Liste os policiais que participaram de todas as operações das seguintes datas 01/03/2024, 01/04/2024 e 01/05/2024
	select ID_Func, count(*) from
		((select ID_Op, Data_Op, ID_Func as ID_Del from Operacao where Data_Op = '2024-03-01')
		union
		(select ID_Op, Data_Op, ID_Func as ID_Del from Operacao where Data_Op = '2024-04-01')
		union
		(select ID_Op, Data_Op, ID_Func as ID_Del from Operacao where Data_Op = '2024-05-01')) Ops 
	natural join
	(select * from Policial natural join Policial_Operacao) Result
	group by ID_Func
	having count(*) > 2;

	-- 2) Liste os boletins que possuem como evidências “Impressões digitais encontradas na cena do crime” e “Arma do crime com vestígios de sangue”
	select ID_Bol, count(*) from
		((select ID_Evi, Descricao, ID_Func as ID_Inv from Evidencias where Descricao = 'Impressões digitais encontradas na cena do crime')
		union
		(select ID_Evi, Descricao, ID_Func as ID_Inv from Evidencias where Descricao = 'Arma do crime com vestígios de sangue')) Descs
	natural join
	(select * from Boletim_Evidencia natural join Boletim_Ocorrencia) Result
	group by ID_Bol
	having count(*) > 1;
select * from Boletim_Evidencia natural join Boletim_Ocorrencia;



-- e) Dez consultas utilizando funções agregadas.
	-- 1) Exiba a quantidade de equipamento de proteção cadastrados
    select count(*) from Equipamento_Protecao;

	-- 2) Exiba a quantidade de veículos cadastrados
	select count(*) from Veiculo;

	-- 3) Exiba a média dos salários de todos os delegados
	select avg(Salario) from (select * from Delegado natural join Policial natural join Funcionario) Del;

	-- 4) Exiba a operação mais recente
	select max(Data_Op) from Operacao;

	-- 5) Exiba a operação mais antiga
	select min(Data_Op) from Operacao;

	-- 6) Exiba a quantidade de equipamentos cadastrados
    select count(*) from Equipamento;

	-- 7) Exiba a quantidade de funcionários cadastrados
    select count(*) from Funcionario;

	-- 8) Exiba a média dos salários entre todos os funcionários
	select avg(Salario) from Funcionario;

	-- 9) Exiba a média dos salários de todos os policiais
	select avg(Salario) from (select * from Policial natural join Funcionario) Pol;

	-- 10) Exiba o meliante mais velho
	select Nome, Idade from (select * from Vitima natural join Pessoa) Mel
    where Idade = (select max(Idade) from (select * from Vitima natural join Pessoa) Mel);