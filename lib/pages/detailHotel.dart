import 'package:flutter/material.dart';

class Detailhotel extends StatelessWidget{
  const Detailhotel({super.key, required this.name, required this.deskripsi, required this.picture, required this.price, required this.star});

  final String name;
  final String deskripsi;
  final String picture;
  final int price;
  final int star;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(picture, width: double.infinity, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16.0),
            Text(name, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(deskripsi, style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4.0),
                Text('$star', style: const TextStyle(fontSize: 16.0)),
                const SizedBox(width: 16.0),
                Text('Rp $price', style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}