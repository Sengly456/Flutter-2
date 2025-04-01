// REPOSITORY
import 'package:flutter/material.dart';
import 'package:flutter2/W8-firebase/model/Fruit.dart';
import 'package:flutter2/W8-firebase/provider/fruit_provider.dart';
import 'package:flutter2/W8-firebase/repository/firebase_fruit_repo.dart';
import 'package:flutter2/W8-firebase/repository/Fruit_repo.dart';

import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  void _onAddPressed(BuildContext context) {
    final FruitProvider fruitProvider = context.read<FruitProvider>();
    fruitProvider.addFruit("apple", 3.1);
  }

  @override
  Widget build(BuildContext context) {
    final fruitProvider = Provider.of<FruitProvider>(context);

    Widget content = Text('');
    if (fruitProvider.isLoading) {
      content = CircularProgressIndicator();
    } else if (fruitProvider.hasData) {
      List<Fruit> fruits = fruitProvider.fruitsState!.data!;

      if (fruits.isEmpty) {
        content = Text("");
      } else {
        content = ListView.builder(
          itemCount: fruits.length,
          itemBuilder:
              (context, index) => ListTile(
                title: Text(fruits[index].name),
                subtitle: Text("${fruits[index].price}"),
                trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () => fruitProvider.deleteFruit(fruits[index].id) ),
              ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [IconButton(onPressed: () => _onAddPressed(context), icon: const Icon(Icons.add))],
      ),
      body: Center(child: content),
    );
  }
}

// 5 - MAIN
void main() async {
  // 1 - Create repository
  final FruitRepository fruitRepository = FirebaseFruitsRepository();

  // 2-  Run app
  runApp(
    ChangeNotifierProvider(
      create: (context) => FruitProvider(fruitRepository),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: const App()),
    ),
  );
}
