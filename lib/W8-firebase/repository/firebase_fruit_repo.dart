import 'dart:convert';
import 'dart:io';

import 'package:flutter2/W8-firebase/model/Fruit.dart';
import 'package:flutter2/W8-firebase/model/fruit_dto.dart';
import 'package:flutter2/W8-firebase/repository/Fruit_repo.dart';
import 'package:http/http.dart' as http;

class FirebaseFruitsRepository extends FruitRepository {
  static const String baseUrl =
      'https://fir-practice-c5cad-default-rtdb.asia-southeast1.firebasedatabase.app/';
  static const String fruitsCollection = "Fruits";
  static const String allFruitsUrl = '$baseUrl/$fruitsCollection.json';

  @override
  Future<Fruit> addFruit({required String name, required double price}) async {
    Uri uri = Uri.parse(allFruitsUrl);

    // Create a new data
    final newFruitData = {'name': name, 'price': price};
    final http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newFruitData),
    );

    // Handle errors
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to add user');
    }

    // Firebase returns the new ID in 'name'
    final newId = json.decode(response.body)['name'];

    // Return created user
    return Fruit(id: newId, name: name, price: price);
  }

  @override
  Future<List<Fruit>> getFruits() async {
    Uri uri = Uri.parse(allFruitsUrl);
    final http.Response response = await http.get(uri);

    // Handle errors
    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      throw Exception('Failed to load');
    }

    // Return all users
    final data = json.decode(response.body) as Map<String, dynamic>?;

    if (data == null) return [];
    return data.entries
        .map((entry) => FruitDto.fromJson(entry.key, entry.value))
        .toList();
  }

@override
  Future<void> deleteFruit(String id) async {
    Uri uri = Uri.parse("$baseUrl/$fruitsCollection/$id.json"); // Target specific fruit
  final http.Response response = await http.delete(uri);

  if (response.statusCode != HttpStatus.ok && response.statusCode != HttpStatus.noContent) {
    throw Exception('Failed to delete fruit');
  } 
    
  }
}
