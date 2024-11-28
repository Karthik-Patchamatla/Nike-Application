import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeDance extends StatefulWidget {
  const NikeDance({super.key});

  @override
  State<NikeDance> createState() => _NikeDanceState();
}

class _NikeDanceState extends State<NikeDance> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'dance', appBarTitle: 'Dance');
  }
}