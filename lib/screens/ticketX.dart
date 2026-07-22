import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';

class ticketX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // app starts
            children: [
              //header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: const Text(
                      "Tickets",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 30),


//first ticket
              Container(
                height: 450, width: 300,
                decoration: BoxDecoration(
                  // border: Border.all(style: BorderStyle.solid, color: const Color.fromARGB(255, 40, 103, 42)),
                  color: const Color.fromARGB(255, 230, 255, 190),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(160, 76, 175, 79),
                      blurRadius: 10,
                      offset: Offset(0, 5)

                    )
                  ]

                
                ),


                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Icon(Icons.qr_code_rounded, size: 100,color: const Color.fromARGB(255, 9, 61, 11),),
                        )
                      ],


                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("3-DAYS-PASS", style: TextStyle(color: const Color.fromARGB(255, 34, 87, 36)),),
                        )
                      ],


                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("ACTIVE", style: TextStyle(color: const Color.fromARGB(255, 34, 87, 36)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 10),
                          child: Icon(Icons.check_circle, color: Colors.green,),
                        ),
                        
                      ],


                    )
                  ],
                ),
              )
            ],
          ),
        )


      ),
    );
  }
}
