import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  runApp(
    MaterialApp(
      home: MYAPI(),
    )
  );
}

class MYAPI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MYAPIState();
  }
}



class MYAPIState extends State<MYAPI>{
   String getData="" ;
   List getList=[];
  Future fetchData ()  async {
    http.Response response;
    response =await  http.get(Uri.parse('http://91weblessons.com/demo/api/mobile/api2.php'));


if (response.statusCode == 200){
  setState(() {
    getList = json.decode(response.body);
  });
  }
  }

@override
void initState(){
    super.initState();
    fetchData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My API"),
      ),
      body:ListView.builder(itemCount: getList==null?0:getList.length,
               itemBuilder: (BuildContext context,int index){
        return Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Container(
                    child: Text(getList[index].toString(),style: TextStyle(fontSize: 25.0),),
                    padding: EdgeInsets.all(15.0,),
                  ),
                )
              ],
            ),
          ),
        );
               })
    );
  }

}