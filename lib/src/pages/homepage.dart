import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vehicledetails/src/pages/add_vehicle.dart';
import 'package:vehicledetails/src/pages/bike_screen.dart';
import 'package:vehicledetails/src/pages/car_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:const  Text("Vehicle Details",),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("Bike"),),
              Tab(child: Text("Car"),)
            ],
          ),
        ),
       body:const TabBarView(
         children: [
           BikeScreen(),
           CarScreen()
         ],

       ) ,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddVehicle()));
          },
          label:const  Text("Add Vehicle ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          icon:const  Icon(Icons.add_circle_outline_outlined),
          elevation:0.3 ,
        ),
      ),
    );
  }
}
