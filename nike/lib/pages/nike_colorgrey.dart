import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeColorgrey extends StatefulWidget {
  const NikeColorgrey({super.key});

  @override
  State<NikeColorgrey> createState() => _NikeColorgreyState();
}

class _NikeColorgreyState extends State<NikeColorgrey> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'colorgrey', appBarTitle: 'Light Slate Grey');
  }
}