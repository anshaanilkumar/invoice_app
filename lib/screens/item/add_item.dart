import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../widgets/custom_textfield.dart';

class AddItemScreen extends StatefulWidget {
  final int userId;

  AddItemScreen({required this.userId});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController hsn = TextEditingController();
  TextEditingController price = TextEditingController();

  String type = "GOODS";
  String tax = "TAXABLE";

  addItem() async {
    var data = await ApiService.addItem({
      "name": name.text,
      "type": type,
      "hsn_sac": hsn.text,
      "tax_type": tax,
      "price": double.tryParse(price.text) ?? 0,
      "user_id": widget.userId,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(data.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Item"),
      centerTitle: true,
      backgroundColor: Colors.blue,),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            CustomTextField(
              controller: name,
              label:"Item Name" ,
              // decoration: InputDecoration(labelText: "Item Name"),
            ),
            DropdownButton(
              value: type,
              items: [
                DropdownMenuItem(value: "GOODS", child: Text("Goods")),
                DropdownMenuItem(value: "SERVICE", child: Text("Service")),
              ],
              onChanged: (val) => setState(() => type = val.toString()),
            ),
            SizedBox(height: 5,),
            CustomTextField(
              controller: hsn,
              label: "HSN/SAC",
            ),
            SizedBox(height: 5,),
            CustomTextField(
              controller: price,
              // keyboardType: TextInputType.number,
              label: 'Price',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addItem,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
              child: Text("Add Item",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}