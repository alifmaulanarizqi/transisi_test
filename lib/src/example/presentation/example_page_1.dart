import 'package:flutter/material.dart';

import 'example_page_2.dart';

class ExamplePage1 extends StatefulWidget {
  static const route = '/example1';

  const ExamplePage1({Key? key}) : super(key: key);

  @override
  State<ExamplePage1> createState() => _ExamplePage1State();
}

class _ExamplePage1State extends State<ExamplePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExamplePage2()),
            );
          },
          child: Text('next page'),
        ),
      ),
    );
  }
}