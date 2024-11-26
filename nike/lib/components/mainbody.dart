import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NikeBody extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  NikeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _firestore.collection('nikemain').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final documents = snapshot.data?.docs;

        if (documents == null || documents.isEmpty) {
          return const Center(child: Text('No items available.'));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Prevents scroll conflict
          padding: const EdgeInsets.symmetric(vertical: 7.0),
          itemCount: documents.length,
          itemBuilder: (context, index) {
            var item = documents[index];
            var imageUrl = item['image']; // 'image' field contains the image URL

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
