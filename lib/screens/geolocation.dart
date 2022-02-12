import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class geolocationPage extends StatefulWidget {
  const geolocationPage({Key? key}) : super(key: key);

  @override
  _geolocationPageState createState() => _geolocationPageState();
}

class _geolocationPageState extends State<geolocationPage> {
  
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers={};
   int _selectedIndex = 0;
 
 
  void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){
 
      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
       });
  }
 
  @override
  void initState(){
    super.initState();
    setState(() {
      getLocation();
    });
  }
 void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition:CameraPosition(
            target: LatLng(48.8561, 2.2930),
            zoom: 12.0,
          ),
          onMapCreated: (GoogleMapController controller){
            _controller = controller;
          },
          markers: _markers,
        ) ,


        
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Resturants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[400],
        onTap: _onItemTapped,
      ),

      

      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching,color: Colors.white,),
        onPressed: (){
          getLocation();
        },
      ),


      
    );
  }
}
