import 'package:flutter/material.dart';
import 'package:heaven_hotel/pages/listhotel.dart';
import 'package:heaven_hotel/pages/pesanan.dart';
import 'package:heaven_hotel/pages/profil.dart';
import 'pages/formInput.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = index;
    });
  }

  final List<Widget> _pages = [
    ListHotel(),
    Pesanan(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset("assets/Logo_HeavenHotel.png"),
        // ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart, color: Colors.white),),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman Edit Profile
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forminput()),
                );
              },
              child: UserAccountsDrawerHeader(
                accountName: Text("I Kadek Yudi Artana"),
                accountEmail: Text("ikadekyudiartana602@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/Ayano.jpeg"),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/backProfil.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Notifikasi"),
              trailing: Icon(Icons.notifications),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Hotel Favorit"),
              trailing: Icon(Icons.favorite),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Pengaturan"),
              trailing: Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Latihan-Tabel Penjualan"),
              trailing: Icon(Icons.wifi),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Pesanan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Anda"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}