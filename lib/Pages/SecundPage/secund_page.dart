import 'package:flutter/material.dart';

class SecundPage extends StatelessWidget {
  const SecundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page 2'),
        centerTitle: true,
      ),
      body: const Center(
          child: Column(
        children: [
          Text("😉"),
          
        ],
      )),
    );
  }
}
