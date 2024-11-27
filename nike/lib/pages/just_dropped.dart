import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class JustDropped extends StatelessWidget {
  const JustDropped({super.key});

  @override
  Widget build(BuildContext context) {
    return const ItemGrid(
      collectionName: 'justdropped',
      appBarTitle: 'Just Dropped', 
    );
  }
}
