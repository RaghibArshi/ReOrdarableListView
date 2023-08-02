
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<int> items = List<int>.generate(30, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReOrderable List View'),
      ),
      body: ReorderableListView(
        children: List.generate(
            items.length,
                (index) => ListTile(
                  key: Key('$index'),
                  tileColor: items[index].isOdd ? Colors.lightGreen : Colors.white30,
                  title: Text('Number ${items[index]}'),
                  trailing: const Icon(Icons.star),
                ),
        ),
        onReorder: (int oldIndex, int newIndex){
          setState(() {
            if(oldIndex < newIndex){
              newIndex -= 1;
            }
            final int item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      )
    );
  }
}
