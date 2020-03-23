import 'package:geolocator/geolocator.dart';


class Location{

  double longitude;
  double latitude;


  Future<void>getCurrentPosition()async{
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      longitude = position.longitude;
      latitude =position.latitude;}
    catch(e){print(e);}

  }


}