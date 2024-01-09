CREATE DATABASE KonveksiSablon01;
USE KonveksiSablon01;

create table Login (
id int not null primary key,
username varchar(45),
password varchar(45)
);

create table Kasir (
No_Transaksi varchar(255) not null primary key,
Tanggal_Proses Date,
Total Decimal,
Nama_Customer varchar(20)
);

create table psa (
Id_PSA int not null primary key auto_increment,
No_Transaksi varchar(225),
Nama_Customer varchar(20),
No_HP varchar(13),
Kode_Barang varchar(255),
Jumlah int,
Total decimal(10),
Status enum("Prosses","Sablon") default "Prosses",
Last_Update timestamp default current_timestamp,
tanggal_prosses date,
Deadline date
);

create table histori (
No_Transaksi varchar(255),
nama varchar(20),
No_HP varchar(13),
Kode_Barang varchar(255),
Jumlah int,
Deadline date,
Status varchar(16),
Total Decimal(10)
);

create table inputBarang (
Kode_Barang varchar(255) not null primary key,
Nama_Barang varchar(20),
Ukuran enum("S","M","L","XL","XXL","XXXL","-"),
Harga_Beli decimal(10),
Harga_Jual decimal(10),
Stock int
);

create table inputCustomer (
Id_Customer varchar(255) not null primary key,
Nama_Customer varchar(20),
No_HP varchar(13)
);

CREATE INDEX idx_inputCustomer ON inputcustomer(Nama_Customer);
alter table kasir add constraint fk_Nama_Customer foreign key (Nama_Customer) references inputCustomer (Nama_Customer);
alter table psa add constraint fk_No_Transaksi foreign key (No_Transaksi) references kasir (No_Transaksi);
alter table psa add constraint fk_Kode_Barang foreign key (Kode_Barang) references inputBarang (Kode_Barang);
alter table histori add constraint fk_No_Transaksi_psa foreign key (No_Transaksi) references kasir (No_Transaksi);

alter table kasir drop foreign key fk_Nama_Customer;
alter table psa drop foreign key fk_No_Transaksi;
alter table psa drop foreign key fk_Kode_Barang;
alter table histori drop constraint fk_No_Transaksi_psa;




INSERT INTO inputbarang VALUES('B001','Kaos Polos Putih','S','40.000','48.000','2');
INSERT INTO inputbarang VALUES('B002','Kaos Polos Hitam','L','45.000','53.000','4');
INSERT INTO inputbarang VALUES('B003','Kacamata','-','13.000','15.000','10');
INSERT INTO inputbarang VALUES('B004','Celana Training','XL','30.000','37.000','5');
INSERT INTO inputbarang VALUES('B005','Kaos Polo Hitam','L','23.000','27.000','8');
INSERT INTO inputbarang VALUES('B006','Gelang','-','5000','7000','10');
INSERT INTO inputbarang VALUES('B007','Topi','-','10000','15000','15');
INSERT INTO inputbarang VALUES('B008','Jaket','XL','80000','90000','20');
INSERT INTO inputbarang VALUES('B009','Hoodie','XL','85000','90000','25');
INSERT INTO inputbarang VALUES('B010','Kaos Partai','L','25000','30000','30');
INSERT INTO inputbarang VALUES('B011', 'Coach Jacket' , 'S', 10000, 15000, 50);
INSERT INTO inputbarang VALUES('B012','Coach Jacket', 'L' , 20000, 25000, 50);
INSERT INTO inputbarang VALUES('B013', 'Coach Jacket', 'XL', 30000, 35000, 50);
INSERT INTO inputbarang VALUES('B014','Coach Jacket','XXL',40000,45000, 50);
INSERT INTO inputbarang VALUES('B015','Coach Jacket','XXXL' ,50000, 55000, 50);
INSERT INTO inputbarang VALUES('B016','Sablon DTF','S' ,15000, 30000, 30);
INSERT INTO inputbarang Values('B017','Sablon DTF','L' ,20000, 35000, 35);
INSERT INTO inputbarang Values('B018','Sablon DTF','XL' ,25000, 35000, 40);
INSERT INTO inputbarang values('B019','Sablon DTF','XXL',25000, 40000, 50);
INSERT INTO inputbarang values('B020','Sablon DTF','XXXL',25000, 40000, 50);
SELECT * FROM inputbarang;

