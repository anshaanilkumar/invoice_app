import 'package:flutter/material.dart';
import 'package:invoice_app/screens/invoice/add_invoice.dart';
import '../invoice/view_invoice.dart';
import '../item/add_item.dart';
import '../item/view_item.dart';


class HomeScreen extends StatelessWidget {
  final int userId;

  HomeScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Dashboard",
        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
      centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(350, 150), // Defines large box dimensions
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Adds a slight curve to the big box
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddItemScreen(userId: userId),
                    ),
                  );
                },
                child: Text("Add Item",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 5,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(350, 150), // Defines large box dimensions
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Adds a slight curve to the big box
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ViewItemsScreen(),
                    ),
                  );
                },
                child: Text("View Items",
                    style: TextStyle(color: Colors.blue),),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(350, 150), // Defines large box dimensions
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Adds a slight curve to the big box
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddInvoiceScreen(userId: userId),
                    ),
                  );
                },
                child: Text("Add Invoice",
                  style: TextStyle(color: Colors.blue),),
              ),
              SizedBox(height: 5,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(350, 150), // Defines large box dimensions
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Adds a slight curve to the big box
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ViewInvoiceScreen(),
                    ),
                  );
                },
                child: Text("View Invoice",
                  style: TextStyle(color: Colors.blue),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}