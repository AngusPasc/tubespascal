// konstanta
const
    coKapasitasMaksimum = 100;
    
// tipe baru
type
    Baju = record
        sNamaBaju               : string;
        sKategoriBaju           : string;
        sGenderPemakai          : string;
        sWarnaBaju              : string;
        rBeratPerBajuKg         : real;
        sBahanBaju              : string;
        iHarga                  : integer;
        iKetersediaanUkuranS    : integer;
        iKetersediaanUkuranM    : integer;
        iKetersediaanUkuranL    : integer;
        iKetersediaanUkuranXL   : integer;
        iJumlahPembelian        : integer;
        iGrosirDiskon           : integer;
    end; 
    
    Pengiriman = record
        sNamaEkspedisi          : string;
        sJenisLayananPengiriman : string;
        sNamaKota               : string;
        iBiayaKirimPerKg        : integer;
        iLamaPengiriman         : integer;
    end;

    Keranjang = record
        sNamaBaju               : string;
        sWarnaBaju              : string;
        rBeratPerBajuKg         : real;
        sBahanBaju              : string;
        iHarga                  : integer;
        iJumlahBeliS            : integer;
        iJumlahBeliM            : integer;
        iJumlahBeliL            : integer;
        iJumlahBeliXL           : integer;
    end;

    Transaksi = record
        sNamaBaju               : string;
        sWarnaBaju              : string;
        rBeratPerBajuKg         : real;
        sBahanBaju              : string;
        iHarga                  : integer;
        iJumlahBeliS            : integer;
        iJumlahBeliM            : integer;
        iJumlahBeliL            : integer;
        iJumlahBeliXL           : integer;
        sNamaEkspedisi          : string;
        sJenisLayananPengiriman : string;
        sNamaKotaTujuan         : string;
        iBiayaKirimPerKg        : integer;
        iLamaPengiriman         : integer;
        sTanggalKirim           : string;
    end;

    StokBaju = array [1..coKapasitasMaksimum] of Baju;
    
    EkspedisiPengiriman = array [1..coKapasitasMaksimum] of Pengiriman;
    
    KeranjangBelanja = array [1..coKapasitasMaksimum] of Keranjang;
    
    TransaksiBelanja = array [1..coKapasitasMaksimum] of Transaksi;
    
    
    
// Deklarasi Variabel Global
var
    eStokBaju               : StokBaju;
    eEkspedisiPengiriman    : EkspedisiPengiriman;
    eKeranjangBelanja       : KeranjangBelanja;
    eTransaksiBelanja       : TransaksiBelanja;
    
    fStokBaju               : Text;
    fEkpedisiPengiriman     : Text;
    fKeranjangBelanja       : Text;
    fTransaksiBelanja       : Text;



// Rancangan File Eksternal
//
// + fStokBaju.txt
// contoh isi berkas: 
// Blouse Etnik Sasmira | Blouse | Perempuan | Biru | 0.1 | Spandex | 3000 | 10 | 15 | 20 | 10 | 100 | 10
//
// + fEkpedisiPengiriman.txt
// contoh isi berkas: 
// JNE | YES | Surabaya | 9000 | 1
//
// + fKeranjangBelanja.txt
// contoh isi berkas: 
// Blouse Etnik Sasmira | Biru | 0.1 | Spandex | 3000 | 0 | 1 | 0 | 0
//
// + fTransaksiBelanja.txt
// contoh isi berkas: 
// Blouse Etnik Sasmira | Biru | 0.1 | Spandex | 3000 | 0 | 1 | 0 | 0 | JNE | YES | Surabaya | 9000 | 1 | 1/4/2015


//----------------------------------------------
// F1
// Membaca dan mengolah isi berkas semua file *.txt kemudian menyimpannya
// ke dalam enumerasi eSB, eEP, eKB, eTB
{
  Contoh i/o
}
{ 
  I.S. : 
  F.S. :
}


procedure sisipkanSB(sData : string; var eSB : StokBaju; iIndex : integer; iPetunjuk : integer);
var
    rData : real;
    iData : integer;
    iErr  : integer;
