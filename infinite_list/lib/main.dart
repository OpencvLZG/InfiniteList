import 'package:flutter/material.dart';
import 'package:infinite_list/components/infiniteList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white24,
      theme: ThemeData.light(),
      home: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Center(
                child: Text("InfiniteList"),
              ),
              InfiniteList()
            ],
          ),
        ),
      ),
    );
  }
}
