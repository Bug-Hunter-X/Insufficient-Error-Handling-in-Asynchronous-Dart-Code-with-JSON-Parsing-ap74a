```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      // Type checking and null safety
      if (jsonResponse is Map && jsonResponse.containsKey('someKey') && jsonResponse['someKey'] is String) {
        return jsonResponse['someKey'];
      } else {
        print('Invalid JSON structure or missing key');
        return null; // Return null or a default value
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    print('Error parsing JSON: $e');
    return null;
  } on http.ClientException catch (e) {
    print('Network error: $e');
    return null;
  } catch (e) {
    print('An unexpected error occurred: $e');
    return null;
  }
}
```