import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api/";

  // LOGIN
  static Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl + "login/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      return jsonDecode(res.body);
    } catch (e) {
      return {"error": "Login failed"};
    }
  }

  // REGISTER
  static Future<Map<String, dynamic>> register(Map data) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl + "register/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      return jsonDecode(res.body);
    } catch (e) {
      return {"error": "Register failed"};
    }
  }

  //  ITEMS
  static Future<List> getItems() async {
    try {
      var res = await http.get(Uri.parse(baseUrl + "items/"));
      return jsonDecode(res.body);
    } catch (e) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> addItem(Map data) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl + "add-item/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      return jsonDecode(res.body);
    } catch (e) {
      return {"error": "Add item failed"};
    }
  }

  static Future deleteItem(int id) async {
    try {
      var res = await http.delete(
        Uri.parse(baseUrl + "delete-item/$id/"),
      );

      return jsonDecode(res.body);
    } catch (e) {
      return {"error": "Delete failed"};
    }
  }

  //  INVOICE

  static Future<Map<String, dynamic>> createInvoice(Map data) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl + "create-invoice/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      return jsonDecode(res.body);
    } catch (e) {
      return {"error": "Create invoice failed"};
    }
  }

  static Future<List> getInvoices() async {
    try {
      var res = await http.get(Uri.parse(baseUrl + "invoices/"));
      return jsonDecode(res.body);
    } catch (e) {
      return [];
    }
  }

  // static Future deleteInvoice(int id, int userId) async {
  //   var res = await http.delete(
  //     Uri.parse(baseUrl + "delete-invoice/$id/"),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({
  //       "user_id": userId
  //     }),
  //   );
  //
  //   return jsonDecode(res.body);
  // }

  static Future deleteInvoice(int id) async {
    try {
      var res = await http.delete(
        Uri.parse(baseUrl + "delete-invoice/$id/"),
      );

      return jsonDecode(res.body);
    } catch (e) {
      return {"error": "Delete invoice failed"};
    }
  }


}