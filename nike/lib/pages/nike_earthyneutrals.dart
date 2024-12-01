import 'package:flutter/material.dart';
import 'package:nike/components/shoe_template.dart';

class NikeEarthyneutrals extends StatefulWidget {
  const NikeEarthyneutrals({super.key});

  @override
  State<NikeEarthyneutrals> createState() => _NikeEarthyneutralsState();
}

class _NikeEarthyneutralsState extends State<NikeEarthyneutrals> {
  @override
  Widget build(BuildContext context) {
    return const ItemGrid(collectionName: 'colorearthyneutrals', appBarTitle: 'Earthy Neutrals');
  }
}