begin
    Val(sData, rData, iErr);
    Val(sData, iData, iErr);
    case iPetunjuk of
         1 : eSB[iIndex].sNamaBaju := sData;
         2 : eSB[iIndex].sKategoriBaju := sData;
         3 : eSB[iIndex].sGenderPemakai := sData;
         4 : eSB[iIndex].sWarnaBaju := sData;
         5 : eSB[iIndex].rBeratPerBajuKg := rData;
         6 : eSB[iIndex].sBahanBaju := sData;
         7 : eSB[iIndex].iHarga := iData;
         8 : eSB[iIndex].iKetersediaanUkuranS := iData;
         9 : eSB[iIndex].iKetersediaanUkuranM := iData;
        10 : eSB[iIndex].iKetersediaanUkuranL := iData;
        11 : eSB[iIndex].iKetersediaanUkuranXL := iData;
        12 : eSB[iIndex].iJumlahPembelian := iData;
        13 : eSB[iIndex].iGrosirDiskon := iData;
    end;
end;



procedure sisipkanEP(sData : string; var eEP : EkspedisiPengiriman; iIndex : integer; iPetunjuk : integer);
var
    rData : real;
    iData : integer;
    iErr  : integer;
begin
    Val(sData, rData, iErr);
    Val(sData, iData, iErr);
    case iPetunjuk of
         1 : eEP[iIndex].sNamaEkspedisi := sData;
         2 : eEP[iIndex].sJenisLayananPengiriman := sData;
         3 : eEP[iIndex].sNamaKota := sData;
         4 : eEP[iIndex].iBiayaKirimPerKg := iData;
         5 : eEP[iIndex].iLamaPengiriman := iData;
    end;
end;



procedure sisipkanKB(sData : string; var eKB : KeranjangBelanja; iIndex : integer; iPetunjuk : integer);
var
    rData : real;
    iData : integer;
    iErr  : integer;
begin
    Val(sData, rData, iErr);
    Val(sData, iData, iErr);
    case iPetunjuk of
         1 : eKB[iIndex].sNamaBaju := sData;
         2 : eKB[iIndex].sWarnaBaju := sData;
         3 : eKB[iIndex].rBeratPerBajuKg := rData;
         4 : eKB[iIndex].sBahanBaju := sData;
         5 : eKB[iIndex].iHarga := iData;
         6 : eKB[iIndex].iJumlahBeliS := iData;
         7 : eKB[iIndex].iJumlahBeliM := iData;
         8 : eKB[iIndex].iJumlahBeliL := iData;
         9 : eKB[iIndex].iJumlahBeliXL := iData;
    end;
end;



procedure sisipkanTB(sData : string; var eTB : TransaksiBelanja; iIndex : integer; iPetunjuk : integer);
var
    rData : real;
    iData : integer;
    iErr  : integer;
begin
    Val(sData, rData, iErr);
    Val(sData, iData, iErr);
    case iPetunjuk of
         1 : eTB[iIndex].sNamaBaju := sData;
         2 : eTB[iIndex].sWarnaBaju := sData;
         3 : eTB[iIndex].rBeratPerBajuKg := rData;
         4 : eTB[iIndex].sBahanBaju := sData;
         5 : eTB[iIndex].iHarga := iData;
         6 : eTB[iIndex].iJumlahBeliS := iData;
         7 : eTB[iIndex].iJumlahBeliM := iData;
         8 : eTB[iIndex].iJumlahBeliL := iData;
         9 : eTB[iIndex].iJumlahBeliXL := iData;
        10 : eTB[iIndex].sNamaEkspedisi := sData;
        11 : eTB[iIndex].sJenisLayananPengiriman := sData;
        12 : eTB[iIndex].sNamaKotaTujuan := sData;
        13 : eTB[iIndex].iBiayaKirimPerKg := iData;
        14 : eTB[iIndex].iLamaPengiriman := iData;
        15 : eTB[iIndex].sTanggalKirim := sData;
    end;
end;



function bacaStokBaju(sNamaFile : string) : StokBaju;
var
    i : integer;
    iPanjangS : integer;
    iAwal, iIndex, iData : integer;
    tBerkas : Text;
    sSementara : string;
    eSB : StokBaju;
