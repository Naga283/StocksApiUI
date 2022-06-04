//@dart =2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goindiastocks/apis/try/bulkModel.dart';
import 'package:http/http.dart' as http;

class Try{
  var alldata =null;
var url ="https://www.goindiastocks.com/api/service/GetBulkBlockDeal?fincode=100114&DealType=Bulk_Deal";

  Future<List<Datum>> getData() async{
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if(response.statusCode == 200){
var jsonString = response.body;
var jsonMap = json.decode(jsonString);
 alldata = Datum.fromJson(jsonMap);
    }
  
print(alldata);
    return alldata;
    
  }
  
}
class TryApi extends StatefulWidget {
  const TryApi({ Key key }) : super(key: key);

  @override
  _TryApiState createState() => _TryApiState();
}

class _TryApiState extends State<TryApi> {
List<Datum> listClient=[];
List<Datum> listData = [];
Future<Datum> dataHere;

  @override
  void initState() {
    // TODO: implement initState
    Try().getData().then((val) {
      setState(() {
        listClient = val ;
listData = listClient;
      });
    }
    
    );
    dataHere = Try().getData() as Future<Datum>;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
          Scaffold(
            body: Column(
              children: [
                TextField(
                  onChanged: (text){
                    text = text.toLowerCase();
                    setState(() {
                      listClient = listData
                              .where(
                                (u) => (u.clientName.toLowerCase().contains(
                                      text
                                    )),
                              )
                              .toList();
                              print("Searching Started");
                             print(listClient);
                    });
                   
                  },
                  decoration: InputDecoration(hintText: "\t\t\t\tSearch Client Name",
                  
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                  ),
                ),
                
              ],
            ),
          );
  }
}