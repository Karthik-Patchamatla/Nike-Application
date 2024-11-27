import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike/components/shoe_template.dart';

class NikeShoesWidget extends StatelessWidget {
  const NikeShoesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "This Week's Highlights",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10.0),
          FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('nike').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              final documents = snapshot.data?.docs;

              if (documents == null || documents.isEmpty) {
                return const Center(child: Text('No shoes available.'));
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: documents.map((doc) {
                    var name = doc['name'];
                    var imageUrl = doc['image'];
                    var route =
                        doc['route']; // Fetch route field from Firestore

                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to specific pages based on the route
                          switch (route) {
                            case 'main':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemGrid(
                                    collectionName:
                                        'justdropped',
                                    appBarTitle:
                                        name,
                                  ),
                                ),
                              );

                              break;
                            case 'main1':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                              break;
                            case 'main2':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OffersPage(),
                                ),
                              );
                              break;
                            case 'main3':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                              break;
                            case 'main4':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OffersPage(),
                                ),
                              );
                              break;
                            case 'main5':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                              break;
                            case 'main6':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OffersPage(),
                                ),
                              );
                              break;
                            case 'main7':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                              break;
                            case 'main8':
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OffersPage(),
                                ),
                              );
                              break;
                            default:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Invalid route')),
                              );
                          }
                        },
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

class ShoeDetailsPage extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ShoeDetailsPage({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 300.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Page')),
      body: const Center(child: Text('Cart Page Content')),
    );
  }
}

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offers Page')),
      body: const Center(child: Text('Offers Page Content')),
    );
  }
}
