import 'dart:convert';
import 'dart:async';
import 'MyWidgets.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

Future<List<myCard>> fetchURL() async {
  String url="http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return decodeURL(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<myCard> dynamicToMyList(List<dynamic> MyList){
  var temp =  List<myCard>.empty(growable: true);
  for(int i=0;i<MyList.length;i++){
      myCard obj = myCard(MyList[i]['cover_url'],MyList[i]['name'],MyList[i]['game_name'],MyList[i]['dynamic_app_url']);
      temp.add(obj);
  }
  print(temp.length);
  return temp;
}

List<myCard> decodeURL(String responseBody) {
    final parsed = json.decode(responseBody);
    final newlyParsed=parsed['data']['tournaments'];
    return newlyParsed.map<myCard>( (json) {
      return myCard.fromJson(json);
    }).toList();
    // return dynamicToMyList(parsed['data']['tournaments']);
}
