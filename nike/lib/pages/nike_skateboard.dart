import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeSkateboard extends StatefulWidget {
  const NikeSkateboard({super.key});

  @override
  State<NikeSkateboard> createState() => _NikeSkateboardState();
}

class _NikeSkateboardState extends State<NikeSkateboard> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'skateboard', appBarTitle: 'Skateboarding');
  }
}