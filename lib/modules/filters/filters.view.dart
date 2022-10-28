import 'package:flutter/material.dart';


class FiltersView extends StatefulWidget {
 FiltersView({super.key});
  @override
  FiltersViewState createState() => FiltersViewState();
}

class FiltersViewState extends State<FiltersView> {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Paramètres'),
          centerTitle: true,
        ),
        body: Container(),
      );
  }

}