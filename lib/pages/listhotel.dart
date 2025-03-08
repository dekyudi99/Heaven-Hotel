import 'package:flutter/material.dart';
import 'package:heaven_hotel/pages/detailHotel.dart';

List<Map<String, dynamic>> hotel = [
  {
    "name": "Heaven Hotel Bedugul",
    "deskripsi": "Hotel dengan view yang indah dan hawa sejuk",
    "picture": "assets/bedugul.jpeg",
    "price": 500000,
    "star": 5,
  },
  {
    "name": "Heaven Hotel Candidasa",
    "deskripsi": "Hotel dengan view pantai yang indah",
    "picture": "assets/candidasa.jpeg",
    "price": 550000,
    "star": 5,
  },
  {
    "name": "Heaven Hotel Nusa Penida",
    "deskripsi": "Hotel dengan view pantai yang indah",
    "picture": "assets/nusa_penida.jpeg",
    "price": 500000,
    "star": 5,
  },
  {
    "name": "Heaven Hotel Semarapura",
    "deskripsi": "Hotel dengan arsitektur yang indah",
    "picture": "assets/semarapura.jpeg",
    "price": 450000,
    "star": 5,
  },
  {
    "name": "Heaven Hotel Singaraja",
    "deskripsi": "Hotel terbaik di Buleleng",
    "picture": "assets/bedugul.jpeg",
    "price": 450000,
    "star": 5,
  },
];

class ListHotel extends StatelessWidget {
  const ListHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Menampilkan 2 kolom dalam grid
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75, // Mengatur aspek rasio kartu
          ),
          itemCount: hotel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text("Clicked on ${hotel[index]["name"]}")),
                // );
                Navigator.push(context, MaterialPageRoute(builder: (context) => Detailhotel(
                  name: hotel[index]["name"],
                  deskripsi: hotel[index]["deskripsi"],
                  picture: hotel[index]["picture"],
                  price: hotel[index]["price"],
                  star: hotel[index]["star"],
                )));
              },
              child: HotelCard(hotel: hotel[index]),
            );
          },
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4, // Menambahkan bayangan untuk efek depth
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8), // Membuat gambar sedikit melengkung
              child: Image.asset(
                hotel["picture"],
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8), // Jarak antar elemen
            Text(
              hotel["name"],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "Rp ${hotel["price"].toString()}",
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < hotel["star"] ? Colors.orange : Colors.grey,
                  size: 16,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}