import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike/components/shoe_template.dart';

class NikeSport extends StatelessWidget {
  const NikeSport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Shop by Sport", // Heading
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('nikesport').get(),
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

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: documents.map((doc) {
                    final name = doc['name']; // Field: name
                    final imageUrl = doc['image']; // Field: image
                    final route = doc['route']; // Field: route for navigation

                    return GestureDetector(
                      onTap: () {
                        // Handle navigation based on route
                        switch (route) {
                          case 'Running':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemGrid(
                                  collectionName:
                                        'running',
                                    appBarTitle:
                                        name,
                                ),
                              ),
                            );
                            break;
                          case 'Basketball':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemGrid(
                                  collectionName: 'basketball',
                                  appBarTitle: name,
                                ),
                              ),
                            );
                            break;
                          case 'Dance':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemGrid(
                                  collectionName: 'dance',
                                  appBarTitle: name,
                                ),
                              ),
                            );
                            break;
                          case 'Football':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemGrid(
                                  collectionName: 'football',
                                  appBarTitle: name,
                                ),
                              ),
                            );
                            break;
                          default:
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid route')),
                            );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                imageUrl,
                                width: 240.0,
                                height: 160.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
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
