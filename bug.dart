```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the response is a JSON string
      final jsonData = jsonDecode(response.body);
      // Accessing the data - potential error here if the JSON structure is unexpected
      final String someData = jsonData['someKey'];
      print('Data: $someData');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Here the error type is dynamic, not specific
    print('Error: $e'); // Missing proper error handling and logging
  }
}
```