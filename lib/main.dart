import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final tabs = [
    Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Search',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Camera',
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 50),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Saved!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.save_alt_outlined),
            ),
          ],
          title: const Text(
            'AppBar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedFontSize: 15,
          unselectedFontSize: 20,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.teal,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.teal,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
              backgroundColor: Colors.teal,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
