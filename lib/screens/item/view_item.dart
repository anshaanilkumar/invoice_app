import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class ViewItemsScreen extends StatefulWidget {
  @override
  _ViewItemsScreenState createState() => _ViewItemsScreenState();
}

class _ViewItemsScreenState extends State<ViewItemsScreen> {
  List items = [];

  getItems() async {
    var data = await ApiService.getItems();
    setState(() {
      items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Items",style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    bottom: const PreferredSize(
    preferredSize: Size.fromHeight(1.0), // Set the height of the divider area
    child: Divider(
    height: 1.0,
    thickness: 2.0,
    color: Colors.white, // Define your separator color
    ),),),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(items[i]['name']),
            subtitle: Text("₹${items[i]['price']}"),
          );
        },
      ),
    );
  }
}