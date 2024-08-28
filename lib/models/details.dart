class Details {
  const Details({
    required this.id,
    required this.amenities,
    required this.boatCapacity,
    required this.boatDetails,
    required this.boatName,
    required this.image,
    required this.meal,
    required this.price,
    required this.safety,
  });
  final String id;
  final List<String> amenities;
  final int boatCapacity;
  final String boatDetails;
  final String boatName;
  final String image;
  final String meal;
  final String price;
  final List<String> safety;
}
