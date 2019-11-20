drop database if exists fakultet;
create database fakultet default character set utf8;
use fakultet;

# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default-character-set=utf8 < C:\Users\Abraxas\Documents\VisualStudioCode\skriptafakultet.sql


create table kolegij(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    trajanje int not null,
    cijena int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) ,
    prezime varchar(50) , 
    oib char(11) ,
    email varchar(50) 
);

create table predavac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table student(
    sifra int not null primary key auto_increment,
    osoba int not null,
    godina varchar(50)
);

create table rok (
    sifra int not null primary key auto_increment,
    kolegij int not null,
    datum datetime
);

create table prijava (
    rok int not null,
    student int not null 
);

alter table rok add foreign key(kolegij) references kolegij(sifra);
alter table predavac add foreign key(osoba) references osoba(sifra);
alter table student add foreign key(osoba) references osoba(sifra);
alter table prijava add foreign key(rok) references rok(sifra);
alter table prijava add foreign key(student) references student(sifra);

insert into kolegij(naziv,trajanje,cijena) values
('Matematika',2,1100),
('Energetika',1,800),
('Programiranje',3,2000),
('Fizika',2,500),
('Elektrotehnika',3,1800);
#1
insert into osoba(ime,prezime,email) values 
('Tomislav','Jakopec','tjakopec@gmail.com'),
('Miko','Mikić','tjakopec@gmail.com'),
('Pero','Perić','tjakopec@gmail.com');

# 4-25
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

#25-46
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

insert into predavac(osoba) values (1),(2),(3);

insert into student(osoba)
select sifra from osoba where sifra not in (1,2,3);

insert into rok(kolegij,datum) values
(1,'2019-11-29 11:00:00'),
(2,'2019-11-30 11:00:00'),
(3,'2019-12-4 11:00:00'),
(4,'2019-12-9 11:00:00'),
(5,'2019-12-19 11:00:00');

insert into prijava(rok,student) select 1,student.sifra from student where student.sifra<=11;
insert into prijava(rok,student) select 2,student.sifra from student where student.sifra>11 and student.sifra<19;
insert into prijava(rok,student) select 3,student.sifra from student where student.sifra>=19 and student.sifra<25;
insert into prijava(rok,student) select 4,student.sifra from student where student.sifra>=25 and student.sifra<33;
insert into prijava(rok,student) select 5,student.sifra from student where student.sifra>=33 and student.sifra<46;

UPDATE osoba set oib='37322563557' where sifra = 21;
UPDATE osoba set oib='63486345465' where sifra = 22;
UPDATE osoba set oib='30978789213' where sifra = 23;

update kolegij set cijena=cijena*1.2;

update rok set datum='2019-12-7 09:00:00' where sifra =1;

delete from osoba where sifra=21;
delete from kolegij where sifra=1;
