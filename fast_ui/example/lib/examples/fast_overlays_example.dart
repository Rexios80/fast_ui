import 'package:fast_overlays/fast_overlays.dart';
import 'package:flutter/material.dart';

class FastOverlaysExample extends StatelessWidget {
  const FastOverlaysExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fast_overlays Example'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
            child: const Text('Snackbar'),
            onPressed: () {
              FastOverlays.showSnackBar(
                const SnackBar(
                  content: Text('I am a snackbar'),
                  duration: SnackBarDuration.short,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Material Banner'),
            onPressed: () {
              FastOverlays.showMaterialBanner(
                MaterialBanner(
                  content: const Text('I am a material banner'),
                  actions: [
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () => FastOverlays.hideCurrentMaterialBanner(),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Modal Bottom Sheet'),
            onPressed: () {
              FastOverlays.showModalBottomSheet(
                builder: (context) => const SizedBox(
                  height: 200,
                  child: Center(child: Text('I am a modal bottom sheet')),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Date Picker'),
            onPressed: () {
              FastOverlays.showDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                lastDate: DateTime.now(),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Date Range Picker'),
            onPressed: () {
              FastOverlays.showDateRangePicker(
                firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                lastDate: DateTime.now(),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Time Picker'),
            onPressed: () {
              FastOverlays.showTimePicker(initialTime: TimeOfDay.now());
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('License Page'),
            onPressed: () {
              FastOverlays.showLicensePage();
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Search'),
            onPressed: () {
              FastOverlays.showSearch(delegate: SearchDelegateImpl());
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Menu'),
            onPressed: () {
              FastOverlays.showMenu(
                position: RelativeRect.fill,
                items: const [
                  PopupMenuItem(child: Text('Item 1')),
                  PopupMenuItem(child: Text('Item 2')),
                  PopupMenuItem(child: Text('Item 3')),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Dialog'),
            onPressed: () {
              FastOverlays.showDialog(
                builder: (context) => const AlertDialog(
                  title: Text('I am a dialog'),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('About Dialog'),
            onPressed: () {
              FastOverlays.showAboutDialog();
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('General Dialog'),
            onPressed: () {
              FastOverlays.showGeneralDialog(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AlertDialog(
                  title: const Text('I am a general dialog'),
                  actions: [
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchDelegateImpl extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text('I am the search results'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('I am the search suggestions'),
    );
  }
}
