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
    naziv varchar(50),
    korisnik int not null,
    kriptovaluta int not null,
    vrijednost varchar(50)
);

create table kriptovaluta(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    oznaka varchar(50),
    transakcija int not null
);

create table transakcija(
    sifra int not null primary key auto_increment,
    exchange int not null,
    kupnja decimal(18.2),
    prodaja decimal(18.2),
    oznakakriptovalute varchar(50)
);

create table exchange(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    certificiran boolean
);

alter table novcanik add foreign key (korisnik) references korisnik(sifra);
alter table kriptovaluta add foreign key (transakcija) references transakcija(sifra);
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

insert into transakcija(sifra,exchange,kupnja,prodaja,oznakakriptovalute)values
(null,1,10040.13,0,'BTC'),
(null,3,45666.25,0,'ETH'),
(null,2,0,21342.12,'BNB');

insert into kriptovaluta(sifra,naziv,oznaka,transakcija)values
(null,'Bitcoin','BTC',1),
(null,'Ethereum','ETH',2),
(null,'Binance coin','BNB',3);