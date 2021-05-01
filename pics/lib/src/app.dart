import 'package:flutter/material.dart';
import "dart:convert";
import 'package:http/http.dart' show get;
import "./models/image_model.dart";
import "./widgets/image_list.dart";

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response = await get(
        Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter"));

    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Lets see some image!",
          textAlign: TextAlign.left,
        ),
      ),
      body: ImageList(images),
    ));
  }
}
