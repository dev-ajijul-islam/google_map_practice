import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
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
        ),
      ),
    );
  }
}
