import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeBasketball extends StatefulWidget {
  const NikeBasketball({super.key});

  @override
  State<NikeBasketball> createState() => _NikeBasketballState();
}

class _NikeBasketballState extends State<NikeBasketball> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(
      collectionName: 'basketball',
      appBarTitle: 'Basketball',
    );
  }
}