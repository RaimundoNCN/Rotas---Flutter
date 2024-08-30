import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Home Page'),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/second');
            }, child: Text('Second Screen'))
          ],
        ),
      ),
    );
  }
}
