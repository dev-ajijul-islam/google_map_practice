import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 16,
                target: LatLng(24.986351538907915, 89.30427610018491),
              ),
            ),
          );
        },
        child: Icon(Icons.home_filled),
      ),
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          buildingsEnabled: true,
          mapType: .normal,
          trafficEnabled: true,
          onLongPress: (argument) {
            Clipboard.setData(ClipboardData(text: argument.toString()));
          },
          initialCameraPosition: CameraPosition(
            zoom: 15,
            target: LatLng(24.983667198812167, 89.29759122143447),
          ),
          markers: <Marker>{
            Marker(
              markerId: MarkerId("my-home"),
              position: LatLng(24.982590138521207, 89.30112098687385),
              icon: .defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: MarkerId("my-home2"),
              position: LatLng(24.98359701178347, 89.29756702809529),
              icon: .defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),

            Marker(
              draggable: true,
              onDrag: (value) {
                print(value);
              },
              markerId: MarkerId("date-picker"),
              position: LatLng(25.02148048846167, 89.24601041118457),
              icon: .defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),
          },
          polylines: <Polyline>{
            Polyline(
              polylineId: PolylineId("my-polyline"),
              color: Colors.blue,
              width: 4,
              startCap: .roundCap,
              endCap: .roundCap,
              points: [
                LatLng(25.00933827447014, 89.31541768617166),
                LatLng(24.98359701178347, 89.29756702809529),
                LatLng(24.98138966299257, 89.30188569765563),
                LatLng(24.979532621792288, 89.31140466694094),
              ],
            ),
          },
          circles: {
            Circle(
              circleId: CircleId("my-circle"),
              center: LatLng(24.982590138521207, 89.30112098687385),
              radius: 500,
              strokeWidth: 2,
              fillColor: Colors.green.withAlpha(50),
              strokeColor: Colors.green,
            ),
            Circle(
              circleId: CircleId("my-circle2"),
              center: LatLng(24.979532621792288, 89.31140466694094),
              radius: 300,
              strokeWidth: 2,
              fillColor: Colors.red.withAlpha(50),
              strokeColor: Colors.red,
            ),
          },
          polygons: {
            Polygon(
              polygonId: PolygonId("my-polygon"),
              points: [
                LatLng(25.02148048846167, 89.24601041118457),
                LatLng(24.982446582559046, 89.22625779903805),
                LatLng(24.96147180499935, 89.26685554956848),
                LatLng(24.986351538907915, 89.30427610018491),
              ],
              fillColor: Colors.orangeAccent.withAlpha(50),
              strokeColor: Colors.orange,
              strokeWidth: 2,
            ),
          },
        ),
      ),
    );
  }
}
