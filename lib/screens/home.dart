import 'package:newboat/screens/list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).primaryColorLight ,
        title:const Text('Boat'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Choose your location'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the about page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const List(place: 'assam')));
                },
                child: const Text('Assam'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
