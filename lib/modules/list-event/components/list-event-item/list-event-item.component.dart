import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifoy/core/models/event.model.dart';

class ListEventItem extends StatelessWidget {


  const ListEventItem(
      {super.key, required this.event, required this.index});
  final Event event;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                            decoration: new BoxDecoration(color: Colors.white, image: new DecorationImage(image: new NetworkImage(event.urlImage), fit: BoxFit.fill)),
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
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Row(
                    children: [
                      Icon(Icons.date_range, size: 14,),
                      Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('20 Décembre 2021', style: TextStyle(fontSize: 12))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 7.5, 0, 0),
                  child: Row(
                    children: [
                      Icon(Icons.watch, size: 14),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('19:00', style: TextStyle(fontSize: 12)),
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
      width: 225,
    );
  }
}