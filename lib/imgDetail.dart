import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String id;
  const ImageDetail({super.key, required this.id});

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
      body: Image.asset("assets/img_$id.jpg"),
    );
  }
}
