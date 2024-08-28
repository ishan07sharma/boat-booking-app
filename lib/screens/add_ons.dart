// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:newboat/models/addonoption.dart';
import 'package:newboat/models/passengers.dart';
import 'package:newboat/widgets/listitem.dart';
import 'package:lottie/lottie.dart';

class AddOns extends StatefulWidget {
  const AddOns(
      {super.key,
      required this.phone,
      required this.boatname,
      required this.boatprice,
      required this.passenger1,
      required this.passenger2});
  final String phone;
  final Passengers passenger1;
  final Passengers passenger2;
  final String boatprice;
  final String boatname;
  @override
  State<AddOns> createState() => _AddOnsState();
}

class _AddOnsState extends State<AddOns> {
  bool isconfirm = false;
  Future<void> _showBookingConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              //Lottie.asset('assets/animations/booking_success.json', // Your Lottie animation file
               //   width: 150, height: 150, repeat: false),
              const SizedBox(height: 16),
              const Text(
                'Booking Confirmed!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst); // Navigate to home
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Go to Home",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  void uploaddata() async {
    setState(() {
      isconfirm = true;
    });
    bool guiderequired = false;
    if (guide.isNotEmpty) guiderequired = true;
    bool insurancerequired = false;
    if (insurance.isNotEmpty) insurancerequired = true;
    int passprice = int.parse(widget.boatprice) * 2;
    final db = FirebaseFirestore.instance;

    await db.collection("bookings").add({
      'boatName': widget.boatname,
      'passenger1': widget.passenger1.name,
      'passenger2': widget.passenger2.name,
      'boatprice': passprice,
      'extraprice': total,
      'transportation': transportation,
      'meals': meals,
      'guide': guiderequired,
      'insurance': insurancerequired,
      'phone': widget.phone,
    });
    setState(() {
                    ispressed = false;
                  });

    await _showBookingConfirmationDialog();
  }

  List<String> transportation = [];
  List<String> meals = [];
  List<String> guide = [];
  List<String> insurance = [];

  int total = 0;
  bool ispressed = false;
  void _addSelection(String option, List<String> selectedList, String price) {
    int amount = int.parse(price);
    if (selectedList.contains(option)) {
      selectedList.remove(option);
      total -= amount;
    } else {
      selectedList.add(option);
      total += amount;
    }
  }

  @override
  Widget build(BuildContext context) {
    int passprice = int.parse(widget.boatprice) * 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add-Ons"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Assam Travel Service",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("7:00 AM", style: TextStyle(fontSize: 16)),
                          Text("From", style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 4),
                        ],
                      ),
                      Icon(Icons.directions_boat, color: Color(0xff1E79E1)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3:00 PM", style: TextStyle(fontSize: 16)),
                          Text("To", style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 4),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const DottedLine(
                    dashLength: 10.0,
                    dashColor: Color.fromARGB(255, 216, 215, 215),
                    dashGapLength: 10.0,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Colors.black),
                            SizedBox(width: 8),
                            Text(
                              "2 Seats",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Icon(Icons.currency_rupee_sharp,
                                color: Colors.black),
                            const SizedBox(width: 8),
                            Text(
                              "$passprice",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Listitem(
                title: "Additional services",
                info:
                    "Cab service pickUp and dropOff at Station; driver details will be shared via WhatsApp.",
                selectedoptions: transportation,
                options: [
                  Addonoption("Private Car (4 Seater)", "500"),
                  Addonoption("Private Car (7 Seater)", "700"),
                  Addonoption("Shared rides", "200")
                ],
                handleclick: (String opt, String price) {
                  setState(() {
                    _addSelection(opt, transportation, price);
                  });
                }),

            const DottedLine(
              dashLength: 10.0,
              dashColor: Color.fromARGB(255, 216, 215, 215),
              dashGapLength: 10.0,
            ),
            const SizedBox(height: 16),
            Listitem(
                title: "Meal Selection",
                selectedoptions: meals,
                options: [
                  Addonoption("Breakfast & Snacks", "500"),
                  Addonoption("Pure Veg Lunch", "500"),
                  Addonoption("Non Veg Lunch", "500")
                ],
                handleclick: (String opt, String price) {
                  setState(() {
                    _addSelection(opt, meals, price);
                  });
                }),
            // Meal Selection

            const DottedLine(
              dashLength: 10.0,
              dashColor: Color.fromARGB(255, 216, 215, 215),
              dashGapLength: 10.0,
            ),
            const SizedBox(height: 16),
            // Other Recommendations
            Listitem(
                title: "Other Recommendations",
                selectedoptions: guide,
                options: [Addonoption("Tour Guide", "1500")],
                handleclick: (String opt, String price) {
                  setState(() {
                    _addSelection(opt, guide, price);
                  });
                }),
            const DottedLine(
              dashLength: 10.0,
              dashColor: Color.fromARGB(255, 216, 215, 215),
              dashGapLength: 10.0,
            ),
            const SizedBox(height: 16),

            Listitem(
                title: "Insurance",
                selectedoptions: insurance,
                info: "At just ₹ 50 per passenger get:",
                options: [Addonoption("insurance", "50")],
                handleclick: (String opt, String price) {
                  setState(() {
                    _addSelection(opt, insurance, price);
                  });
                }),

            const Text(
              "Insurance Coverage",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
                "Upto ₹ 70,000 on hospitalization &\nUpto ₹ 5,00,000 in case of Death/PTD"),
            const SizedBox(height: 8),
            const DottedLine(
              dashLength: 10.0,
              dashColor: Color.fromARGB(255, 216, 215, 215),
              dashGapLength: 10.0,
            ),
            const SizedBox(height: 16),
            // Bill Breakdown
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Bill Breakdown",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("2 Passenger"),
                      Text("₹ $passprice"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Additional Services"),
                      Text("$total"),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total (taxes included)",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("₹ ${total + passprice}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: uploaddata,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:
                ispressed
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    :
                 const Text(
                  "Continue",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
