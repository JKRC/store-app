import 'package:flutter/material.dart';
import 'file:///C:/Users/Johnk/AndroidStudioProjects/store_app/lib/widgets/drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final Function drawerOptionsIndex;
  CustomDrawer(this.drawerOptionsIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: FlutterLogo(
                size: MediaQuery.of(context).size.height / 5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                children: [
                  DrawerTile(this.drawerOptionsIndex, 0),
                  DrawerTile(this.drawerOptionsIndex, 1)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
