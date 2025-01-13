import 'package:flutter_mockito/models/auth/auth.dart';
import 'package:flutter_mockito/models/product/product.dart';
import 'package:flutter_mockito/models/response/response.dart';

abstract class ApiService {
  Future<Response<Auth>> login(String email, String password);
  Future<Response<List<Product>>> getProducts();
}
