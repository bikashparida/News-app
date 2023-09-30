import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/search_bar.dart';
import '../utils/key.dart';

Future<List> fetchNews(String categoryName) async {
  final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=$categoryName&pageSize=100&apiKey=${Key.apiKey}&q=${SearchBarWidget.searchController.text}');
  final response = await http.get(url);

  Map result = jsonDecode(response.body);
  return result['articles'];
}