begin
    Assign(tBerkas, sNamaFile);
    reset(tBerkas);
    while NOT(EOF(tBerkas)) do
    begin
        readln(tBerkas, sSementara);
        sSementara := concat(sSementara, ' |');
        iPanjangS := length(sSementara);
        iAwal := 0;
        iIndex := 1;
        iData := 1;
        for i := 1 to iPanjangS do
        begin
            if (sSementara[i] = '|') then
            begin
                sisipkanSB(copy(sSementara, iAwal + 1, i - iAwal - 2), eSB, iIndex, iData);
                iAwal := i + 1;
                iData := iData + 1;
            end;
        end;
        iIndex := iIndex + 1;
    end;
    close(tBerkas);
    bacaStokBaju := eSB;
end;



function bacaEkspedisiPengiriman(sNamaFile : string) : EkspedisiPengiriman;
var
    i : integer;
    iPanjangS : integer;
    iAwal, iIndex, iData : integer;
    tBerkas : Text;
    sSementara : string;
    eEP: EkspedisiPengiriman;
begin
    Assign(tBerkas, sNamaFile);
    reset(tBerkas);
    while NOT(EOF(tBerkas)) do
    begin
        readln(tBerkas, sSementara);
        sSementara := concat(sSementara, ' |');
        iPanjangS := length(sSementara);
        iAwal := 0;
        iIndex := 1;
        iData := 1;
        for i := 1 to iPanjangS do
        begin
            if (sSementara[i] = '|') then
            begin
                sisipkanEP(copy(sSementara, iAwal + 1, i - iAwal - 2), eEP, iIndex, iData);
                iAwal := i + 1;
                iData := iData + 1;
            end;
        end;
        iIndex := iIndex + 1;
    end;
    close(tBerkas);
    bacaEkspedisiPengiriman := eEP;
end;



function bacaKeranjangBelanja(sNamaFile : string) : KeranjangBelanja;
var
    i : integer;
    iPanjangS : integer;
    iAwal, iIndex, iData : integer;
    tBerkas : Text;
    sSementara : string;
    eKB : KeranjangBelanja;
begin
    Assign(tBerkas, sNamaFile);
    reset(tBerkas);
    while NOT(EOF(tBerkas)) do
    begin
        readln(tBerkas, sSementara);
        sSementara := concat(sSementara, ' |');
        iPanjangS := length(sSementara);
        iAwal := 0;
        iIndex := 1;
        iData := 1;
        for i := 1 to iPanjangS do
        begin
            if (sSementara[i] = '|') then
            begin
                sisipkanKB(copy(sSementara, iAwal + 1, i - iAwal - 2), eKB, iIndex, iData);
                iAwal := i + 1;
                iData := iData + 1;
            end;
        end;
        iIndex := iIndex + 1;
    end;
    close(tBerkas);
    bacaKeranjangBelanja := eKB;
end;



function bacaTransaksiBelanja(sNamaFile : string) : TransaksiBelanja;
var
    i : integer;
    iPanjangS : integer;
    iAwal, iIndex, iData : integer;
    tBerkas : Text;
    sSementara : string;
    eTB : TransaksiBelanja;
begin
    Assign(tBerkas, sNamaFile);
    reset(tBerkas);
    while NOT(EOF(tBerkas)) do
    begin
        readln(tBerkas, sSementara);
        sSementara := concat(sSementara, ' |');
        iPanjangS := length(sSementara);
        iAwal := 0;
        iIndex := 1;
        iData := 1;
        for i := 1 to iPanjangS do
        begin
            if (sSementara[i] = '|') then
            begin
                sisipkanTB(copy(sSementara, iAwal + 1, i - iAwal - 2), eTB, iIndex, iData);
                iAwal := i + 1;
                iData := iData + 1;
            end;
        end;
        iIndex := iIndex + 1;
    end;
    close(tBerkas);
    bacaTransaksiBelanja := eTB;
end;

procedure load(var eSB    : StokBaju;
               var eEP    : EkspedisiPengiriman;
               var eKB    : KeranjangBelanja;
               var eTB    : TransaksiBelanja;
               sNamaFile1 : string;
               sNamaFile2 : string;
               sNamaFile3 : string;
               sNamaFile4 : string);

// Algoritma
begin
    eSB := bacaStokBaju(sNamaFile1);
    eEP := bacaEkspedisiPengiriman(sNamaFile2);
    eKB := bacaKeranjangBelanja(sNamaFile3);
    eTB := bacaTransaksiBelanja(sNamaFile4);
