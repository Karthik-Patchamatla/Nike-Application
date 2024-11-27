import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  // Create a map to track the like status of each item
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
              crossAxisCount: 2, // Two columns per row
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.75, // Aspect ratio for better image and text alignment
            ),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var doc = documents[index];
              var itemName = doc['name'];
              var itemDescription = doc['Description'];
              var itemPrice = doc['MRP'];
              var imageUrl = doc['image'];

              // Initialize isLiked for the current item if it's not already set
              bool isLiked = likedItems[index] ?? false;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image container
                  SizedBox(
                    width: double.infinity,
                    height: 200.0,
                    child: Stack(
                      children: [
                        // Image
                        ClipRRect(
                          child: Image.network(
                            imageUrl,
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Like button (toggle like/unlike)
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
                                color: isLiked ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Item Name
                        Text(
                          itemName,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1, // Truncate overflow
                        ),
                        const SizedBox(height: 2.5),
                        // Item Description
                        Text(
                          itemDescription,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Truncate overflow for description
                        ),
                        const SizedBox(height: 6.0),
                        // MRP Price
                        Text(
                          'MRP: ₹ $itemPrice',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
