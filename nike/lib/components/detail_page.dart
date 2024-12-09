import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final String desc1;
  final String desc2;
  final String desc3;

  const DetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.desc1,
    required this.desc2,
    required this.desc3,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _currentPage = 0;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> images = [];

  @override
  void initState() {
    super.initState();
    images = [
      widget.imageUrl,
      widget.imageUrl1,
      widget.imageUrl2,
      widget.imageUrl3,
      widget.imageUrl4,
    ];
  }

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
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // PageView for image slider
              SizedBox(
                width: double.infinity,
                height: 600.0,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      child: Image.network(
                        images[index],
                        width: double.infinity,
                        height: 600.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              // Dot indicators at the bottom center of the image
              Positioned(
                bottom: 16.0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? Colors.black : Colors.grey,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),

          // Item details
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.name,
              style: const TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'MRP:  ₹ ${widget.price}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text('Add to Cart'),
              ),
            ),
          ),

          const SizedBox(height: 15.0),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: const Text('Favorite'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
