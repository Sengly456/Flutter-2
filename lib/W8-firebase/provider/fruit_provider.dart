

import 'package:flutter/material.dart';
import 'package:flutter2/W8-firebase/model/Fruit.dart';
import 'package:flutter2/W8-firebase/repository/Fruit_repo.dart';
import 'package:flutter2/async_value.dart';

class FruitProvider extends ChangeNotifier {
  final FruitRepository _repository;
  AsyncValue<List<Fruit>>? fruitsState;

  FruitProvider(this._repository) {
    fetchUsers();
  }

  bool get isLoading => fruitsState != null && fruitsState!.state == AsyncValueState.loading;
  bool get hasData => fruitsState != null && fruitsState!.state == AsyncValueState.success;

  void fetchUsers() async {
    try {
      // 1- loading state
      fruitsState = AsyncValue.loading();
      notifyListeners();

      // 2 - Fetch users
      fruitsState = AsyncValue.success(await _repository.getFruits());

      print("SUCCESS: list size ${fruitsState!.data!.length.toString()}");

      // 3 - Handle errors
    } catch (error) {
      print("ERROR: $error");
      fruitsState = AsyncValue.error(error);
    }

    notifyListeners();
  }

  void addFruit(String name, double price) async {
    // 1- Call repo to add
   await _repository.addFruit(name: name, price: price);

    // 2- Call repo to fetch
    fetchUsers();
  }

  Future<void> deleteFruit(String id) async{
   await _repository.deleteFruit(id);

    fetchUsers();
  }
}