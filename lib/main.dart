import 'package:flutter/material.dart';
import 'package:travelUi/data/data.dart';
import 'screens/home-screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Data()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.lightBlueAccent,
        primaryColor: Colors.blueAccent,
      ),
      home: HomeScreen(),
    );
  }
}
