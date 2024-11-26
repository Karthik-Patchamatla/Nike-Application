import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NikeShoesWidget extends StatelessWidget {
  const NikeShoesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align the heading to the left
        children: [
          const Text(
            "This Week's Highlights",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10.0), // Add some spacing between the heading and the content
          
          // FutureBuilder to fetch data from Firestore
          FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('nike').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show loading indicator without hiding heading
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              // Get the documents from Firestore
              final documents = snapshot.data?.docs;

              if (documents == null || documents.isEmpty) {
                return const Center(child: Text('No shoes available.'));
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align all items at the top
                  children: documents.map((doc) {
                    var name = doc['name']; // Fetch name
                    var imageUrl = doc['image']; // Fetch image URL

                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imageUrl,
                            width: 190.0,
                            height: 190.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 2.0),
                          SizedBox(
                            width: 190.0,
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 13.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
