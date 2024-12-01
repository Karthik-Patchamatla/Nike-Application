import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeTraining extends StatefulWidget {
  const NikeTraining({super.key});

  @override
  State<NikeTraining> createState() => _NikeTrainingState();
}

class _NikeTrainingState extends State<NikeTraining> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'training', appBarTitle: 'Training');
  }
}