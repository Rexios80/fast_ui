import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastRxCompositeExample extends StatelessWidget {
  final _int = 0.rx;

  final _list = [0.rx].rx;
  final _listComposite = [0.rx].rx.composite;

  FastRxCompositeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fast_rx Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) => Row(
            children: [
              _buildList(constraints, 'RxList:', _list),
              _buildList(constraints, 'RxCompositeList:', _listComposite),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(BoxConstraints constraints, String title, List list) {
    return SizedBox(
      width: constraints.maxWidth / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Expanded(
            child: FastBuilder(
              () => ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Text(
                    list[index].toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void increment() {
    _int.value++;

    _list.first.value = _int.value;
    _listComposite.first.value = _int.value;
  }
}
