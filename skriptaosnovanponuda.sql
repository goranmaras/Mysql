drop database if exists osnovna;
create database osnovna default character set utf8;
use osnovna;

#c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default-character-set=utf8 < C:\Users\Abraxas\Documents\VisualStudioCode\skriptaosnovanponuda.sql

create table osnovnaponuda(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    brojponude int,
    prostorija int
);

create table prostorija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    kat int
);

create table kat(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

alter table osnovnaponuda add foreign key (prostorija) references prostorija(sifra); 
alter table prostorija add foreign key (kat) references kat(sifra); 
alter table kat auto_increment=100;


insert into kat (naziv) values
('Prizemlje'),('Prvi'),('drugi'),('Treci'),('Četvrti'),('Peti');

insert into prostorija(naziv,kat) select '',sifra from kat where sifra not in (1);

update prostorija
set naziv='UredPrizemlje'
where sifra=1;
update prostorija
set naziv='UredPrvi'
where sifra=2;
update prostorija
set naziv='UredDrugi'
where sifra=3;
update prostorija
set naziv='UredTreci'
where sifra=4;