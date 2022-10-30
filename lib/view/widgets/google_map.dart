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
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
      ),
      child: Container(
        height: getProportionateScreenHeight(128),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50)
        ),
        child: GoogleMap(
          myLocationButtonEnabled: false,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
