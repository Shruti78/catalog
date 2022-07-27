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
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeddata = jsonDecode(catalogJson);
    var productsdata = decodeddata("products");
    Catalogmodel.Items = List.from(productsdata)
        .map<Item>((Item) => Item.fromMap(Item))
        .toList(); // Will give list of items

    setState(
        () {}); // agar y ni karenge toh ek hi object ccall hoga we need to call all the items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Catalog App"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (Catalogmodel.Items != Null && Catalogmodel.Items.isNotEmpty)
            ? ListView.builder(
                itemCount: Catalogmodel.Items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: Catalogmodel.Items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