end;
               

//----------------------------------------------
// F2
// Mengolah eSB untuk mendapatkan 3 baju paling populer berdasarkan banyaknya
// pembelian baju tersebut lalu mencetaknya ke layar
{
> showPopulars
> 1. Blouse Etnik Sasmira
  Warna: Biru
  S: 10 M: 15 L: 20 XL: 10
  Rp 30000
  Banyak dibeli: 30 kali
  
  2. Kemeja kotak-kotak
  Warna: Biru
  S: 10 M: 15 L: 20 XL: 10
  Rp 40000
  Banyak dibeli: 16 kali

  3. Kaos kaki panda
  Warna: Putih-hitam
  S: 10 M: 15 L: 20 XL: 10
  Rp 15000
  Banyak dibeli: 7 kali
}
{ 
  I.S. : 
  F.S. :
}
procedure showPopulars(eSB : StokBaju);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F3
// Menampilkan detail baju berdasarkan nama baju
{
> showDetailProduct
> Masukkan nama baju: Kemeja kotak-kotak
> Detail Kemeja kotak-kotak
  Kategori baju: Kemeja
  Gender pemakai: Laki-laki
  Warna baju: Abu-abu
  Berat per baju Kg: 0.1
  Bahan baju: katun
  Harga: Rp 500000
  Tersedia S: 10 M: 15 L: 20 XL:10
  Grosir diskon: 20
}
{ 
  I.S. : 
  F.S. :
}
procedure showDetailProduct(eSB : StokBaju);
// Algoritma
begin
{

    tulis kode disini ...

}
end;



//----------------------------------------------
// F4
// Mencari dan menampilkan daftar baju berdasarkan kata kunci dari pengguna.
// Pencarian menggunakan kata kunci nama baju, kategori baju, dan warna baju

{
  ==================
  - Search Clothes -
  ==================
  Masukkan kata kunci : putih

}

{ 
  I.S. : 
  F.S. :
}

procedure searchClothesBysKeyword(eSB : StokBaju);
//Kamus Lokal

Var
sKeyword : string; //variabel untuk menampung input user
bCek : boolean;    //validasi ketika sebuah sKeyword telah ditemukan
i : integer;
iA : integer;
// Algoritma

begin
	writeln('==================');
	writeln('- Search Clothes -');
	writeln('==================');
	writeln();
	write('Masukkan kata kunci : ');
	readln(sKeyword);

	bCek := FALSE;
	iA:= 0;
	for i:=1 to coKapasitasMaksimum do
	begin
		if sKeyword = eSB[i].sNamaBaju then
		begin
			writeln();
			iA:= iA+1;
			writeln(iA, '. ', eSB[i].sNamaBaju);
			writeln('Kategori Baju : ', eSB[i].sKategoriBaju);
			writeln('Bahan Baju : ', eSB[i].sBahanBaju);
			writeln('Warna : ', eSB[i].sWarnaBaju);
			writeln('S: ', eSB[i].iKetersediaanUkuranS, ' M: ', eSB[i].iKetersediaanUkuranM, ' L: ', eSB[i].iKetersediaanUkuranL, ' XL: ', eSB[i].iKetersediaanUkuranXL);
			writeln('Rp. ', eSB[i].iHarga);
			writeln('Banyak dibeli : ', eSB[i].iJumlahPembelian);
			bCek := true;
		end
		else if sKeyword = eSB[i].sKategoriBaju then
		begin
			writeln();
			iA:= iA+1;
			writeln(iA, '. ', eSB[i].sKategoriBaju);
			writeln('Nama Baju : ', eSB[i].sNamaBaju);
			writeln('Bahan Baju : ', eSB[i].sBahanBaju);
			writeln('Warna : ', eSB[i].sWarnaBaju);
			writeln('S: ', eSB[i].iKetersediaanUkuranS, ' M: ', eSB[i].iKetersediaanUkuranM, ' L: ', eSB[i].iKetersediaanUkuranL, ' XL: ', eSB[i].iKetersediaanUkuranXL);
			writeln('Rp. ', eSB[i].iHarga);
			writeln('Banyak dibeli : ', eSB[i].iJumlahPembelian);
			bCek := true;
		end
		else if sKeyword = eSB[i].sWarnaBaju then
		begin
			writeln();
			iA:= iA+1;
			writeln(iA, '. ', eSB[i].sWarnaBaju);
			writeln('Nama Baju : ', eSB[i].sNamaBaju);
			writeln('Kategori Baju : ', eSB[i].sKategoriBaju);
			writeln('Bahan Baju : ', eSB[i].sBahanBaju);
			writeln('S: ', eSB[i].iKetersediaanUkuranS, ' M: ', eSB[i].iKetersediaanUkuranM, ' L: ', eSB[i].iKetersediaanUkuranL, ' XL: ', eSB[i].iKetersediaanUkuranXL);
			writeln('Rp. ', eSB[i].iHarga);
			writeln('Banyak dibeli : ', eSB[i].iJumlahPembelian);
			bCek := true;
		end;
	end;

