import 'package:newboat/models/passengers.dart';
import 'package:newboat/screens/add_ons.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class PassengerDetail extends StatefulWidget {
  const PassengerDetail(
      {super.key, required this.price, required this.boatname});
  final String price;
  final String boatname;

  @override
  State<PassengerDetail> createState() => _PassengerDetailState();
}

class _PassengerDetailState extends State<PassengerDetail> {
  final _formkey = GlobalKey<FormState>();
  var _savedname1 = "";
  late int _savedage1;
  var _savedgender1 = "";
  var _savedname2 = "";
  late int _savedage2;
  var _savedgender2 = "";
  bool _edit = false;
  var phone="98000000000";
  void onsubmit() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      Passengers passenger1 =
          Passengers(age: _savedage1, gender: _savedgender1, name: _savedname1);
      Passengers passenger2 =
          Passengers(age: _savedage2, gender: _savedgender2, name: _savedname2);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddOns(
                    phone:phone,
                    boatname: widget.boatname,
                    boatprice: widget.price,
                    passenger1: passenger1,
                    passenger2: passenger2,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    //const keyboardspace = 0;
    //final keyboardspace = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assam Travel Service",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
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
                    SizedBox(height: 16),
                    DottedLine(
                      dashLength: 10.0,
                      dashColor: Color.fromARGB(255, 216, 215, 215),
                      dashGapLength: 10.0,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          "2 Seats",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffFF6666),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your ticket information will be sent on this number",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    if(!_edit)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        
                        const Text("91911234589",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        
                        const SizedBox(width: 8),
                        
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _edit = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text("Edit"),
                        ),
                      ],
                    ),
                    if(_edit)
                    TextField(
                          
                          onChanged: (value) => phone = value,
                          decoration: const InputDecoration(

                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                        )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formkey,
                child: Container(
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
                        'Passenger Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Passenger 1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            maxLength: 50,
                            decoration: InputDecoration(
                              labelText: "Enter Full Name",
                              hintText: "Enter name as per Aadhar",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().length <= 1 ||
                                  value.trim().length > 50) {
                                return 'Name must be between 1 and 50 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _savedname1 = value!;
                            },
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Enter your age",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        int.tryParse(value) == null ||
                                        int.tryParse(value)! <= 0) {
                                      return 'Must be a valid positive integer';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _savedage1 = int.parse(value!);
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  //value: _savedgender,
                                  decoration: InputDecoration(
                                    labelText: "Gender",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      value: "Male",
                                      child: Text("Male"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Female",
                                      child: Text("Female"),
                                    ),
                                  ],

                                  onChanged: (value) {
                                    _savedgender1 = value!;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const DottedLine(
                        dashLength: 10.0,
                        dashColor: Color.fromARGB(255, 216, 215, 215),
                        dashGapLength: 10.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Passenger 2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            maxLength: 50,
                            decoration: InputDecoration(
                              labelText: "Enter Full Name",
                              hintText: "Enter name as per Aadhar",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().length <= 1 ||
                                  value.trim().length > 50) {
                                return 'Name must be between 1 and 50 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _savedname2 = value!;
                            },
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Enter your age",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        int.tryParse(value) == null ||
                                        int.tryParse(value)! <= 0) {
                                      return 'Must be a valid positive integer';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _savedage2 = int.parse(value!);
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  //value: _savedgender,
                                  decoration: InputDecoration(
                                    labelText: "Gender",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      value: "Male",
                                      child: Text("Male"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Female",
                                      child: Text("Female"),
                                    ),
                                  ],

                                  onChanged: (value) {
                                    _savedgender2 = value!;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: onsubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
