import 'package:flutter/material.dart';

class Photoview extends StatelessWidget {
  const Photoview({super.key, this.imageUrl});
  final imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 640,
        width: 400,
        child: Image.network(imageUrl),
      ),
    );
  }
}