//Pemberitahuan jika barang yang dicari tidak tersedia
	if not(bCek) then
	begin
		writeln('Barang Tidak Tersedia');
	end;

end;


//----------------------------------------------
// F5
// Mengurutkan dan menampilkan baju berdasarkan harganya
{
  Contoh i/o
}
{ 
  I.S. : 
  F.S. :
}
procedure sortPrice(eSB : StokBaju);
//Kamus Lokal

type
simpan = array [1..coKapasitasMaksimum] of integer;

var
i,j	 : integer;   //indeks untuk transversal tabel
pass : integer;   //tahapan pengurutan
temp : integer;   //memorisasi harga untuk pertukaran
imax : integer;   //indeks dimana array bernilai maksimum
eSimpan : simpan; //penyimpanan dan penampungan harga yang sudah terurut maupun yang belum terurut
// Algoritma

begin

	writeln('==================');
	writeln('  - Sort Price -');
	writeln('==================');
	writeln();

	//Menyimpan semua harga dari daftar baju ke sebuah variabel penampung sementara
	for i:=1 to coKapasitasMaksimum do
	begin
		eSimpan[i] := eSB[i].iHarga;
	end;

	//Mengurutkan harga baju dan menyimpannya dalam harga
	for pass := 1 to (coKapasitasMaksimum-1) do
    begin
    	imax := pass;
    	for i:= pass +1 to coKapasitasMaksimum do
    	begin
    		if (eSimpan[imax] < eSimpan[i]) then
    		begin
    			imax := i;
    			temp := eSimpan[imax];
    			eSimpan[imax] := eSimpan[pass];
    			eSimpan[pass] := temp;
    		end;
    	end;
    end;

//Menampilkan hasil urutan berdasarkan Harga paling mahal
	for i:=1 to coKapasitasMaksimum do
	begin
		for j:=1 to coKapasitasMaksimum do
		begin
			if eSimpan[i] = eSB[j].iHarga then
			begin
				writeln();
				writeln(i, '. ','Rp. ', eSB[j].iHarga);
				writeln('Nama Baju : ', eSB[j].sNamaBaju);
				writeln('Kategori Baju : ', eSB[j].sKategoriBaju);
				writeln('Bahan Baju : ', eSB[j].sBahanBaju);
				writeln('Warna : ', eSB[j].sWarnaBaju);
				writeln('S: ', eSB[j].iKetersediaanUkuranS, ' M: ', eSB[j].iKetersediaanUkuranM, ' L: ', eSB[j].iKetersediaanUkuranL, ' XL: ', eSB[j].iKetersediaanUkuranXL);
				writeln('Banyak dibeli : ', eSB[j].iJumlahPembelian);
			end;
		end;
	end;
	
end;


//----------------------------------------------
// F6
// Menampilkan baju berdasarkan jenis baju, baju laki-laki/perempuan, ukuran,
// warna. Filter yang digunakan memungkinkan multiple filter
{
> filterClothes
> gender: perempuan
> kategori: semua
> ukuran: semua
> warna: pink
> 1. Kemeja polkadot
  Warna: Pink
  S: 10 M: 15 L: 20 XL: 10
  Rp 45000
  
  2. Kaos kaki rabbit
  Warna: pink
  S: 10 M: 15 L: 20 XL: 10
  Rp 15000
  
> filterClothes
> gender: laki-laki
> kategori: semua
> ukuran: semua
> warna: pink
> barang tidak ditemukan
}
{ 
  I.S. : 
  F.S. :
}
procedure filterClothes(eSB : StokBaju);
//Kamus Lokal

