import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeYoga extends StatefulWidget {
  const NikeYoga({super.key});

  @override
  State<NikeYoga> createState() => _NikeYogaState();
}

class _NikeYogaState extends State<NikeYoga> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'yoga', appBarTitle: 'Yoga');
  }
}