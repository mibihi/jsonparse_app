import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main()async{
  List _data = await getJson();
  //print(_data);
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Json Parse"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
    body: Center(
      child: Container(
        alignment: Alignment.center,
        child: ListView.builder(

          padding:  EdgeInsets.all(8.0),
            itemCount: _data.length,
            itemBuilder: (BuildContext context,int index){

              return Column(
                children: <Widget>[
                  Divider(height: 5.5),
                  ListTile(

                    title: Text("${_data[index]['title']}",
                    style: TextStyle(fontSize: 17.9),),
                    subtitle: Text("${_data[index]["body"]}",
                      style: TextStyle(fontSize: 17.9,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),),
                    leading: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Text("${_data[index]["body"][0]}",
                      style:TextStyle(fontSize: 25.6,
                      color: Colors.white)),
                    ),
                    onTap: () => _showonTapMessage(context,_data[index]['body']),
                  ),

                 ],
              );

            }),

      )

    ),

    ),
  ));
}
void _showonTapMessage(BuildContext context,String message){
  var alert = AlertDialog(

    title:Text("My App") ,
    content: Text(message),
    actions: <Widget>[
      FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Ok"))
    ],
  );
  //showDialog(context: context,child: alert);
  showDialog(context: context,builder: (context)=>alert);
}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}