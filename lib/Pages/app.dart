import 'package:flutter/material.dart';
import 'package:tesk_quest/Pages/HomePage/home.dart';
import 'package:tesk_quest/Pages/SecundPage/secund_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff272b60),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          color: Color(0xff272b60),
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        // Outras personalizações de estilo aqui
      ),
      title: "teste de rotas",
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const SecundPage(),
      },
    );
  }
}