var
gender,kategori,ukuran,warna: string; //variabel untuk menampung input user
i,nomor : integer;					
bCek : boolean;

// Algoritma

begin
{
jika ada tulisan semua maka nilainya itu pasti true sisanya seacrh lagi
    tulis kode disini ...
}
	writeln('==================');
	writeln('- Filter Clothes -');
	writeln('==================');
	writeln();
	write('Gender   : ');
	readln(gender);
	write('Kategori : ');
	readln(kategori);
	write('Ukuran   : ');
	readln(ukuran);
	write('Warna    : ');
	readln(warna);
	writeln();

	bCek := FALSE;
	nomor := 1;
	for i:=1 to coKapasitasMaksimum do
	begin
		if ((gender = eSb[i].sGenderPemakai) or (gender = 'semua')) and ((kategori = eSB[i].sKategoriBaju) or (kategori = 'semua')) and ((warna = eSB[i].sWarnaBaju) or (warna = 'semua')) 
		and (((ukuran = 'S') and (eSB[i].iKetersediaanUkuranS > 0)) or ((ukuran = 'M') and (eSB[i].iKetersediaanUkuranM > 0)) or ((ukuran = 'L') and (eSB[i].iKetersediaanUkuranL > 0)) or ((ukuran = 'XL') and (eSB[i].iKetersediaanUkuranXL > 0)) or (ukuran = 'semua')) then
		begin
			writeln();
			writeln(nomor, '. ');
			writeln('Nama Baju : ', eSB[i].sNamaBaju);
			writeln('Kategori Baju : ', eSB[i].sKategoriBaju);
			writeln('Bahan Baju : ', eSB[i].sBahanBaju);
			writeln('Warna : ', eSB[i].sWarnaBaju);
			writeln('Rp. ',eSB[i].iHarga);
			writeln('S: ', eSB[i].iKetersediaanUkuranS, ' M: ', eSB[i].iKetersediaanUkuranM, ' L: ', eSB[i].iKetersediaanUkuranL, ' XL: ', eSB[i].iKetersediaanUkuranXL);
			writeln('Banyak dibeli : ', eSB[i].iJumlahPembelian);
			nomor := nomor+1;
			bCek := true;
		end;
	end;

	if not(bCek) then
	begin
		writeln('Barang tidak ditemukan');
	end;
end;



//----------------------------------------------
// F7
// Menampilkan baju berdasarkan harga yang paling murah dan/atau yang paling
// mahal, sebelum/sesudah diskon grosir
{
  Contoh i/o
}
{ 
  I.S. : 
  F.S. :
}
procedure filterByPrice(eSB : StokBaju);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F8
// Mencari dan menampilkan daftar barang yang akan dikirim ke kota tertentu.
// Pencarian tidak hanya ke kota tertentu saja tetapi bisa juga untuk
// menampilkan semuanya ke seluruh kota
{
> showExpedition
> Masukkan nama kota: Batam
> Layanan tersedia: TIKI, JNE

> showExpedition
> Masukkan nama kota: Maluku
> Layanan tersedia: tidak tersedia

> showExpedition
> Masukkan nama kota: semua
> Layanan tersedia: TIKI, JNE, Pos Indonesia
}
{ 
  I.S. : 
  F.S. :
}
procedure showExpedition(eEP : EkspedisiPengiriman);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F9
// Meminta nama baju dari pengguna, mengebCek apakah baju yang dicari pengguna
// ada pada eSB, jika ada maka masukkan ke dalam eKB lalu munculkan pesan
// berhasil, jika tidak ditemukan munculkan pesan kesalahan
{
> addToCart
> Masukkan nama baju: Kemeja kotak-kotak
> Banyak ukuran S yang dipesan: 0
> Banyak ukuran M yang dipesan: 1
> Banyak ukuran L yang dipesan: 3
> Banyak ukuran XL yang dipesan: 0
> Baju berhasil ditambahkan ke dalam keranjang belanja
}
{ 
  I.S. : 
  F.S. :
}
procedure addToCart(eSB : StokBaju; var eKB : KeranjangBelanja);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F10
// Menghapus salah satu atau semua barang belanjaan yang ada pada eKB
// dengan cara meminta nama baju yang ingin dihapus dan jika baju tersebut
// ada pada eKB maka hapus, jika tidak maka keluarkan pesan kesalahan
{
> removeFromCart
> Barang yang ada di keranjang belanja: 
  1. Kemeja polkadot
  Warna: Pink
  S: 10 M: 15 L: 20 XL: 10
  Rp 45000
  
  2. Kaos kaki rabbit
  Warna: pink
  S: 10 M: 15 L: 20 XL: 10
  Rp 15000

> Masukkan nomor barang yang akan dihapus: 2
> Barang berhasil dihapus
}
{ 
  I.S. : 
  F.S. :
}
procedure removeFromCart(var eKB : KeranjangBelanja);
var
    i : integer;
