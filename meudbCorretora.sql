CREATE DATABASE IF NOT EXISTS meudbCorretora DEFAULT CHARSET utf8;
USE meudbCorretora;

CREATE TABLE meudbCorretora.Cliente(
idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_sobrenome VARCHAR(50) NOT NULL
);

CREATE TABLE  meudbCorretora.Servico (
idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nome_servico VARCHAR(30) NOT NULL
);
  
CREATE TABLE meudbCorretora.Cargo(
idCargo  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_cargo VARCHAR(20) NOT NULL,
id_servico INT NOT NULL,
FOREIGN KEY(id_servico) REFERENCES meudbCorretora.Servico (idServico)
);
  
CREATE TABLE meudbCorretora.Funcionario(
idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_sobrenome VARCHAR(100) NOT NULL,
id_cargo INT,
FOREIGN KEY(id_cargo)REFERENCES meudbCorretora.Cargo (idCargo)
);
  
CREATE TABLE meudbCorretora.contato(
idContato INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
FOREIGN KEY(id_cliente) REFERENCES meudbCorretora.Cliente(idCliente),
data_hora DATETIME NOT NULL,
id_funcionario INT,
FOREIGN KEY(id_funcionario) REFERENCES meudbCorretora.Funcionario(idFuncionario)
);

SELECT * FROM cliente;
INSERT INTO cliente(nome_sobrenome)
VALUES('Tiago Santana'),
('Ericka Melo'),
('João Matias');

SELECT * FROM servico;
INSERT INTO servico(nome_servico)
VALUES('Seguro'),
('Auto');

SELECT * FROM cargo;
INSERT INTO cargo(nome_cargo,id_servico)
VALUES('Comercial',1),
('Operacional',2);

SELECT * FROM funcionario;
INSERT INTO funcionario(nome_sobrenome,id_cargo)
VALUES('Orlando_Batista',1),
('Jocilene',2);

SELECT * FROM contato;
INSERT INTO contato(id_cliente,data_hora,id_funcionario)
VALUES(1, '2022-06-11 10:30:00',1);

UPDATE funcionario
SET nome_sobrenome = 'Francisco Thalisson'
WHERE idFuncionario = 1;

DELETE FROM funcionario WHERE idFuncionario = 3;
DELETE FROM funcionario WHERE idFuncionario = 4;
DELETE FROM agendamento WHERE id_cliente = 1;