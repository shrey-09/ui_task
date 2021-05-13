import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
// import 'package:url_launcher/url_launcher.dart';

class myCard{
  final String imagesrc;
  final String eventName;
  final String gameName;
  final String redirectedUrl;

  myCard(
      this.imagesrc,
      this.eventName,
      this.gameName,
      this.redirectedUrl
  );
  factory myCard.fromMap(Map<String, dynamic> json) {
    return myCard(json['cover_url'], json['name'], json['game_name'], json['dynamic_app_url']);
  }
  factory myCard.fromJson(Map<String, dynamic> json) {
    return myCard(json['cover_url'], json['name'], json['game_name'], json['dynamic_app_url']);
  }
}

// _launchURLApp(String url) async {
//   //const url = _url;
//   if (await canLaunch(url)) {
//     await launch(url, forceSafariVC: true, forceWebView: true);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

class myCardItem extends StatelessWidget {
  myCardItem(this.item);
  final myCard item;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top:15,bottom: 10),
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(
                  image: NetworkImage(this.item.imagesrc.toString()),
                  fit: BoxFit.cover,
                ),
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 12.0,
                )],
                borderRadius: BorderRadius.only(topLeft: (Radius.circular(20)),topRight: (Radius.circular(20)),)
            ),
          ),
          Container(
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(

                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  // offset: Offset(0.1,1.0),
                  blurRadius: 12.0,
                )],
                borderRadius: BorderRadius.only(bottomLeft: (Radius.circular(20)),bottomRight: (Radius.circular(20)),)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left:12,right: 8),
                  width: 440,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          this.item.eventName,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          )
                        ),
                      Text(this.item.gameName.toString(),style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
                IconButton(
                  // hoverColor: Colors.blueGrey,
                  //   enableFeedback: true,
                     onPressed: (){},//_launchURLApp(this.item.redirectedUrl.toString()),
                    icon: Icon(Icons.arrow_forward_ios)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
