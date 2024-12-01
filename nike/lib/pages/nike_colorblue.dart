import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeColorblue extends StatefulWidget {
  const NikeColorblue({super.key});

  @override
  State<NikeColorblue> createState() => _NikeColorblueState();
}

class _NikeColorblueState extends State<NikeColorblue> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'color', appBarTitle: 'Ocean Blue',);
  }
}