import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastOverlaysExample extends StatelessWidget {
  const FastOverlaysExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: FastScaffold.register(),
      appBar: AppBar(
        title: const Text('fast_overlays Example'),
        leading: const IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: FastNav.pop,
        ),
        actions: const [SizedBox.shrink()],
      ),
      drawer: const Drawer(
        child: ElevatedButton(
          onPressed: FastScaffold.closeDrawer,
          child: Text('Close Drawer'),
        ),
      ),
      endDrawer: const Drawer(
        child: ElevatedButton(
          onPressed: FastScaffold.closeEndDrawer,
          child: Text('Close End Drawer'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Text('FastOverlays'),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          const Text('FastScaffold'),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Bottom Sheet'),
            onPressed: () {
              FastScaffold.showBottomSheet(
                (context) => const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('I am a bottom sheet'),
                ),
                elevation: 16,
                constraints: const BoxConstraints(minWidth: double.infinity),
              );
            },
          ),
          const SizedBox(height: 16),
          const ElevatedButton(
            onPressed: FastScaffold.openDrawer,
            child: Text('Open Drawer'),
          ),
          const SizedBox(height: 16),
          const ElevatedButton(
            onPressed: FastScaffold.openEndDrawer,
            child: Text('Open End Drawer'),
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
