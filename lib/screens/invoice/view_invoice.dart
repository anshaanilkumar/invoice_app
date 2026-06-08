import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class ViewInvoiceScreen extends StatefulWidget {
  @override
  _ViewInvoiceScreenState createState() => _ViewInvoiceScreenState();
}

class _ViewInvoiceScreenState extends State<ViewInvoiceScreen> {
  List invoices = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadInvoices();
  }

  loadInvoices() async {
    var data = await ApiService.getInvoices();

    setState(() {
      invoices = data;
      loading = false;
    });
  }

  deleteInvoice(int id) async {
    await ApiService.deleteInvoice(id);
    loadInvoices();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invoice deleted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Invoices",style: TextStyle(
        color: Colors.blue,fontWeight: FontWeight.bold
      ),),
      centerTitle: true,),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : invoices.isEmpty
          ? Center(child: Text("No invoices found"))
          : ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          var inv = invoices[index];

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              tileColor: Colors.blue,
              textColor: Colors.white,

              title: Text(inv['customer_name'] ?? "No Name"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: ${inv['email']}"),
                  Text("Phone: ${inv['phone']}"),
                  Text("Address: ${inv['address']}"),
                  Text("Date: ${inv['date']}"),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteInvoice(inv['id']),
              ),
            ),
          );
        },

      ),
    );
  }
}