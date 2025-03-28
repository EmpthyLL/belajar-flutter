import 'package:flutter/material.dart';
import 'package:test_p2/gallery.dart';
import 'package:test_p2/imgDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final Uri uri = Uri.parse(settings.name!); // Parse route name

        if (uri.path == '/') {
          return MaterialPageRoute(
            builder:
                (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        } else if (uri.path == '/gallery') {
          return MaterialPageRoute(builder: (context) => Gallery());
        } else if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'gallery') {
          final String id = uri.pathSegments[1]; // Extract ID
          return MaterialPageRoute(builder: (context) => ImageDetail(id: id));
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.yellow,
              child: Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: Container(height: 40.0, width: 40.0, color: Colors.red),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            // Wrap this Column inside an Expanded widget
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Spacer(flex: 1), // Small space before first image
                Expanded(child: Image.asset('assets/img_1.jpg')),
                Spacer(flex: 1), // Equal spacing
                Expanded(child: Image.asset('assets/img_2.jpg')),
                Spacer(flex: 1), // Equal spacing
                Expanded(child: Image.asset('assets/img_3.jpg')),
                // Spacer(flex: 1), // Small space after last image
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset('assets/img_1.jpg'),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset('assets/img_2.jpg'),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset('assets/img_3.jpg'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 10), // Small space before first image
              Flexible(child: Image.asset('assets/img_1.jpg')),
              SizedBox(width: 20), // Adjust spacing here
              Flexible(child: Image.asset('assets/img_2.jpg')),
              SizedBox(width: 20), // Adjust spacing here
              Flexible(child: Image.asset('assets/img_3.jpg')),
              SizedBox(width: 10), // Small space after last image
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/gallery')},
        tooltip: 'Increment',
        child: const Icon(Icons.image),
      ),
    );
  }
}
