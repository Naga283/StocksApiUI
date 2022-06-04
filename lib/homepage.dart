//@dart =2.9
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goindiastocks/apis/blockdeal/allblock.dart';
import 'package:goindiastocks/apis/blockdeal/blockbuy.dart';
import 'package:goindiastocks/apis/blockdeal/sellblock.dart';
import 'package:goindiastocks/apis/bulkdeal/bulkbuy.dart';
import 'package:goindiastocks/apis/bulkdeal/bulksell.dart';
import 'package:goindiastocks/apis/bulkdeal/newapi.dart';
import 'package:goindiastocks/practice/lib/models/newsInfo.dart';
import 'package:goindiastocks/practice/lib/services/api_manager.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool allvis = true;
  bool bulkvis = false;
  bool bulksellvis = false;
  bool blockdeal = false;
  bool blockdealall = false;
  bool bulkdeal = true;
  bool blockbuy= false;
  bool blocksell = false;
  List<Welcome> userData = [];
  Future<Welcome> _newsModel;  
   @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                  //  vis = true;
                  
                  // if(bulkdeal == true){
                  //   bulkdeal = true;
                  // blockdeal = false;
                  // allvis = true;
                  //  bulkvis = false;
                  //   bulksellvis = false;
                  //   blockbuy = false;
                  //   blocksell = false;
                  // }
                    bulkdeal = true;
                  blockdeal = false;
                  allvis = true;
                  // else{
                  // //   bulkdeal = false;
                  // // blockdeal = false;
                  // // allvis = false;
                  // // bulkvis = false;
                  // //   bulksellvis = false;
                  // //   blockbuy = false;
                  // //   blocksell = false;
                  // }
                  });
                },
                child: Container(
                 
                  padding: EdgeInsets.only(bottom: 10,left: 50,right: 50),
                  // width: MediaQuery.of(context).size.width*0.4,
                  decoration: BoxDecoration(
                    
                    border: Border(bottom: BorderSide(width: 2.0, color: Colors.red.shade900),)
                  ),
                  child: Text("Bulk Deal",style: TextStyle(fontSize: 16,color: Colors.blue),)),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                  //  vis = true;
                  // if(blockdeal == true){
                  //    bulkdeal = false;
                  // blockdeal = true;
                  // blockdealall=true;
                  // bulkvis = false;
                 
                  //   bulksellvis = false;
                  //   blockbuy = false;
                  //   blocksell = false;
                  // }
                   bulkdeal = false;
                  blockdeal = true;
                  blockdealall=true;
                  // else{
                  //   bulkdeal = false;
                  // blockdeal = false;
                  // allvis = false;
                  // bulkvis = false;
                  //   bulksellvis = false;
                  //   blockbuy = false;
                  //   blocksell = false;
                  // }
                 
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 10,left: 50,right: 50),
                  
                  decoration: BoxDecoration(
                    
                    border: Border(bottom: BorderSide(width: 2.0, color: Colors.red.shade900),)
                  ),
                  child: Text("Block Deal",style: TextStyle(fontSize: 16,color: Colors.blue),)),
              ),
              
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(blockdeal==true){
                      blockdealall=true;
                      allvis = false;
                      bulkvis = false;
                    bulksellvis = false;
                    blockbuy = false;
                    blocksell = false;
                    }
                  else{
                    allvis = true;
                    blockdealall = false;
                     bulkvis = false;
                    bulksellvis = false;
                    blockbuy = false;
                    blocksell = false;
                  }
                    

                    // print(vis);
                  });
                },
                child: all(text: 'All', col: Colors.blue, textCol: Colors.black, bordCol: Colors.black,)),
              GestureDetector(
                onTap: (){
                   setState(() {
                     if(blockdeal==true){
                        allvis = false;
                     bulkvis = false;
                     blockbuy = true;
                     blocksell = false;
                     bulksellvis = false;
blockdealall = false;
                     }
                     else{
                       allvis = false;
                     bulkvis = true;
                     blockbuy = false;
                     blocksell = false;
                     bulksellvis = false;
                     }
                    
                     
                  
                  });
                },
                child: all(text: 'Buy', col: Colors.green, textCol: Colors.white, bordCol: Colors.green,)),
              GestureDetector(
                onTap: (){
                 setState(() {
                    if(blockdeal==true){
                        allvis = false;
                     bulkvis = false;
                     blockbuy = false;
                     blocksell = true;
                     bulksellvis = false;
blockdealall = false;
                     }
                     else{
                       allvis = false;
                     bulkvis = false;
                     blockbuy = false;
                     blocksell = false;
                     bulksellvis = true;
                     }
                 });
                },
                child: all(text: 'Sell', col: Colors.red, textCol: Colors.white, bordCol: Colors.red,))
              
            ],

          ),
          SizedBox(height: 20,),
         
          TextField(
            onChanged: (text){
              text = text.toLowerCase();
              setState(() {
                //  _newsModel = _newsModel.where((client){
                   
                //  })
               print(text);
                        print("Searching Started");
                       print(userData);
              });
            },
            decoration: InputDecoration(hintText: "\t\t\t\tSearch Client Name",
            
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(40))
            ),
          ),
          SizedBox(height: 10,),
           Divider(thickness: 2,),
           Text(blockdeal.toString()+blockdealall.toString()+blockbuy.toString()+blocksell.toString()),
           Text(bulkdeal.toString()+allvis.toString()+bulkvis.toString()+bulksellvis.toString()),
           Visibility(
             visible: allvis,
             child: Flexible(child: AllApi())),
          //  Visibility(
          //    visible: bulkvis,
          //    child: Flexible(child: BulkBuy())),
          //     Visibility(
          //    visible: bulksellvis,
          //    child: Flexible(child: BulkSell())),
          // Visibility(
          //   visible: blockdealall,
          //   child: Flexible(child: AllBlockDeal())),
          //    Visibility(
          //   visible: blockbuy,
          //   child: Flexible(child: BlockBuy())),
          //    Visibility(
          //   visible: blocksell,
          //   child: Flexible(child: BlockSell())),
        ],
      ),
    );
  }
}

class all extends StatelessWidget {
  const all({
    Key key, this.text,  this.col, this.textCol,this.bordCol,
  }) : super(key: key);
final String text;
final Color col;
final Color textCol;
final Color bordCol;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color:col)],
        border: Border.all(width: 3.0,color: bordCol),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(text,style: TextStyle(color: textCol),));
  }
}