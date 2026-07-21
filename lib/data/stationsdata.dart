import 'package:latlong2/latlong.dart';
import '../models/station.dart';


final List<Station> stations = [

 Station(
   name:"Khartoum Central",
   location:LatLng(15.6000,32.5340),
   line:"Blue Line",
   nextTrain:"3 min",
 ),

 Station(
   name:"Bahri Station",
   location:LatLng(15.6400,32.5600),
   line:"Green Line",
   nextTrain:"7 min",
 ),

 Station(
   name:"Airport Station",
   location:LatLng(15.5890,32.5530),
   line:"Red Line",
   nextTrain:"9 min",
 ),

];