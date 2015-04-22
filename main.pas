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
			if eSimpan[i] = eSB[a].iHarga then
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