INSERT INTO inputcustomer VALUES('C001','Lintang','089659001222');
INSERT INTO inputcustomer VALUES('C002','Dyahna','085791645963');
INSERT INTO inputcustomer VALUES('C003','Kaka','085707308476');
INSERT INTO inputcustomer VALUES('C004','Daffa','083131693014');
INSERT INTO inputcustomer VALUES('C005','Ghoza','08155290506');
INSERT INTO inputcustomer VALUES('C006','Patria','08155290509');
INSERT INTO inputcustomer VALUES('C007','Alfariz','08155290597');
INSERT INTO inputcustomer VALUES('C008','Halima','08155290509');
INSERT INTO inputcustomer VALUES('C009','Atus','08155298706');
INSERT INTO inputcustomer VALUES('C010','Firnan','08198290506');
INSERT INTO inputCustomer VALUES('C011', 'Hafizhsyah' , '01230898102');
INSERT INTO inputCustomer VALUES('C012', 'Rizki' , '012374123');
INSERT INTO inputCustomer VALUES('C013', 'Himma' , '08194123441');
INSERT INTO inputCustomer VALUES('C014', 'Ria' , '087123444123');
INSERT INTO inputCustomer VALUES('C015' ,'Soplek' , '08788812333');
insert into inputCustomer values('C016' ,'Dea', '08155290501');
insert into inputCustomer values('C017' , 'Fadhea','08155290502');
insert into inputCustomer values('C018','Rhea','08155290503');
INSERT INTO inputCustomer values('C019','Yesha','08155290504');
insert into inputCustomer values('C020','Siti','08155290505');
SELECT * FROM inputcustomer;

ALTER TABLE inputCustomer DROP column No_Hp ;
alter table inputcustomer add column No_Hp varchar(13);

ALTER TABLE inputBarang DROP column Harga_Beli;
DROP Table login;
select * from login;

update inputcustomer set Nama_Customer = 'Ginas' where Id_Customer = 'C001';
update inputcustomer set Nama_Customer = 'Yahna' where Id_Customer = 'C002';

delete from inputCustomer where id_customer = 'C001';
delete from inputcustomer where id_customer = 'C003';


alter table inputbarang add column Jenis_Barang enum("Baju", "Aksesoris", "Sablon");
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B001";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B002";
update inputbarang set Jenis_Barang = "Aksesoris" where Kode_Barang = "B003";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B004";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B005";
update inputbarang set Jenis_Barang = "Aksesoris" where Kode_Barang = "B006";
update inputbarang set Jenis_Barang = "Aksesoris" where Kode_Barang = "B007";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B008";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B009";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B010";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B011";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B012";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B013";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B014";
update inputbarang set Jenis_Barang = "Baju" where Kode_Barang = "B015";
update inputbarang set Jenis_Barang = "Sablon" where Kode_Barang = "B016";
update inputbarang set Jenis_Barang = "Sablon" where Kode_Barang = "B017";
update inputbarang set Jenis_Barang = "Sablon" where Kode_Barang = "B018";
update inputbarang set Jenis_Barang = "Sablon" where Kode_Barang = "B019";
update inputbarang set Jenis_Barang = "Sablon" where Kode_Barang = "B020";

insert into Login values (1, "admin", "admin");
update login set username = "konveksisablon", password = "12345" WHERE Id = 1;


alter table kasir add column Deadline Date;
select count(nama_barang) as jumlah, harga_jual from inputbarang group by harga_jual having jumlah > 1 order by harga_jual asc;   
select Nama_Barang, harga_jual - 1000 as harga_diskon from inputbarang;
select count(Nama_Barang) as jumlah, harga_jual from inputbarang group by harga_jual;

select * from inputbarang;
select nama_barang from inputbarang;
select nama_barang as barang from inputbarang;
select * from inputbarang where Kode_Barang = "B010";
select * from inputbarang where kode_barang != "B001";
select nama_barang, harga_jual - 1000 as harga_diskon from inputbarang;	
select nama_barang from inputbarang where harga_jual > 10000;
select nama_barang from inputbarang where harga_jual between 1 and 10000;
select nama_barang from inputbarang where harga_jual >10 and Harga_Jual <10000;
select nama_barang  from inputbarang where harga_jual = 7000 and Nama_Barang = "gelang";
select nama_barang from inputbarang where Nama_Barang = "gelang" or Nama_Barang = 'jersey';
select nama_barang from inputbarang where nama_barang = "jersey" or Harga_beli > 10000;
select nama_barang from inputbarang where not Nama_Barang = "jersey";
select nama_barang from inputbarang where nama_barang in ("gelang","topi","jersey");
select nama_barang from inputbarang where nama_barang like '%a%';
select nama_barang from inputbarang where Nama_Barang like '%a';
select nama_barang from inputbarang where Nama_Barang like 'j%';
select count(nama_barang) as jumlah from inputbarang;
select sum(harga_jual) as total_hargaJual from inputbarang;
select avg(harga_jual) as rataRata_harga from inputbarang;
select min(harga_jual) as harga_terendah from inputbarang;
select max(harga_jual) as harga_tertinggi from inputbarang;
select * from inputbarang order by Nama_Barang ASC;
select * from inputbarang order by Nama_barang DESC;
select * from inputbarang order by Harga_Jual desc;
select count(nama_barang) as jumlah, harga_jual from inputbarang group by harga_jual order by jumlah asc;
select count(nama_barang) as jumlah, harga_jual from inputbarang group by harga_jual having jumlah > 1 order by jumlah desc;
select count(harga_jual) as jumlah, nama_barang from inputbarang group by Nama_Barang order by jumlah asc;