import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF021942),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            label: ('Overview'),
            icon: Icon(Icons.article),
          ),
          BottomNavigationBarItem(
            label: ('Music'),
            icon: Icon(Icons.assessment_outlined),
          ),
          BottomNavigationBarItem(
            label: ('Places'),
            icon: Icon(Icons.assignment_outlined),
          ),
          BottomNavigationBarItem(
            label: ('News'),
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
