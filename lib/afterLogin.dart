import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'package:ui_task/MyWidgets.dart';
import 'package:ui_task/myCardList.dart';
import 'apiResponses.dart';

class afterLogin extends StatelessWidget{
  final Future<List<myCard>> products= fetchURL();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: afterLoginPage(products),
    );
  }
}

class afterLoginPage extends StatelessWidget{
  final Future<List<myCard>> products;
  afterLoginPage(this.products);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Flyingwolf",style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(),
      body: Container(
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Row(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(23,10,10,10),
                      child: Container(
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                image: DecorationImage(
                                  image: AssetImage("profilePicture.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                            ),

                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all( 10),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text("Simon Baker",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            height: 50,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 23),
                            height: 50,
                            width: 160,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                            ),
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Text("2250",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 25,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Text("Elo rating",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                )
                              ]
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            aRandomWidget(),
            Padding(padding: EdgeInsets.only(top: 20)),
            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Text("Recommended For You",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            FutureBuilder <List<myCard>> (
              future: products,
              builder: (context,snap){
                if(snap.hasError) print(snap.error);
                return snap.hasData
                    ? MyCardList(items:snap.data)
                    : Center(child: CircularProgressIndicator());
              }
            ) ,
          ],
        ),
      ),
    );
  }
}

Widget aRandomWidget(){
  var totalLength=150.0;
  return Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: totalLength,
          height: 120,
          decoration: BoxDecoration(
            // color: Colors.blue,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.yellow,
                  Colors.orange,
                ],
              )
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 15),),
              Center(
                child: Text("34",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text("Tournaments Played",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
        Container(
          width: totalLength,
          height: 120,
          // color: Colors.red,
          decoration: BoxDecoration(
            // color: Colors.blue,
            //   borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.purpleAccent,
                  Colors.deepPurple,
                ],
              )
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 15),),
              Center(
                child: Text("09",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text("Tournaments   won",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
        Container(
          width: totalLength,
          height: 120,
          // color: Colors.green,
          decoration: BoxDecoration(
            // color: Colors.blue,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffFF4D00),
                  Color(0xffCC0000),
                ],
              )
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 15),),
              Center(
                child: Text("26%",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text("Winning percentage",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

//
// FutureBuilder <List<myCard>>(
// // future: products,
// builder: (context,snapshot){
// if(snapshot.hasError)
// print(snapshot.error);
// return snapshot.hasData
// ? MyCardList(items: snapshot.data)
//     : Center(child: CircularProgressIndicator());
// }
// )
