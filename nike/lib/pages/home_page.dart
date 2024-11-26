import 'package:flutter/material.dart';
import 'package:nike/components/drawer.dart';
import 'package:nike/components/mainbody.dart';
import 'package:nike/components/nike_max.dart';
import 'package:nike/components/nike_sport.dart';
import 'package:nike/components/toggle_widget.dart';
import 'package:nike/components/mainimages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ToggleWidget(),
              ),
            ),
            const SizedBox(height: 10.0),
            const NikeShoesWidget(),
            NikeBody(),
            NikeMax(),
            const NikeSport(),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