// Algoritma

begin
	
end;



//----------------------------------------------
// F11
// Menampilkan isi eKB saat ini serta menghitung dan menampilkan harga total
// dan berat total barang berdasarkan isi eKB saat ini
{
> calculatePrice
> 1. Kemeja polkadot
  Warna: Pink
  M: 1
  Berat: 0.2 kg
  Rp 45000 x 1 = Rp 45000

  2. Kaos kaki rabbit
  Warna: pink
  S: 2
  Berat: 0.1 kg
  Rp 15000 x 2 = Rp 30000

  3. Blouse Etnik Sasmira
  Warna: Biru
  L: 1
  Berat: 0.2 kg
  Rp 30000 x 1 = Rp 30000
  
  Total: Rp 105000
}
{ 
  I.S. : 
  F.S. :
}
procedure calculateEPrice(eKB : KeranjangBelanja);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F12
// Meminta masukan kota tujuan pengirim dan jenis jasa pengiriman, lalu
// menghitung dan menampilkan total biaya yang harus dibayarkan oleh
// pembeli berdasarkan ... (baca lebh lanjut spek tugas besar.pdf)
{
> checkout
> Masukkan kota tujuan: Bandung
> Nama Ekspedisi: JNE
> Jenis Layanan: YES
> Tanggal Kirim: 4/9/2015
> 1. Kemeja polkadot
  Warna: Pink
  M: 1
  Berat: 0.2 kg
  Rp 45000 x 1 = Rp 45000

  2. Kaos kaki rabbit
  Warna: pink
  S: 2
  Berat: 0.1 kg
  Rp 15000 x 2 = Rp 30000

  3. Blouse Etnik Sasmira
  Warna: Biru
  L: 1
  Berat: 0.2 kg
  Rp 30000 x 1 = Rp 30000
  
  Harga Baju = Rp 105000
  Ongkos Kirim = 0.5 x Rp 18000 = 9000
  Total = Rp 114000
  Tanggal Sampai : 5/9/2015
}
{ 
  I.S. : 
  F.S. :
}
procedure checkout(eKB : KeranjangBelanja; var eTB : TransaksiBelanja);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F13
// Setelah dilakukan checkout maka jumlah baju yang ada pada eSB berkurang
// lakukan update jumlah stok baju yang bekurang
{
  Contoh i/o
}
{ 
  I.S. : 
  F.S. :
}
procedure updateClothes(eKB : KeranjangBelanja; var eSB : StokBaju);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F14
// Deskripsi ...
{
  Contoh i/o
}
{ 
  I.S. : 
  F.S. :
}
procedure discountGrosir(var eKB : KeranjangBelanja);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F15
// cukup jelas ... (baca lebh lanjut spek tugas besar.pdf)
{
> showTransaction
> Riwayat Pembelian 
  4/9/2015
    1. Blouse Etnik Sasmira
    Warna: Pink
    Ukuran S: 1, M: 1

    2. Kaos kaki rabbit
    Warna: Pink
    Ukuran S: 2

    3. Kemeja polkadot
    Warna: Biru
    Ukuran M: 1, L: 2

    Total harga : Rp 235000

  29/8/2015
    1. Kemeja kotak-kotak
    Warna: Biru
    Ukuran M: 1, L: 2

    Total harga : Rp 175000

  15/8/2015
    1. Jaket Cordova
    Warna: Putih
    Ukuran L: 2, XL: 1

    2. Kaos Oblong
    Warna: Hitam
    Ukuran L: 5

    Total harga: Rp 204500
}
{ 
  I.S. : 
  F.S. :
}
procedure showTransaction(eTB : TransaksiBelanja);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F16
// Mengembalikan uang konsumen dari barang yang cacat atau rusak
// bCek jumlah uang yang harus dikembalikan pada eSB
{
  Contoh i/o
}
{ 
  I.S. : 
  F.S. :
}
procedure retur(eSB : StokBaju);
// Algoritma
begin
{

    tulis kode disini ...

}
end;


