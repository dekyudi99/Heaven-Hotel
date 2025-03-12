//import semua class yang diperlukan termasuk package
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:heaven_hotel/helpers/dbhelper.dart';
import 'package:heaven_hotel/models/penjualan.dart';
import 'package:heaven_hotel/pages/inputPenjualan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  //menampung list penjualan
  List<Penjualan> penjualanList=[]; 
  @override
  void initState() {
    // TODO: implement initState
    updateListView();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Penjualan Voucher'),
          leading: Icon(Icons.wifi),
        ),      
        //memanggil widget createListView() untuk menampilkan list penjualan
        body: createListView(),
        //menampilkan tombol plus
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'Input Penjualan',
          onPressed: () async {
             var penjualan=Penjualan(null,'','','','');
                penjualan = await navigateToEntryForm(context,penjualan);
                //jika ditemukan data penjualan
                //maka dikirim data penjualan dalam fungsi addPenjualan 
                if(penjualan != null) addPenjualan(penjualan);
            
          },
        ),
    );
  }

  //fungsi menampilkan data terbaru
  void updateListView(){
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((datatabase){
      Future<List<Penjualan>> penjualanListFuture=dbHelper.getPenjualanList();
      penjualanListFuture.then((penjualanList){
        setState(() {
        this.penjualanList=penjualanList;
        this.count=penjualanList.length; 
        });
      });
    });
  }

  //widget createListView
ListView createListView() {
    //updateListView();
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          //anggota list
          child: ListTile(
            title: Text(this.penjualanList[index].name ?? ''),
            subtitle: Row(
              children: <Widget>[
                Text(this.penjualanList[index].tanggal ?? ''),
                Text(this.penjualanList[index].jumlah ?? '0', style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            //icon delete
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deletePenjualan(penjualanList[index]);
              },   
            ),
            //klik list untuk tampilkan form update
            onTap: () async {
             var penjualan = await navigateToEntryForm(context, this.penjualanList[index]);
              if (penjualan != null) editPenjualan(penjualan);
            },
          ),
        );
      },
    );
  }
  //input data penjualan
  Future<Penjualan> navigateToEntryForm(BuildContext context, Penjualan penjualan) async{
    var result = await Navigator.push(
      context, 
        MaterialPageRoute(
          builder: (BuildContext context){
          return InputPenjualan(penjualan);
        }
      )
    );     
    return result;
  }
  //fungsi add tambah penjualan
  void addPenjualan(Penjualan object) async {
    int result = await dbHelper.insert(object);
      if(result > 0){
        updateListView();
      }  
  }
  
  //fungsi update penjualan
  void editPenjualan(Penjualan object) async{
    int result = await dbHelper.update(object);
      if(result>0){
        updateListView();
        print("ini editPenjualan RESULT $result");
      }
  }
  void deletePenjualan(Penjualan object) async{
    int result = await dbHelper.delete(object.id!);
      if(result>0){
        updateListView();
      }
  }

}