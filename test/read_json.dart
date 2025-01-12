import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

Future<Map<String, dynamic>> readJson(String relativePath) async {
  final currentDirectory = Directory.current.path;
  final fullPath = path.join(currentDirectory, relativePath);
  final file = File(fullPath);
  final content = await file.readAsString();
  return jsonDecode(content) as Map<String, dynamic>;
}
