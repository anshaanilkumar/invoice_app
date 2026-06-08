import 'package:flutter/material.dart';
import 'package:invoice_app/widgets/custom_textfield.dart';
import '../../services/api_service.dart';

class AddInvoiceScreen extends StatefulWidget {
  final int userId;

  AddInvoiceScreen({required this.userId});

  @override
  _AddInvoiceScreenState createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  TextEditingController customerName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  DateTime? selectedDate;

  List items = [];
  int? selectedItemId;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  loadItems() async {
    var data = await ApiService.getItems();
    setState(() {
      items = data;
    });
  }

  pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  createInvoice() async {
    if (selectedItemId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Select an item")),
      );
      return;
    }

    var data = await ApiService.createInvoice({
      "user_id": widget.userId,
      "customer_name": customerName.text,
      "email": email.text,
      "phone": phone.text,
      "address": address.text,
      "date": selectedDate.toString(),
      "items": [
        {
          "item_id": selectedItemId,
          "quantity": 1
        }
      ]
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(data['message'] ?? "Invoice created")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Add Invoice"),
      backgroundColor: Colors.blue,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            CustomTextField(
              controller: customerName,
              label: 'Customer Name',
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: email, label: 'Email',

            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: phone, label: 'Phone',
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: address, label: 'Address',
            ),

            SizedBox(height: 20),

            DropdownButtonFormField(
              hint: Text("Select Item"),
              value: selectedItemId,
              items: items.map<DropdownMenuItem>((item) {
                return DropdownMenuItem(
                  value: item['id'],
                  child: Text(item['name']),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedItemId = val;
                });
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickDate,
              child: Text(selectedDate == null
                  ? "Pick Date"
                  : selectedDate.toString().split(" ")[0]),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: createInvoice,
              child: Text("Create Invoice"),
            ),
          ],
        ),
      ),
    );
  }
}