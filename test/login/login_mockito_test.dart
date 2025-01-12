import 'package:flutter_mockito/services/api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../read_json.dart';
import 'login_mockito_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
  });

  group('Login Test', () {
    test('login status 200', () async {
      final request = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/login/login_200_request.json');
      final response = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/login/login_200_response.json');

      when(mockApiService.login(request['email']!, request['password']!)).thenAnswer((_) async => response);

      final result = await mockApiService.login(request['email']!, request['password']!);

      expect(result, response);

      verify(mockApiService.login(request['email']!, request['password']!)).called(1);
    });

    test('login status 400', () async {
      final request = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/login/login_400_request.json');
      final response = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/login/login_400_response.json');

      when(mockApiService.login(request['email']!, request['password']!)).thenThrow(Exception(response['message']));

      expect(() => mockApiService.login(request['email']!, request['password']!),
          throwsA(predicate((e) => e is Exception && e.toString().contains(response['message'] as String))));

      verify(mockApiService.login(request['email']!, request['password']!)).called(1);
    });

    test('login status 404', () async {
      final request = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/login/login_400_request.json');
      final response = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/login/login_400_response.json');

      when(mockApiService.login(request['email']!, request['password']!)).thenThrow(Exception(response['message']));

      expect(() => mockApiService.login(request['email']!, request['password']!),
          throwsA(predicate((e) => e is Exception && e.toString().contains(response['message'] as String))));

      verify(mockApiService.login(request['email']!, request['password']!)).called(1);
    });

    test('login status 500', () async {
      final request = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/login/login_500_request.json');
      final response = await readJson('C:/Users/muham/Documents/Repository/flutter_mockito/json/login/login_500_response.json');

      when(mockApiService.login(request['email']!, request['password']!)).thenThrow(Exception(response['message']));

      expect(() => mockApiService.login(request['email']!, request['password']!),
          throwsA(predicate((e) => e is Exception && e.toString().contains(response['message'] as String))));

      verify(mockApiService.login(request['email']!, request['password']!)).called(1);
    });
  });
}
