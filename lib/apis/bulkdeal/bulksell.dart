import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class BulkSell extends StatefulWidget {
  const BulkSell({ Key? key }) : super(key: key);

  @override
  _BulkSellState createState() => _BulkSellState();
}

class _BulkSellState extends State<BulkSell> {
   List listResponse = [];
    Map mapResponse = {};
    Future fetchData() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://www.goindiastocks.com/api/service/GetBulkBlockDeal?fincode=100114&DealType=Bulk_Deal"));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse["Data"];
      });
    }
  }
   @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
     
      child:mapResponse==null?Container():Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listResponse == null?0:listResponse.length,
          itemBuilder: (context,index){
          return   Padding(
            padding: const EdgeInsets.all(8.0),
            child: listResponse[index]["DealType"]=="SELL"? Card(
              child: Container(
                margin: EdgeInsets.only(left: 3,top: 2,bottom: 2),
                decoration: BoxDecoration(
                
                  border:Border(left: BorderSide(color: listResponse[index]["DealType"]=="BUY"?Colors.green:Colors.red,width: 3.0,))
             
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
  Text(listResponse[index]["ClientName"].toString().replaceFirst(RegExp("LIMITED"),"" ),style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      
                      Text(listResponse[index]["DealDate"].toString().substring(0,10))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("${listResponse[index]["DealType"]} ".replaceFirst(RegExp("BUY"), "Bought",),style:TextStyle(color: listResponse[index]["DealType"]=="BUY"?Colors.green:Colors.red)),
                      Text("${listResponse[index]["Quantity"]} ",style:TextStyle(color: listResponse[index]["DealType"]=="BUY"?Colors.green:Colors.red)),
                      Text("shares ",style:TextStyle(color: listResponse[index]["DealType"]=="BUY"?Colors.green:Colors.red)),
    
                      Text("@ Rs "+listResponse[index]["TradePrice"]),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Value  Rs ",style: TextStyle(color: Colors.blue),),
                     
                      Text("${listResponse[index]["Value"].toString().substring(0,3)}"+"."+listResponse[index]["Value"][4]+" cr",style: TextStyle(color: Colors.blue)),
                    ],
                  )

                ],
            ),
              ),):Visibility(
                visible:false,
                child: Text("")),
          );
        })
      ),
    );
  }
}