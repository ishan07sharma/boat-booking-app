import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:newboat/models/details.dart';
import 'package:newboat/providers.dart/boatdetails.dart';
import 'package:newboat/screens/boatinfo.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class List extends ConsumerWidget {
  const List({super.key, required this.place});
  final String place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(listProvider.notifier).fetchname();
    final details = ref.watch(listProvider);
    //print(details[0].price);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          title: const Text('Boarding Point'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.circular(10),
                boxShadow: kElevationToShadow[2],
              ),
              child: Text(
                'Showing available boats in $place',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 2,
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          //onselectMeal(meal);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Boatinfo(details:details[index],)));
                        },
                        child: Column(
                          children: [
                            Stack(children: [
                              Hero(
                                tag: {details[index].id},
                                child: FadeInImage(
                                  placeholder: MemoryImage(kTransparentImage),
                                  image: NetworkImage(details[index].image),
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: double.infinity,
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  right: 15,
                                  child: Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(Icons.person),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${details[index].boatCapacity.toString()} seats",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ))
                            ]),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topLeft,
                              child: Text(
                                details[index].boatName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const Text(
                                'Trip start by 7:10 AM from Hills & journey ends by around 1:00 AM.'),
                             Row(
                              children: [
                                const Icon(Icons.currency_rupee_sharp),
                                Text(
                                  '${details[index].price} / Adult',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )
                              ],
                            )
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }
}
