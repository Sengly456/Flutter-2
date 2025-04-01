import 'package:flutter2/W8-firebase/model/Fruit.dart';

abstract class FruitRepository {
  Future<Fruit> addFruit({required String name, required double price});
  Future<List<Fruit>> getFruits();
  Future<void> deleteFruit(String id);
}