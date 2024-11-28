import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeFootball extends StatefulWidget {
  const NikeFootball({super.key});

  @override
  State<NikeFootball> createState() => _NikeFootballState();
}

class _NikeFootballState extends State<NikeFootball> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'football', appBarTitle: 'Football');
  }
}