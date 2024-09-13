import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Column(
            children: [
              Card(
                elevation: 4,
                color: Color(0xFFe9ddff),
                child: Column(
                  children: [
                    Text(
                      'Tempo',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: 300,
                      height: 300,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Second Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
