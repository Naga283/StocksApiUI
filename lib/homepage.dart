import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goindiastocks/apis/blockdeal/allblock.dart';
import 'package:goindiastocks/apis/blockdeal/blockbuy.dart';
import 'package:goindiastocks/apis/blockdeal/sellblock.dart';
import 'package:goindiastocks/apis/bulkdeal/bulkbuy.dart';
import 'package:goindiastocks/apis/bulkdeal/bulksell.dart';
import 'package:goindiastocks/apis/bulkdeal/newapi.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool allvis = true;
  bool bulkvis = false;
  bool bulksellvis = false;
  bool blockdeal = false;
  bool blockdealall = false;
  bool bulkdeal = false;
  bool blockbuy= false;
  bool blocksell = false;
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
                  bulkdeal = true;
                  blockdeal = false;
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
                  bulkdeal = false;
                  blockdeal = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 10,left: 50,right: 50),
                  // width: MediaQuery.of(context).size.width*0.4,
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
                     allvis = false;
                     bulkvis = true;
                     bulksellvis = false;
                     
                  
                  });
                },
                child: all(text: 'Buy', col: Colors.green, textCol: Colors.white, bordCol: Colors.green,)),
              GestureDetector(
                onTap: (){
                 setState(() {
                    allvis = false;
                     bulkvis = false;
                     bulksellvis = true;
                 });
                },
                child: all(text: 'Sell', col: Colors.red, textCol: Colors.white, bordCol: Colors.red,))
              
            ],

          ),
          SizedBox(height: 20,),
         
          TextFormField(
            
            decoration: InputDecoration(hintText: "\t\t\t\tSearch Client Name",
            
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(40))
            ),
          ),
          SizedBox(height: 10,),
           Divider(thickness: 2,),
           Text(blockdeal.toString()+blockdealall.toString()),
           Text(bulkdeal.toString()+bulkvis.toString()),
           Visibility(
             visible: allvis,
             child: Flexible(child: AllApi())),
           Visibility(
             visible: bulkvis,
             child: Flexible(child: BulkBuy())),
          //     Visibility(
          //    visible: bulksellvis,
          //    child: Flexible(child: BulkSell())),
          Visibility(
            visible: blockdealall,
            child: Flexible(child: AllBlockDeal())),
             Visibility(
            visible: false,
            child: Flexible(child: BlockBuy())),
             Visibility(
            visible: false,
            child: Flexible(child: BlockSell())),
        ],
      ),
    );
  }
}

class all extends StatelessWidget {
  const all({
    Key? key, required this.text, required this.col, required this.textCol, required this.bordCol,
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