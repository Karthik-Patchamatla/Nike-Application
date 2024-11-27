import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeRunning extends StatefulWidget {
  const NikeRunning({super.key});

  @override
  State<NikeRunning> createState() => _NikeRunningState();
}

class _NikeRunningState extends State<NikeRunning> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(
      collectionName: 'running',
      appBarTitle: 'Running', 
    );
  }
}