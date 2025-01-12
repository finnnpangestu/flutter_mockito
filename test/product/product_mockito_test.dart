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
      final response = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/product/product_200_response.json');

      when(mockApiService.getProducts()).thenAnswer((_) async => response);

      final result = await mockApiService.getProducts();

      expect(result, response);

      verify(mockApiService.getProducts()).called(1);
    });

    test('products status 400', () async {
      final response = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/product/product_400_response.json');

      when(mockApiService.getProducts()).thenThrow(Exception(response['message']));

      expect(() => mockApiService.getProducts(), throwsA(predicate((e) => e is Exception && e.toString().contains(response['message'] as String))));

      verify(mockApiService.getProducts()).called(1);
    });

    test('products status 404', () async {
      final response = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/product/product_404_response.json');

      when(mockApiService.getProducts()).thenThrow(Exception(response['message']));

      expect(() => mockApiService.getProducts(), throwsA(predicate((e) => e is Exception && e.toString().contains(response['message'] as String))));

      verify(mockApiService.getProducts()).called(1);
    });

    test('products status 500', () async {
      final response = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/product/product_500_response.json');

      when(mockApiService.getProducts()).thenThrow(Exception(response['message']));

      expect(() => mockApiService.getProducts(), throwsA(predicate((e) => e is Exception && e.toString().contains(response['message'] as String))));

      verify(mockApiService.getProducts()).called(1);
    });
  });
}