//----------------------------------------------
// F17
// cukup jelas ... (baca lebh lanjut spek tugas besar.pdf)
{
> exit
> Terima Kasih :) Berkunjung lagi ya !
}
{ 
  I.S. : 
  F.S. :
}
procedure exit(    eSB : StokBaju;
                   eEP : EkspedisiPengiriman;
                   eKB : KeranjangBelanja;
                   eTB : TransaksiBelanja;
                   sNamaFile1   : string;
                   sNamaFile2   : string;
                   sNamaFile3   : string;
                   sNamaFile4   : string;
               var bS  : boolean);
// Algoritma
begin
    writeln('> Terima Kasih :) Berkunjung lagi ya !');
    bS := true;
end;


//----------------------------------------------
// bacaPerintah
// Deskripsi ...
{
  Contoh i/o
}
{ 
  I.S. : 
  F.S. :
}
procedure bacaPerintah(var eSB      : StokBaju;
                       var eEP      : EkspedisiPengiriman;
                       var eKB      : KeranjangBelanja;
                       var eTB      : TransaksiBelanja;
                       sNamaFile1   : string;
                       sNamaFile2   : string;
                       sNamaFile3   : string;
                       sNamaFile4   : string;
                       var bS       : boolean);
// Deklarasi variabel lokal
var
    sPerintah   : string;
// Algoritma
begin
    write('> ');
    readln(sPerintah);
    case sPerintah of
        'load'                      : load(eSB, eEP, eKB, eTB, sNamaFile1, sNamaFile2, sNamaFile3, sNamaFile4);
        'showPopulars'              : showPopulars(eSB);
        'showDetailProduct'         : showDetailProduct(eSB);
        'searchClotheeSBysKeyword'   : searchClothesBysKeyword(eSB);
        'sortPrice'                 : sortPrice(eSB);
        'filterClothes'             : filterClothes(eSB);
        'filterByPrice'             : filterByPrice(eSB);
        'showExpedition'            : showExpedition(eEP);
        'addToCart'                 : addToCart(eSB, eKB);
        'removeFromCart'            : removeFromCart(eKB);
        'calculateEPrice'           : calculateEPrice(eKB);
        'checkout'                  : checkout(eKB, eTB);
        'updateClothes'             : updateClothes(eKB, eSB);
        'discountGrosir'            : discountGrosir(eKB);
        'showTransaction'           : showTransaction(eTB);
        'retur'                     : retur(eSB);
        'exit'                      : exit(eSB, eEP, eKB, eTB, sNamaFile1, sNamaFile2, sNamaFile3, sNamaFile4, bS);
        else                          writeln('> Perintah salah');
    end;
end;


//----------------------------------------------
// Toko Online
// Deskripsi ...
{
  Contoh i/o
}
{ 
  I.S. : 
  F.S. :
}
procedure tokoOnline(var eSB : StokBaju;
                     var eEP : EkspedisiPengiriman;
                     var eKB : KeranjangBelanja;
                     var eTB : TransaksiBelanja);
// Deklarasi variabel lokal
var
    bSelesai    : boolean;
// Algoritma
begin
    bSelesai := FALSE;
    while not(bSelesai) do
        bacaPerintah(eSB, eEP, eKB, eTB, 'fStokBaju.txt', 'fEkspedisiPengiriman.txt', 'fKeranjangBelanja.txt', 'fTransaksiBelanja.txt', bSelesai);
end;


//----------------------------------------------
// jika dibutuhkan anda dapat menggunakan prosedur ini, prosedur ini bisa di edit sesuka anda.
procedure contoh;
begin

end;


//----------------------------------------------
// Algoritma program utama
begin
    tokoOnline(eStokBaju, eEkspedisiPengiriman, eKeranjangBelanja, eTransaksiBelanja);
end.
