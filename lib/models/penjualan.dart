class Penjualan{
  //deklarasi variabel untuk menerima inputan
  //tidak sama dg field pada tabel
  int? id;
  String? name;
  String? keterangan;
  String? jumlah;
  String? tanggal;
  //deklarasi parameter untuk menerima inputan pada class
  Penjualan( this.id,  this.name, this.keterangan,  this.jumlah,  this.tanggal);
  //memasukkan atribut pada map yang nantinya akan ditampilkan
  //memasukkan atribut pada map yang nantinya akan ditampilkan
  Penjualan.fromMap(Map<String, dynamic> map){
    this.id=map['id'];
    //terdapat toString(), jika terdapat nilai angka tetap ditampilkan sebagai string
    this.name=map['name'].toString();
    this.keterangan=map['keterangan'].toString();
    this.jumlah=map['jumlah'].toString();
    this.tanggal=map['tanggal'].toString();
  }
  // int? get id =>_id;
  //return map digunakan pada database, nama variabel disamakan dg field
 Map<String, dynamic> toMap() {
    return {
      'id': this.id, //  Ensure 'id' exists
      'name': this.name,
      'keterangan': this.keterangan,
      'jumlah': this.jumlah,
      'tanggal': this.tanggal,
    };
  }
}