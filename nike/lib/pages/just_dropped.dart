import 'package:flutter/material.dart';

class JustDropped extends StatefulWidget {
  final String name; // Declare `name` as a final field

  const JustDropped(
      {super.key, required this.name}); // Use initializer for required fields

  @override
  State<JustDropped> createState() => _JustDroppedState();
}

class _JustDroppedState extends State<JustDropped> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(
          widget.name,
          style: const TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: Text('This is the Just Dropped page'),
      ),
    );
  }
}
