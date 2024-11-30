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
              crossAxisCount: 2, // Two columns per row
              crossAxisSpacing: 15.0, // Increase spacing between columns
              mainAxisSpacing: 20.0, // Increase spacing between rows
              childAspectRatio: 0.65, // Adjust for better layout
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

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Card background color
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image container with uniform background
                    Container(
                      width: double.infinity,
                      height: 180.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Uniform background color
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10.0),
                            ),
                            child: Image.network(
                              imageUrl,
                              width: double.infinity,
                              height: 180.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Like button
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
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Item Name
                          Text(
                            itemName,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2, // Allow up to 2 lines for name
                          ),
                          const SizedBox(height: 4.0),
                          // Item Description
                          Text(
                            itemDescription,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3, // Allow up to 3 lines for description
                          ),
                          const SizedBox(height: 6.0),
                          // MRP Price
                          Text(
                            'MRP: ₹ $itemPrice',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
