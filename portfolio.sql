drop database if exists portfolio;
create database portfolio character set utf8;
use portfolio;

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) not null
);

create table novcanik(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    korisnik int not null,
    kriptovaluta int not null,
    vrijednost decimal(18,8) not null
);

create table kriptovaluta(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    oznaka varchar(50) not null
);

create table transakcija(
    sifra int not null primary key auto_increment,
    exchange int not null,
    kupnja decimal(18,8),
    prodaja decimal(18,8),
    datumtransakcije datetime not null,
    cijenakupnje decimal(18,2),
    cijenaprodaje decimal(18,2),
    kriptovaluta int not null
);

create table exchange(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    certificiran boolean
);

alter table novcanik add foreign key (korisnik) references korisnik(sifra);
alter table transakcija add foreign key (kriptovaluta) references kriptovaluta(sifra);
alter table novcanik add foreign key (kriptovaluta) references kriptovaluta(sifra);
alter table transakcija add foreign key (exchange) references exchange(sifra);

insert into korisnik(sifra,ime,prezime,email)values
(null,'Ivan','Morgić','ivanmorgic@email.com'),
(null,'Marin','Spasojević','mspasojevic@gmail.com'),
(null,'Luka','Malinić','malina123@gmail.com');

insert into exchange(sifra,naziv,certificiran)values
(null,'KuCoin',true),
(null,'Binance',true),
(null,'Hotbit',false);

insert into kriptovaluta(sifra,naziv,oznaka)values
(null,'Bitcoin','BTC'),
(null,'Ethereum','ETH'),
(null,'Binance coin','BNB');

insert into transakcija(sifra,exchange,kupnja,prodaja,datumtransakcije,cijenakupnje,cijenaprodaje,kriptovaluta)values
(null,1,'1','0',01-19-2021,3452.12,0,2),
(null,2,'0','3',09-12-2021,0,43567.21,1),
(null,3,'10','0',10-13-2021,356.12,0,3);