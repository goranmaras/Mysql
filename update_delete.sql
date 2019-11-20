#
# UPDATE
#

select * from osoba where sifra=1;

# osnovna update naredba
# u ovoj naredbi mjenjamo samo jedan atribut (kolonu)
# uvijek staviti where s primanim ključem jer na taj način mjenjamo samo jedan red
update osoba set oib='21966613469' where sifra=1;

select * from osoba where sifra=12;

# u ovoj naredbi mjenjamo dva atributa (kolone)
update osoba set oib='50297299522', prezime='Grgić' where sifra=12;

# u ovoj naredbi mjenjamo dva atributa (kolone)
# atributu oib postavljamo ne poznavanje vrijednosti, dok na prezime praznu ali poznu ali poznatu vrijednost
update osoba set oib=null, prezime='' where sifra=12;


update osoba set prezime='Čevapivić';

select * from smjer;

# svim smjerovima povećati upisninu za 10%

update smjer set cijena=cijena*1.1;

update smjer set upisnina=upisnina*1.1;

update smjer set upisnina=upisnina*0.9;


# zadatak
# 1. Uvećajte cijene svih smjerova za 100 kn
# 2. Postavite Tomislav Jakopec kao predavač grupe JP21
# 3. postavite Shaquille O'Neal kao predavač grupe PP20

select * from grupa;
select * from predavac;
select * from osoba;
# jp21
update grupa set predavac=1 where sifra=1;

# pp20
update grupa set predavac=2 where sifra=2;


#
# DELETE
#

# Zadatak
# u sve tablice unijeti po jedan novi red

insert into osoba(ime,prezime,email) values 
('Pero','Perić','pero@gmail.com'),
('Marko','Marković','marko@gmail.com');

insert into predavac (osoba) values (46);

insert into polaznik (osoba,brojugovora) values (47,'');

insert into smjer (cijena, upisnina, trajanje, naziv) values
(1000,100,100,'Marketing');

insert into grupa (naziv,smjer,predavac,brojpolaznika) values
('M1',5,3,18);

insert into clan (grupa, polaznik) values (3,64);

select * from ;

delete from clan where grupa=3 and polaznik=64;

delete from polaznik where sifra=64;

delete from osoba where sifra=47;

delete from grupa where sifra=3;

delete from predavac where sifra=3;

delete from osoba where sifra=46;

delete from smjer where sifra=5;













