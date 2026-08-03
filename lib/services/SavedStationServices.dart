import '../models/station.dart';
import '../services/api_services.dart';
import '../services/session_services.dart';
import 'package:latlong2/latlong.dart';

class SavedStationServices {


  static Future<bool> saveStation(
      Station station
  ) async {


    final userId = await SessionService.getUserId();


    if(userId == null){
      return false;
    }


    return await ApiService.saveStation(
      userId,
      station.id,
    );

  }





  static Future<bool> removeStations(
      Station station
  ) async {


    final userId = await SessionService.getUserId();


    if(userId == null){
      return false;
    }


    return await ApiService.removeSavedStation(
      userId,
      station.id,
    );

  }





  static Future<bool> isSaved(
      Station station
  ) async {


    final stations = await getSavedStations();


    return stations.any(
      (item)=> item.id == station.id
    );


  }





  static Future<List<Station>> getSavedStations() async {


    final userId = await SessionService.getUserId();


    if(userId == null){
      return [];
    }


    final data = await ApiService.getSavedStations(
      userId,
    );


    return data.map<Station>((item){


      return Station(

        id: int.parse(item["id"].toString()),

        name: item["name"],

        line: item["line"],

        location: const LatLng(0,0),

        nextTrain: "Unknown",

      );


    }).toList();


  }

}