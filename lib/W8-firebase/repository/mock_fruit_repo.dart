import 'package:flutter2/W8-firebase/model/Fruit.dart';
import 'package:flutter2/W8-firebase/repository/Fruit_repo.dart';

class MockFruitRepository extends FruitRepository {
  final List<Fruit> Fruits = [];

  @override
  Future<Fruit> addFruit({required String name, required double price}) {
    return Future.delayed(Duration(seconds: 1), () {
      Fruit newPancake = Fruit(id: "0", name: name, price: 12);
      Fruits.add(newPancake);
      return newPancake;
    });
  }

  @override
  Future<List<Fruit>> getFruits() {
    return Future.delayed(Duration(seconds: 1), () => Fruits);
  }
}