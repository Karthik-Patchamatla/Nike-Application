import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike/components/detail_page.dart';

class ItemGrid extends StatefulWidget {
  final String collectionName;
  final String appBarTitle;

  const ItemGrid({
    super.key,
    required this.collectionName,
    required this.appBarTitle,
  });

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  // Map to track the like status of each item
  Map<int, bool> likedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection(widget.collectionName).get(),
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

          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.65,
            ),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var doc = documents[index];
              var itemName = doc['name'];
              var itemDescription = doc['Description'];
              var itemPrice = doc['MRP'];
              var imageUrl = doc['image'];
              var imageUrl1 = doc['image1'];
              var imageUrl2 = doc['image2'];
              var imageUrl3 = doc['image3'];
              var imageUrl4 = doc['image4'];
              var desc1 = doc['d1'];
              var desc2 = doc['d2'];
              var desc3 = doc['d3'];

              // Initialize isLiked for the current item if it's not already set
              bool isLiked = likedItems[index] ?? false;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        name: itemName,
                        description: itemDescription,
                        price: itemPrice,
                        imageUrl: imageUrl,
                        imageUrl1: imageUrl1,
                        imageUrl2: imageUrl2,
                        imageUrl3: imageUrl3,
                        imageUrl4: imageUrl4,
                        desc1: desc1,
                        desc2: desc2,
                        desc3: desc3,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: Image.network(
                                imageUrl,
                                width: double.infinity,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10.0,
                              right: 10.0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    likedItems[index] = !isLiked;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.white.withOpacity(0.7),
                                  child: Icon(
                                    isLiked ? Icons.favorite : Icons.favorite_border,
                                    color: isLiked ? Colors.black : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemName,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              itemDescription,
                              style: const TextStyle(
                                fontSize: 13.0,
                                color: Colors.black54,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'MRP: ₹ $itemPrice',
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
