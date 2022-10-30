// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/size_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryMap extends StatelessWidget {
   DeliveryMap({Key? key}) : super(key: key);

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(128),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Align(
            alignment: Alignment.bottomRight,
            heightFactor: 0.3,
            widthFactor: 2.5,
            child: GoogleMap(
              myLocationButtonEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
        ),
      ),
    );
  }
}


