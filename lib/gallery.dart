import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Add a button or icon to the AppBar actions
          IconButton(
            icon: const Icon(Icons.arrow_back), // Icon of the button
            onPressed: () => {Navigator.pop(context)},
            tooltip: 'Back',
          ),
        ],
        title: const Text('My Gallery'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns in the grid
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 10, // Number of items in the grid
        itemBuilder: (context, index) {
          return ImageCard(
            id: (index + 1).toString(),
            imageUrl:
                'assets/img_${index + 1}.jpg', // Replace with your image URL
            title: 'Image $index', // Title for the image
          );
        },
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String id;

  const ImageCard({
    required this.imageUrl,
    required this.id,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "gallery/$id"),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Image
                Image.asset(imageUrl, width: double.infinity),
                // Text floating over the image
                Positioned(
                  bottom: 8.0,
                  left: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.lightBlue.withValues(alpha: 0.5),
                    // Optional background for text readability
                    child: Text(
                      "Your Text",
                      style: TextStyle(
                        color: Colors.white, // Text color for visibility
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
// GridView.builder(
//   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//     maxCrossAxisExtent: 400, // 25rem = 400px
//     mainAxisSpacing: 8.0,
//     crossAxisSpacing: 8.0,
//     childAspectRatio: 1, // Adjust as needed
//   ),
//   itemCount: 10, // Number of items
//   itemBuilder: (context, index) {
//     return ImageCard(imageUrl: 'assets/img_${index + 1}.jpg');
//   },
// ),
