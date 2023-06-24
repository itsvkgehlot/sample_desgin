import 'package:flutter/material.dart';
import 'package:sample_desgin/home.dart';

class BranchPage extends StatelessWidget {
  final List<String> companies = [
    'ADIYOGI TECHNOSOFT PVT. LTD.',
    'ADIYOGI ONLINE TRADE PVT. LTD.',
    'IFRESH - ONLINE FRUIT AND VEGETABLE'
  ];
  final List<Color> itemColors = [
    Colors.black38,
    Colors.orangeAccent,
    Colors.green,
  ];

  final List<Widget> images = [
    Image.asset('assets/images/appicon.png'),
    Image.asset('assets/images/appicon.png'),
    Image.asset('assets/images/appicon.png')
  ];

  BranchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Background2.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35.0),
                Text(
                  'SELECT COMPANY',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: companies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            // Handle box tap event
                            if (index == 0) {
                              // Navigate to HomePage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            } else if (index == 1) {
                              // Navigate to LoginPage
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Coming Soon..'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            } else if (index == 2) {
                              // Navigate to RegistrationPage
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Coming Soon..'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 85.0,
                                    width: 85.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: images[index % images.length],
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  width: 1.0,
                                  thickness: 3.0,
                                  color: itemColors[
                                  index % itemColors.length], // Use index to select color
                                  indent: 15.0,
                                  endIndent: 15.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Text(
                                      companies[index],
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
