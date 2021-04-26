import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:normi/components/applyPage.dart';

Widget myListView(BuildContext context) {
  return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ApplyPage()));
          },
          child: ListTile(
            title: Text('Graphics Designer'),
            subtitle: Text("Because I'm really not good"),
            trailing: Column(
              children: [
                Icon(Icons.location_on_outlined),
                Text("C.A"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Binance Certified Dev'),
            subtitle: Text("Wait thats Me!"),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.location_on_outlined),
                Text("Remote Friendly"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Guy that makes Connect Wallet retain state'),
            subtitle: Text("Because I'm really confused"),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.location_on_outlined),
                Text("Anywhere"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          onHover: (value) {},
          child: ListTile(
            title: Text('Anime Translator'),
            subtitle: Text("Cool Job TBH"),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.location_on_outlined),
                Text("Japan"),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Suya Distributor'),
            subtitle: Text("I ran out of dummy data"),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.location_on_outlined),
                Text("Nigeria"),
              ],
            ),
          ),
        ),
      ],
    ).toList(),
  );
}
