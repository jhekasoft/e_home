import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'device_item.dart';
import 'device_details_view.dart';

/// Displays a list of SampleItems.
class DeviceListView extends StatelessWidget {
  const DeviceListView({
    super.key,
    this.items = const [DeviceItem(1), DeviceItem(2), DeviceItem(3)],
  });

  static const routeName = '/';

  final List<DeviceItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('eHome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: ListView.builder(
          // Providing a restorationId allows the ListView to restore the
          // scroll position when a user leaves and returns to the app after it
          // has been killed while running in the background.
          restorationId: 'sampleItemListView',
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];

            return ListTile(
                title: Text('Київ метео ${item.id}'),
                subtitle: const Text('23.32℃\n46.21%'),
                leading: const Icon(Icons.device_thermostat),
                // leading: const CircleAvatar(
                //   // Display the Flutter Logo image asset.
                //   foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                // ),
                isThreeLine: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  // side: BorderSide(color: Colors.black)
                ),
                onTap: () {
                  // Navigate to the details page. If the user leaves and returns to
                  // the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.restorablePushNamed(
                    context,
                    DeviceDetailsView.routeName,
                  );
                });
          },
        ),
      ),
    );
  }
}
