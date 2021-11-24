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
    vrijednost varchar(50)
);

create table kriptovaluta(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    oznaka varchar(50),
    marketcap decimal(18.2),
    transakcija int not null,
    novcanik int not null
);

create table transakcija(
    sifra int not null primary key auto_increment,
    exchange int not null,
    vrijednost decimal(18.2),
    oznakakriptovalute varchar(50)
);

create table exchange(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    certificiran boolean
);

alter table novcanik add foreign key (korisnik) references korisnik(sifra);
alter table kriptovaluta add foreign key (transakcija) references transakcija(sifra);
alter table kriptovaluta add foreign key (novcanik) references novcanik(sifra);
alter table transakcija add foreign key (exchange) references exchange(sifra);