import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:heaven_hotel/helpers/dbhelper.dart';
import 'package:heaven_hotel/models/penjualan.dart';
import 'package:heaven_hotel/pages/home.dart';

class InputPenjualan extends StatefulWidget {
  final Penjualan penjualan;
  InputPenjualan(this.penjualan);

  @override
  State<InputPenjualan> createState() => _InputPenjualanState(penjualan);
}

class _InputPenjualanState extends State<InputPenjualan> {
  //deklarasi variabel penjualan mewakili class Penjualan
  Penjualan penjualan; 
  DbHelper dbHelper = DbHelper();
  //menerima data penjualan
  _InputPenjualanState(this.penjualan);
  //deklarasi variabel untuk menampung inputan textfield
  TextEditingController nameController=TextEditingController();
  TextEditingController keteranganController =TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  final format=DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    //inisialisasi data untuk form edit
    if(penjualan != null){
      nameController.text=penjualan.name!;
      keteranganController.text=penjualan.keterangan!;
      jumlahController.text=penjualan.jumlah!;
      tanggalController.text=penjualan.tanggal!;
    }
    return Scaffold(
      appBar: AppBar(
        //menampilkan pesan berbeda untuk add dan update
        title: penjualan==null?Text("Transaksi Baru"):Text("Update Transaksi"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Home())),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15.0,left: 10.0, right: 10.0
        ),
        child: ListView(
          children: <Widget>[
            //menggunakan widget padding, atau yang lain
            Padding(
              padding: EdgeInsets.all(10.0),
              //menggunakan inputan textfield
              child: TextField(
                //variabel nameController
                controller: nameController,
                keyboardType: TextInputType.text,
                //memberikan desain termasuk label
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
              onChanged: (value){

              },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: jumlahController,
                //textfield type number
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Jumlah",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
              onChanged: (value){

              },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: keteranganController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Keterangan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
              onChanged: (value){

              },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: tanggalController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Tanggal",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
              onChanged: (value){

              },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Column(
            //     children: <Widget>[
            //       //widget DateTimeField terdapat pada package datetime_picker_formfield
            //         DateTimeField(                      
            //           controller: tanggalController,
            //           format: format,
            //           onShowPicker: (context, currentValue){
            //             return showDatePicker(
            //               //setting datepicker
            //               context: context,
            //               firstDate: DateTime(2020),
            //               initialDate: currentValue??DateTime.now(),
            //               lastDate: DateTime(2045)
            //             );
            //           },
            //           decoration: InputDecoration(
            //             labelText: "Tanggal",
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(3.0)
            //             ),
            //           )
            //         )
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    //tombol penyimpanan
                    child: ElevatedButton(
                      child: Text("Simpan"),
                      onPressed: (){
                        if(penjualan == null){
                          //jika data penjualan null maka dianggap data baru
                          penjualan=Penjualan(null,nameController.text, keteranganController.text,  jumlahController.text, tanggalController.text);
                          }else{
                          //jika ditemukan data penjualan maka dianggap update
                          //menggunakan data sebelumnya atau sesuai variabel controller
                          penjualan.name=nameController.text;
                          penjualan.keterangan=keteranganController.text;
                          penjualan.jumlah=jumlahController.text;
                          penjualan.tanggal=tanggalController.text;
                          print("ini Update ya");
                        }
                        
                        Navigator.pop(context, penjualan);
                      },
                    ),
                  ),
                  Container(width: 5.0,),
                  Expanded(
                    //untuk batal
                    child: ElevatedButton(
                     child: Text("Batal", textScaleFactor: 1.5,),
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}