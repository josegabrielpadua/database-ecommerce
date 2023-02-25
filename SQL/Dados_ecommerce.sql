INSERT INTO person(NameP, sex, Address, telephone, birth_day_date)
	VALUES('José Gabriel', 'Masculino', 'Rua Alberto Roberto 896, Zona Leste - Jardim Brasil', '1192388123', '2004-09-02'),
		  ('Matheus', 'Masculino', 'Rua Alemeda 289, Centro - Jardim ipê', '3898547134', '1998-12-08'),
          ('Neuza', 'Feminino', 'Avenida Coller 98, Zona Sul - Cidade das Flores', '2796631122', '1995-04-09'),
          ('Ricardo', 'Masculino', 'Avenida Jesus Cristo 43, interior - Cabreuva', '1196534432', '1990-07-25'),
		  ('Maria', 'Feminino', 'Rua Yokohama 78, Zona norte - Jardim Japão', '1198657654', '1986-05-17');
    
INSERT INTO naturalPerson(CPF, idNaPerson)
	VALUES('111.111.111-01', 1),
		  ('488.010.172-03', 2),
          ('532.041.582-05', 3),
          ('213.923.654-02', 4),
		  ('434.868.988-05', 5);
 
 
INSERT INTO legalPerson(socialName, CNPJ, idLePerson)
	VALUES(null, null, 1),
		  ('Blazerbrás',  '13.349.659/0001-09', 2),
          (null, null, 3),
		  (null, null, 4),
	      ('Paoenas', '98.393.134/0001-05', 5);

INSERT INTO clients(identification, idCPerson, idCNaturalPerson, idCLegalPerson)
	VALUES('Pessoa Física', 1, 1, 1),
		  ('Pessoa Jurídica', 2, 2, 2),
          ('Pessoa Física', 3, 3, 3),
          ('Pessoa Física', 4, 4, 4),
          ('Pessoa Jurídica', 5, 5, 5);
    
INSERT INTO supplier(idSPerson, idSLegalPerson, locality)
	VALUES(1, 1, null),
		  (2, 2, null),
          (3, 3, null),
          (4, 4, null),
          (5, 5, 'Avenida Blastoise 46 - Zona norte, Santana');

INSERT INTO seller(idSelLegalPerson, storeName)
	VALUES(1, null),
		  (2, 'RicardinhoBlazerStore'),
          (3, null),
          (4, null),
          (5, 'MegaStore');

INSERT INTO product(product_name, category, feedback, size)
	VALUES('Tablet', 'Eletrônico', 4.5, null),
		  ('Barbie Elsa', 'Brinquedos', 5, null),
          ('Body Carters', 'Vestimenta', 3.5, null),
          ('Microfone Vedo - Youtuber', 'Eletrônico', 4.5, null),
          ('Sofá retrátil', 'Móveis', 5, '3x57x80');

INSERT INTO payments(typePayment, limitAvailable, idPayClient, idPayPerson, idPayNaturalPerson, idPayLegalPerson)
	VALUES('Cartão', 150.00, 1, 1, 1, 1),
		  ('Cartão', 300.00, 2, 2, 2, 2),
		  ('PIX', null, 3, 3, 3, 3),
          ('Cartão', 400.00, 4, 4, 4, 4),
          ('Dois cartões', 500.00, 5, 5, 5, 5);
    
INSERT INTO clientOrder(orderStatus, orderDescription, sendValue, idOrderClient, trackingCode)
	VALUES('Confirmado', 'Compra via aplicativo', 15.00, 1, 838483284),
		  (default, 'Compra via website', 150.00, 2, 828138133),
          ('Confirmado', 'Compra via aplicativo', 28.00, 3, 821838381),
          (default, 'Compra via aplicativo', 13.50, 4, 828382131),
          (default, 'Compra via website', 8.60, 5, 88371273127);

INSERT INTO productStorage(storageLocation, quantity)
	VALUES('Rio de Janeiro', 1000),
		  ('Rio de Janeiro', 500),
          ('São Paulo', 10),
          ('São Paulo', 400),
          ('Brasília', 800);

INSERT INTO productSeller(idPSeller, idPproduct, prodQuantity)
	VALUES(2, 1, 500);
    
INSERT INTO productOrder(idPOproduct , idPOorder, poQuantity, poStatus)
	VALUES(1, 5, 2, default),
		  (2, 5, 1, default),
          (3, 4, 1, default),
          (2, 3, 3, default),
          (4, 2, 1, default),
          (5, 1, 2, default);
          
INSERT INTO productSupplier(idPsSupplier, idPsProduct, Psquantity)
	VALUES(5, 4, 500);

INSERT INTO storageLocation(idLproduct, idLstorage, Location)
	VALUES(1, 2, 'RJ'),
		  (2, 3, 'SP'),
          (4, 5, 'GO');



#Procurando informações de Cliente: Nome, telefone, nome do produto que comprou, categoria, status do pedido e quantidade( utilizando ORDER BY)

SELECT NameP as Client, telephone, product_name, category, orderStatus, poQuantity as quantity 
	FROM clients INNER JOIN clientOrder ON idClient = idOrderClient
		INNER JOIN productOrder ON idPOorder = idOrder
		INNER JOIN person ON idPerson = idClient
		INNER JOIN product ON idProduct = idPOorder
        ORDER BY orderStatus;

#Utilizando o HAVING

SELECT NameP as Client, telephone, product_name, category, orderStatus, poQuantity as quantity 
	FROM clients INNER JOIN clientOrder ON idClient = idOrderClient
		INNER JOIN productOrder ON idPOorder = idOrder
		INNER JOIN person ON idPerson = idClient
		INNER JOIN product ON idProduct = idPOorder
			HAVING quantity >= 2;
		

#Procurando vendendores que são fornecedores também

SELECT NameP as Name, storeName, locality, telephone, CNPJ 
	FROM supplier INNER JOIN seller ON idSelLegalPerson = idSLegalPerson
		INNER JOIN person ON idPerson = idSelLegalPerson
		INNER JOIN legalPerson ON idLePerson = idSelLegalPerson
			WHERE (storeName is not null) and (locality is not null);

#Relação de produtos fornecedores e estoque(Bônus: CNPJ, Telefone, categoria do produto, nome do produto, endereço)

SELECT NameP as Name, CNPJ, telephone, product_name, category, Psquantity as StockQuantity, address, location
	FROM productSupplier INNER JOIN product ON idPsProduct = idProduct
		INNER JOIN storageLocation ON idLProduct = idProduct
		INNER JOIN supplier ON idSupplier= idPsSupplier
		INNER JOIN person ON idPerson = idSPerson
		INNER JOIN legalPerson ON idLePerson = idPerson;
	
#Relação de fornecedores e nomes de produto

SELECT NameP as Name, product_name FROM productSupplier INNER JOIN product ON idPsProduct = idProduct
	INNER JOIN supplier ON idSupplier = idPsSupplier
    INNER JOIN person ON idPerson = idSPerson;
