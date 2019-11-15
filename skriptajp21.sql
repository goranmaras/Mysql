drop database if exists edunovajp21;
create database edunovajp21;
use edunovajp21;

create table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    trajanje int not null,
    cijena decimal(18,2) not null,
    upisnina decimal(18,2) not null,
    verificiran boolean default true
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(100) not null
);

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    smjer int not null,
    predavac int,
    brojpolaznika int not null,
    datumpocetka datetime 
);

create table predavac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table polaznik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    brojugovora varchar(50) not null
);

create table clan(
    grupa int not null,
    polaznik int not null
);


alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);




select * from smjer;

#describe smjer;

# ne tako dobra
#1
insert into smjer values (null,'Java programiranje',130,6999.99,500,null);

# malo bolji 1
#2
insert into smjer (naziv,trajanje,cijena,upisnina) values 
('PHP programer',130,4999.90,500);

# malo bolji 2
#3
insert into smjer (cijena, upisnina, trajanje, naziv) values
(1000,100,100,'Računalni operator');

# primjer dobre prakse
#4
insert into smjer(sifra,naziv,trajanje,cijena,upisnina,verificiran) values
(null,'Knjigovodstveni operater',180,8900,500,true);

#describe grupa;

#select * from grupa;
#1
insert into grupa (naziv,smjer,brojpolaznika) values
('JP21',1,18);

#2
insert into grupa (naziv,smjer,brojpolaznika) values
('PP20',2,18);

#3
insert into grupa (naziv,smjer,brojpolaznika,datumpocetka) values
('RO1',4,18,'2019-11-13 20:00:00');


#describe osoba;

#select * from osoba;

#1
insert into osoba(ime,prezime,email) values 
('Tomislav','Jakopec','tjakopec@gmail.com');

# 2-23
insert into osoba(sifra,ime,prezime,email) values
(null,'Mirko','Rešetar','reso28@gmail.com'),
(null,'Filip','Gelenčir','stoka199@gmail.com'),
(null,'Bruno','Gelenčir','gelencirbruno@gmail.com'),
(null,'Filip','Volarević','voki095@gmail.com'),
(null,'Marko','Milić','marko.milic224@gmail.com'),
(null,'Azinić','Andrija','azinic1999@gmail.com'),
(null,'Zvonimir','Mesinger','zvonimir.mesinger@gmail.com'),
(null,'Boris','Lasović','lasovic@gmail.com'),
(null,'Maksima','Mijatović','maxima.mijatovic@gmail.com'),
(null,'Nikola','Juzbašić','nikolajuzbasic70@gmail.com'),
(null,'Sven','Čevapović','svencevapovic77@gmail.com'),
(null,'Luka','Poznić','lpoznic@net.hr'),
(null,'Dario','Perišić','perisicdario2702@gmail.com'),
(null,'Dario','Trtanj','trtanjd@gmail.com'),
(null,'Božena','Palić Cerić','bozena.palic@gmail.com'),
(null,'Nikola','Milić','nikk.mil@gmail.com'),
(null,'David','Petrić','petricdavid@protonmail.ch'),
(null,'Goran','Maras','goran.maras77@gmail.com'),
(null,'Marko','Grbeš','marko.grbes1@gmail.com'),
(null,'Matej','Šapina','sapina.matej@yahoo.com'),
(null,'Josip','Dasović','josip.dasovic22@gmail.com'),
(null,'Goran','Kovač','gokovac@gmail.com');

#24-44
insert into osoba (sifra,ime,prezime,oib,email) values
(null,'Damir','Škrebljin',null,'skrebljin@hotmail.com'),
(null,'Mirza','Deagić',null,'mirza.delagic@gmail.com'),
(null,'Marko','Biskupić',null,'biskupicmarko4@gmail.com'),
(null,'Filip','Poslek',null,'fposlek@gmail.com'),
(null,'Kristijan','Vidaković',null,'kristijan.vidakovic111@gmail.com'),
(null,'Matej','Malčić',null,'matej.malcic3@gmail.com'),
(null,'Antonio','Grbeša',null,'agrbesa995@gmail.com'),
(null,'Ivan','Jozing',null,'ivan.jozing1@gmail.com'),
(null,'Ivan','Damjanović',null,'damjanovic.ivan87@gmail.com'),
(null,'Stjepan','Perišin',null,'stjepan@xenios.hr'),
(null,'Luka','Vuk',null,'luka.vuk456@gmail.com'),
(null,'Vedran','Stojnović',null,'phidrho@gmail.com'),
(null,'Ivor','Ćelić',null,'ivorcelic@gmail.com'),
(null,'Matija','Špoljar',null,'spoljo1122@gmail.com'),
(null,'Anita','Račman',null,'racmananita@gmail.com'),
(null,'Tomislav','Zidar',null,'zidarto@hotmail.com'),
(null,'Renato','Topić',null,'renato.topic@gmail.com'),
(null,'Tomislav','Grebenar',null,'tomislav.grebenarlb@gmail.com'),
(null,'Vladimir','Grebenar',null,'vladimir.grebenar@gmail.com'),
(null,'David','Čiček',null,'official.davidcicek@gmail.com'),
(null,'Dijana','Pandurević',null,'dijana.pandurevic@gmail.com');

#45
insert into osoba(ime,prezime,email) values 
('Shaquille','O''Neal','šaki@gmail.com');

#describe predavac;

#select * from predavac;

insert into predavac (osoba) values (1),(45);

#describe polaznik;

#1-43
insert into polaznik (osoba,brojugovora)
select sifra, '' from osoba where sifra not in (1,45);

#describe clan;

insert into clan(grupa,polaznik)
select 1,sifra from polaznik where sifra<=22;

insert into clan(grupa,polaznik)
select 2,sifra from polaznik where sifra>22;



