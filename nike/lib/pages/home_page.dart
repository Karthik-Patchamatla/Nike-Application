import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text(
          'Shop',
          style: TextStyle(
            fontSize: 19.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isOn = !_isOn;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: const Color.fromARGB(255, 255, 255, 255), // Background color for the toggle
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Nike image on the left side of the toggle
                    _isOn
                        ? Image.asset(
                              'lib/assets/nikeblack.png',
                              width: 30.0,
                              height: 30.0,
                            )
                        : ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                                Color.fromARGB(255, 205, 207, 207), BlendMode.srcIn),
                            child: Image.asset(
                              'lib/assets/nikeblack.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                    const SizedBox(width: 10.0),
                    // Jordan image on the right side of the toggle
                    !_isOn
                        ? Image.asset(
                              'lib/assets/jordan.png',
                              width: 30.0,
                              height: 30.0,
                            )
                        : ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                                Color.fromARGB(255, 205, 207, 207), BlendMode.srcIn),
                            child: Image.asset(
                              'lib/assets/jordan.png',
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          // Your other widgets here
        ],
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("W E L C O M E")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),

            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Shop'),
            ),

            ListTile(
              leading: Icon(Icons.event),
              title: Text('Events'),
            ),

            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Orders'),
            ),

            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
            ),

            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('Inbox'),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            )
          ],
        ),
      ),
    );
  }
}
