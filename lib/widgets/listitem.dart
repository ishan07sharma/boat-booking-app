import 'package:flutter/material.dart';
import 'package:newboat/models/addonoption.dart';

class Listitem extends StatelessWidget {
  const Listitem(
      {super.key,
      required this.title,
      this.info,
      required this.selectedoptions,
      required this.options,
      required this.handleclick});
  final String title;
  final String? info;
  final List<String> selectedoptions;
  final List<Addonoption> options;
  final void Function(String,String) handleclick;

  @override
  Widget build(BuildContext context) {


    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if(info!=null) Text(info!),
            const SizedBox(height: 8),

                ...options.map((item){
                  bool isSelected = selectedoptions.contains(item.name);
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                  icon: Icon(
                    isSelected ? Icons.check_rounded : Icons.add_circle,
                    color: Colors.blue
                  ),
                  onPressed: () {
                    handleclick(item.name,item.price);
                  },
                ),
                subtitle: Text('₹ ${item.price}'),
                  );
                })
              ],
     

    );
  }
}
