import 'package:uuid/uuid.dart';

const uuid = Uuid();
class Passengers {
   Passengers({
    required this.name,
    required this.age,
    required this.gender,
    String? id
  });
  final String id =uuid.v4();
  final String name;
  final int age;
  final String gender;
}
