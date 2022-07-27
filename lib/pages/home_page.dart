import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/ItemWidget.dart';
import 'package:catalog/widgets/drawer.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeddata = jsonDecode(catalogJson);
    var productsdata = decodeddata("products");
  }

  @override
  Widget build(BuildContext context) {
    // list generation k lie ek item num of times likhne k lie
    final dummylist = List.generate(10, (index) => Catalogmodel.Items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Catalog App"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
