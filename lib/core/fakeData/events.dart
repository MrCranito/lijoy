import 'package:lifoy/core/models/category.model.dart';
import 'package:lifoy/core/models/event.model.dart';
import 'package:latlong2/latlong.dart';
import 'package:lifoy/core/services/event.service.dart';


abstract class BaseFakeEvent { 

    Future<List<Event>> getEventsFromLocalization(LatLng userLoc);

    Future<List<Category>> getCategories();
}




class FakeEventService extends BaseFakeEvent {


  List<Category> categories = [
    Category(id: '0', name: 'Sport'),
    Category(id: '1', name: 'Music'),
    Category(id: '2', name: 'Populaire autour de chez vous')
  ];

  List<Event>fakeEvents = [
  Event(
      name: 'Semi Marathon',
      localization: LatLng(43.609428, 1.428345),
      urlImage: "https://upload.wikimedia.org/wikipedia/commons/8/82/Stockholmmarathon_2009-start3.jpg",
      categoryIds: ['0']
  ),
   Event(
      name: 'Match Lakers vs Clippe..',
      localization: LatLng(43.609428, 1.428345),
      urlImage: "https://static.lexpress.fr/medias_12150/w_1000,h_563,c_fill,g_north/v1570788384/la-star-des-los-angeles-lakers-lebron-james-monte-au-panier-face-aux-brooklyn-nets-en-match-de-pre-saison-nba-le-10-octobre-2019-a-shanghai_6221082.jpg",
      categoryIds: ['0']
      ),

  Event(
      name: 'Showcase de Booba',
      localization: LatLng(43.600545, 1.422465),
      urlImage: "https://fr.trace.tv/wp-content/uploads/sites/2/2017/06/VISUEL-ARTICLE-670x440.jpg",
      categoryIds: ['1']
      ),
  Event( 
      name: 'Soirée Psy-Transe',
      localization: LatLng(43.547610, 1.485441),
      urlImage: "https://i.pinimg.com/236x/93/e6/c2/93e6c2487d2329106c62732c9ba72e63--psytrance-flyers.jpg",
      categoryIds: ['1', '2']
      ),
  Event( 
      name: 'Open Air Pech David',
      localization: LatLng(43.547610, 1.485441),
      urlImage: 'https://www.divertissement.info/public/img/medium/10493607927277167841402386488227824722145590njpg_5f0c25d38ea60.jpg',
      categoryIds: ['1', '2']
    ),
];

    Future<List<Event>> getEventsFromLocalization(LatLng userLoc) async {
      return fakeEvents;
    }


    Future<List<Category>> getCategories() async { 
      return categories;
    }
    
      @override
      Future<Event> getEvent(String id) {
    // TODO: implement getEvent
    throw UnimplementedError();
      }

}