import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
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
          ),
        ],
      ),
    );
  }
}
