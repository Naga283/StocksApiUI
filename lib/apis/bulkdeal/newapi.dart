//@dart =2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goindiastocks/practice/lib/models/newsInfo.dart';
import 'package:goindiastocks/practice/lib/services/api_manager.dart';
import 'package:http/http.dart' as http;
class AllApi extends StatefulWidget {
   AllApi({ Key key }) : super(key: key);
  List listResponse = [];

  @override
  _AllApiState createState() => _AllApiState();
}


class _AllApiState extends State<AllApi> {
  List<Datum> news =<Datum>[];
  List<Datum> dataDisplay =<Datum>[];
  Future<Welcome> _newsModel;  
   @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
     
      child:Container(
        child: FutureBuilder<Welcome>(
          future: _newsModel,
          
          builder: (context,snapshot) {
            return Column(
              children: [
                 TextField(
            onChanged: (text){
              text = text.toLowerCase();
              setState(() {
                news = dataDisplay.where((e){
                  var postTitle = e.clientName.toLowerCase();
                  print(postTitle);
                  return postTitle.contains(text);
                }).toList();
              //  var fetchdata = snapshot.data.data;
                // _newsModel =_newsModel.where((client){
                //   var clienType = client.clientName.toLowerCase();
                //   return clienType.contains(text);
                // }).toList();
               print(text);
                        print("Searching Started");
                        
                       
              });
            },
            decoration: InputDecoration(hintText: "\t\t\t\tSearch Client Name",
            
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(40))
            ),
          ),
          SizedBox(height: 10,),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data == null?0:snapshot.data.data.length,
                    itemBuilder: (context,index){
                      var fetchdata = snapshot.data.data[index];
                     //  clientName = listResponse[index]["ClientName"].toString();
                    return   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.only(left: 3,top: 2,bottom: 2),
                          decoration: BoxDecoration(
                          
                            border:Border(left: BorderSide(color: fetchdata.dealType.toString().substring(9)=="BUY"?Colors.green:Colors.red,width: 3.0,))
                       
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(fetchdata.clientName.toString().replaceFirst(RegExp("LIMITED"),"" ),style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                
                                Text(fetchdata.dealDate.toString().substring(0,10))
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("${fetchdata.dealType} ".replaceFirst(RegExp("BUY"), "Bought",).substring(9),style:TextStyle(color: fetchdata.dealType.toString().substring(9)=="BUY"?Colors.green:Colors.red)),
                                Text("${fetchdata.quantity} ",style:TextStyle(color: fetchdata.dealType.toString().substring(9) =="BUY"?Colors.green:Colors.red)),
                                Text("shares ",style:TextStyle(color: fetchdata.dealType.toString().substring(9)=="BUY"?Colors.green:Colors.red)),
                    
                                Text("@ Rs "+fetchdata.tradePrice),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("Value  Rs ",style: TextStyle(color: Colors.blue),),
                               
                                Text("${fetchdata.value.toString().substring(0,3)}"+"."+fetchdata.value[4]+" cr",style: TextStyle(color: Colors.blue)),
                              ],
                            )
                
                          ],
                      ),
                        ),),
                    );
                  }),
                ),
              ],
            );
          }
        )
      ),
    );
  }
}