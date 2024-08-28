import 'package:newboat/models/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListProviderNotifier extends StateNotifier<List<Details>> {
  ListProviderNotifier() : super(const []);
  final db = FirebaseFirestore.instance;

  Future<void> fetchname() async {
    final snapshot = await db.collection('boats').get();


    final detailsList = snapshot.docs.map((doc) {
      final data = doc.data();
      List<String> amenities = List<String>.from(data['amenities']);
      List<String> safety = List<String>.from(data['safety']);
      return Details(
        id:doc.id,
        amenities: amenities,
        boatCapacity: data['boat_capacity'] as int,
        boatDetails: data['boat_details'] as String,
        boatName: data['boat_name'] as String,
        image: data['image'] as String,
        meal: data['meal'] as String,
        price: data['price'] as String,
        safety: safety,
      );
    }).toList();

    state = detailsList;


  }
}

final listProvider = StateNotifierProvider<ListProviderNotifier, List<Details>>(
    (ref) => ListProviderNotifier());
