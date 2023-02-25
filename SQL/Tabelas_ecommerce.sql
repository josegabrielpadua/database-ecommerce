#Criação de banco de dados


#DROP DATABASE ecommerce;

CREATE SCHEMA ecommerce;

USE ecommerce;

CREATE TABLE person(
	idPerson int auto_increment primary key,
	NameP varchar(45) not null, 
    sex char(10), 
    Address varchar(255) not null, 
    telephone varchar(15), 
    birth_day_date date not null
);

CREATE TABLE naturalPerson(
	idNaturalPerson int auto_increment,
	idNaPerson int,
    CPF varchar(45) not null,
    primary key(IdNaPerson),
    key(idNaturalPerson),
    constraint fk_naturalperson_person foreign key(idNaPerson) references person(idPerson)
);

CREATE TABLE legalPerson(
	idLegalPerson int auto_increment,
	idLePerson int,
	socialName varchar(50), 
    CNPJ varchar(45), 
    primary key(idLePerson),
    key(idLegalPerson),
    constraint fk_legalperson_person foreign key(idLePerson) references person(idPerson)
);

CREATE TABLE clients(
	idClient int auto_increment,
	idCPerson int, 
    idCNaturalPerson int,
    idCLegalPerson int,
	identification enum('Pessoa Física', 'Pessoa Jurídica') default 'Pessoa Física',
    primary key(idClient, idCPerson, idCNaturalPerson, idCLegalPerson),
    constraint fk_clients_naturalperson foreign key(idCNaturalPerson) references naturalPerson(idNaturalPerson),
    constraint fk_clients_legalperson foreign key(idCLegalPerson) references legalPerson(idLegalPerson),
    constraint fk_clients_person foreign key(idCPerson) references person(idPerson)
);

CREATE TABLE supplier(
	idSupplier int auto_increment,
	idSPerson int, 
    idSLegalPerson int, 
    locality varchar(45),
    primary key(idSupplier, idSPerson, idSLegalPerson),
    constraint fk_supplier_person foreign key(idSPerson) references person(idPerson),
    constraint fk_supplier_legalperson foreign key(idSLegalPerson) references legalPerson(idLegalPerson)
);

CREATE TABLE seller(
	idSeller int auto_increment,
	idSelLegalPerson int, 
    storeName varchar(60),
    primary key(idSeller, idSelLegalPerson),
    constraint fk_seller_legalperson foreign key(idSelLegalPerson) references person(idPerson)
);

CREATE TABLE product(
	idProduct int auto_increment primary key,
	product_name varchar(100), 
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Youtuber', 'Móveis'), 
    feedback float, 
    size varchar(45)
);

CREATE TABLE payments(
	idPayments int auto_increment,
    idPayClient int, 
    idPayPerson int, 
    idPayNaturalPerson int, 
    idPayLegalPerson int,
    primary key(idPayments, idPayClient, idPayPerson, idPayNaturalPerson, idPayLegalPerson),
    typePayment enum('Cartão', 'PIX', 'Boleto', 'Dois cartões'), 
    limitAvailable float, 
    constraint fk_payments_client foreign key (idPayClient) references clients(idClient),
    constraint fk_payments_person foreign key (idPayPerson) references person(idPerson),
    constraint fk_payments_natural foreign key (idPayNaturalPerson) references naturalPerson(idNaturalPerson),
    constraint fk_payments_legalperson foreign key (idPayLegalPerson) references legalPerson(idLegalPerson)
);

CREATE TABLE clientOrder(
	trackingCode bigint,
    idOrder int auto_increment,
	idOrderClient int, 
	orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento', 
    orderDescription varchar(255), 
    sendValue float default 5.00, 
	primary key(idOrder, idOrderClient),
    constraint fk_clientorder_client foreign key(idOrderClient) references clients(idClient)
);

CREATE TABLE productStorage(
	idProductStorage int auto_increment primary key,
	storageLocation varchar(255), 
    quantity int default 0
);

CREATE TABLE productSeller(
    idPSeller int, 
    idPproduct int,
    prodQuantity int default 0,
    primary key(idPSeller, idPproduct),
    constraint fk_productseller_seller foreign key(idPSeller) references seller(idSeller),
    constraint fk_productseller_product foreign key(idPproduct) references product(idProduct)
);

CREATE TABLE productOrder(
	idPOproduct int, 
    idPOorder int, 
    poQuantity int default 0, 
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key(idPoproduct, idPOorder),
    constraint idPOproduct foreign key (idPOproduct) references product(idProduct),
    constraint idPOorder foreign key (idPOorder) references clientOrder(idOrder)
);

CREATE TABLE productSupplier(
	idPsSupplier int, 
    idPsProduct int, 
    Psquantity int default 0,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_productsupplier_supllier foreign key(idPsSupplier) references supplier(idSupplier),
    constraint fk_productsupplier_product foreign key(idPsProduct) references product(idProduct)
);

CREATE TABLE storageLocation(
	idLproduct int, 
    idLstorage int, 
    Location varchar(255),
    primary key (idLproduct, idLstorage),
    constraint fk_storagelocation_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storagelocation_storage foreign key (idLstorage) references productStorage(idProductStorage)
);