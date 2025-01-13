import 'package:flutter_mockito/models/product/product.dart';
import 'package:flutter_mockito/models/response/response.dart';
import 'package:flutter_mockito/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../read_json.dart';
import 'product_mockito_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
  });

  group('Product Test', () {
    test('products status 200', () async {
      final responseJson = await readJson('json/product/product_200_response.json');
      final response = Response<List<Product>>(
        message: responseJson['message'],
        data: List<Product>.from(responseJson['data'].map((item) => Product.fromJson(item))),
      );

      when(mockApiService.getProducts()).thenAnswer((_) async => Future.value(response));

      final result = await mockApiService.getProducts();

      expect(result, response);

      verify(mockApiService.getProducts()).called(1);
    });

    test('products status 400', () async {
      final responseJson = await readJson('json/product/product_400_response.json');
      final response = Response<List<Product>>(
        message: responseJson['message'],
      );

      when(mockApiService.getProducts()).thenAnswer((_) async => Future.value(response));

      final result = await mockApiService.getProducts();

      expect(result, response);

      verify(mockApiService.getProducts()).called(1);
    });

    test('products status 404', () async {
      final responseJson = await readJson('json/product/product_404_response.json');
      final response = Response<List<Product>>(
        message: responseJson['message'],
      );

      when(mockApiService.getProducts()).thenAnswer((_) async => Future.value(response));

      final result = await mockApiService.getProducts();

      expect(result, response);

      verify(mockApiService.getProducts()).called(1);
    });

    test('products status 500', () async {
      final responseJson = await readJson('json/product/product_500_response.json');
      final response = Response<List<Product>>(
        message: responseJson['message'],
      );

      when(mockApiService.getProducts()).thenAnswer((_) async => Future.value(response));

      final result = await mockApiService.getProducts();

      expect(result, response);

      verify(mockApiService.getProducts()).called(1);
    });
  });
}
