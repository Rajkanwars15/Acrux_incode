import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Divider.dart';
class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( 
        children: [
        GoogleMap(
          onMapCreated: (controller) {
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(45.521563, -122.677433),
          zoom: 10.0,
        ),
      ),
      Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 0.0,
        child: Container(
          height: 320.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const SizedBox(height: 6.0,),
              const Text("Hi there, ", style: TextStyle(fontSize: 10.0),),
              const Text("Where to? ", style: TextStyle(fontSize: 20.0, fontFamily: "Brand-Bold"),),
              const SizedBox(height: 6.0,),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.blueAccent,),
                  SizedBox(width: 10.0,),
                  Text("Search Drop Off"),
                  ]),
                  ),
                  const SizedBox(height: 24.0,),
                  DividerWidget(),
                  const SizedBox(height: 16.0,),
                  Row(children: [
                    const Icon(Icons.home, color: Colors.grey,),
                    const SizedBox(width: 12.0,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add home"),
                        SizedBox(height: 4.0,),
                        Text("Your living address", style: TextStyle(color: Colors.black54, fontSize: 12.0,))
                      ],
                    ),
                    const SizedBox(width: 12.0,),
                    DividerWidget(),
                    const SizedBox(width: 12.0,),                    
                    const Icon(Icons.work, color: Colors.grey,),
                    const SizedBox(width: 12.0,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add work"),
                        SizedBox(height: 4.0,),
                        Text("Your office address", style: TextStyle(color: Colors.black54, fontSize: 12.0,))
                      ],
                    ),
                  ],),
                  
            ]),
          ),
        ),
        )]
    )
    );
  }
}
