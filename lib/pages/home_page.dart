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
    await Future.delayed(const Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeddata = jsonDecode(catalogJson);
    var productsdata = decodeddata("products");
    Catalogmodel.Items = List.from(productsdata)
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        .map<Item>((Item) => Item.fromMap(Item))
        .toList(); // Will give list of items

    setState(
        () {}); // agar y ni karenge toh ek hi object ccall hoga we need to call all the items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Catalog App"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // ignore: unrelated_type_equality_checks
        child: (Catalogmodel.Items != Null && Catalogmodel.Items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = Catalogmodel.Items[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      child: Image.network(
                        item.image,
                      ),
                      footer: Container(
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
