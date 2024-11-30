import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeTennis extends StatefulWidget {
  const NikeTennis({super.key});

  @override
  State<NikeTennis> createState() => _NikeTennisState();
}

class _NikeTennisState extends State<NikeTennis> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'tennis', appBarTitle: 'Tennis');
  }
}