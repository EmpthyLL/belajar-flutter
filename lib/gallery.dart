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
            icon: const Icon(Icons.add), // Icon of the button
            onPressed: () => {Navigator.pushNamed(context, '/')},
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

  const ImageCard({required this.imageUrl, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Image.asset(imageUrl),
          ), // )You can replace this with Image.asset() for local assets
        ],
      ),
    );
  }
}
