import 'dart:convert';
import 'package:flutter_mockito/models/auth/auth.dart';
import 'package:flutter_mockito/models/product/product.dart';
import 'package:flutter_mockito/models/response/response.dart';
import 'package:flutter_mockito/services/api_service.dart';
import 'package:http/http.dart' as http;

class ApiServiceImpl implements ApiService {
  final String baseUrl;

  ApiServiceImpl({required this.baseUrl});

  @override
  Future<Response<Auth>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({"email": email, "password": password}),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      return Response<Auth>(
        message: responseData['message'],
        data: Auth.fromJson(responseData['data']),
        error: responseData['error'],
      );
    } else {
      throw Exception('Login failed: ${response.statusCode}');
    }
  }

  @override
  Future<Response<List<Product>>> getProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      return Response<List<Product>>(
        message: responseData['message'],
        data: List<Product>.from(responseData['data'].map((item) => Product.fromJson(item))),
        error: responseData['error'],
      );
    } else {
      throw Exception('Failed to fetch products: ${response.statusCode}');
    }
  }
}
