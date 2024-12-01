import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeSeaform extends StatefulWidget {
  const NikeSeaform({super.key});

  @override
  State<NikeSeaform> createState() => _NikeSeaformState();
}

class _NikeSeaformState extends State<NikeSeaform> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'colorseaform', appBarTitle: 'Tropical Seaform');
  }
}