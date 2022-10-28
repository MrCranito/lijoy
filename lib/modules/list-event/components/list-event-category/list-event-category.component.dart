import 'package:flutter/material.dart';
import 'package:lifoy/core/models/category.model.dart';
import 'package:lifoy/core/models/event.model.dart';
import 'package:lifoy/modules/list-event/components/list-event-item/list-event-item.component.dart';

class ListEventCategory extends StatelessWidget {
  const ListEventCategory(
      {super.key,
      required Category this.category,
      required List<Event> this.events});

  final List<Event> events;

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: Colors.white,
        child: Column(children: [
          Flexible(flex: 1, child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: Text(
                      category.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))),
            Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: Icon(Icons.chevron_right, size: 28))
          ]), ),
          Flexible(
              flex: 4,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 20),
                  child: ListView.builder(
                    itemCount: events.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ListEventItem(event: events[index], index: index);
                    },
                  )))
        ]));
  }
}
