import 'package:core/const/resource.dart';
import 'package:core/src/app/widget_extension/assets.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(fit: BoxFit.fill, image: R.ASSETS_SIDE_MENU_HEADER_PNG.imageAsset2())),
            child: const SizedBox(),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Flutter interview cards'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
