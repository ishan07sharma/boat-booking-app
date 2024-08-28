import 'package:newboat/models/details.dart';
import 'package:newboat/screens/passenger_detail.dart';
import 'package:flutter/material.dart';

import 'package:dotted_line/dotted_line.dart';

import 'package:bulleted_list/bulleted_list.dart';

class Boatinfo extends StatelessWidget {
  const Boatinfo({super.key, required this.details});
  final Details details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: AppBar(
            //iconTheme: const IconThemeData(color: Colors.white,),

            actions: [
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
            ],

            flexibleSpace: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      details.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //alignment: Alignment.topLeft,
                 Text( details.boatName
                  ,
                  style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                 Text( details.boatDetails
                    ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Wed, Jun20 - 2 Passengers',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const DottedLine(
                  dashLength: 10.0,
                  dashColor: Colors.grey,
                  dashGapLength: 10.0,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Amenities',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                 BulletedList(
                  bulletColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  listItems: details.amenities,
                ),
                const DottedLine(
                  dashLength: 10.0,
                  dashColor: Colors.grey,
                  dashGapLength: 10.0,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Safety features',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                 BulletedList(
                  bulletColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  listItems: details.safety,
                ),
                
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow.shade500),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  PassengerDetail(price: details.price,boatname: details.boatName,)));
                      },
                      child: const Text('Go to passenger details')),
                )
              ],
            ),
          ),
        ));
  }
}
