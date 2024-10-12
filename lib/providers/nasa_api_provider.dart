import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/nasa_api_model.dart';

final nasaAPIProvider = FutureProvider.family<List<NasaAPI>, String>((ref, dateRange) async {
  final response = await http.get(Uri.parse('https://api.nasa.gov/planetary/apod?start_date=${dateRange.split(",")[0]}&end_date=${dateRange.split(",")[1]}&api_key=DEMO_KEY'));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => NasaAPI.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
});
