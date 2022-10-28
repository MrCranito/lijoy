import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifoy/core/fakeData/events.dart';
import 'package:lifoy/core/models/category.model.dart';
import 'package:lifoy/core/models/event.model.dart';
import 'package:latlong2/latlong.dart';
import 'package:lifoy/modules/list-event/components/list-event-category/list-event-category.component.dart';

class ListEventView extends StatefulWidget {
  ListEventView({super.key});
  final fakeService = FakeEventService();
  @override
  ListEventViewState createState() => ListEventViewState();
}

class ListEventViewState extends State<ListEventView> {

  List<Event> events = [];

  List<Category> categories = [];

  getEvents(){
    widget.fakeService.getEventsFromLocalization(LatLng(43.611527, 1.420244))
        .then((List<Event> list) => {
      setState(() {
        events = list;
      })
    });
  }

  getCategories() {
    widget.fakeService.getCategories().then((List<Category> list) => {
      setState(() {
        categories = list;
      })
    });
  }

  @override 
  void initState() {
    super.initState();
    getEvents();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Lijoy', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: [
          Padding(padding: const EdgeInsets.only(right: 10), child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),)
          
        ]

      ),
      body: 
      Container(
        color: Colors.grey[200],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 10),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListEventCategory(category: categories[index], events: events.where((element) => element.categoryIds.contains(categories[index].id)).toList());
        }, separatorBuilder: (BuildContext context, int index) { 
         return SizedBox(
            height: 10,
          );
         },
      )
    ));
  }
  
}