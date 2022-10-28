import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifoy/core/models/event.model.dart';

class MapItemDetailComponent extends StatelessWidget {
  const MapItemDetailComponent(
      {super.key, required this.event, required this.index});
  final Event event;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: index == 0
          ? const EdgeInsets.fromLTRB(10, 0, 5, 0)
          : const EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child:
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        child:  Stack(children: [
                          Container(
                            decoration: new BoxDecoration(color: Colors.white, image: new DecorationImage(image: new NetworkImage("https://upload.wikimedia.org/wikipedia/commons/0/0b/White_Diamonds_Party.jpg"), fit: BoxFit.fill)),
                            child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                              child: Icon(Icons.favorite_border, color: Colors.white),
                              )),
                        ),

                         
                         
                        ])
                      ),
                    )),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Row(
                    children: [
                      Icon(Icons.date_range),
                      Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('19-20.10.2021')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Row(
                    children: [
                      Icon(Icons.watch),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('19:00'),
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
      width: 250,
    );
  }
}
