import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:renti_user/utils/app_colors.dart';
class CarDetailsMapSection extends StatefulWidget {
  const CarDetailsMapSection({super.key});

  @override
  State<CarDetailsMapSection> createState() => _CarDetailsMapSectionState();
}

class _CarDetailsMapSectionState extends State<CarDetailsMapSection> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();



  Location location = new Location();

  bool ?_serviceEnabled;
  PermissionStatus ?_permissionGranted;
  LocationData ?_locationData ;

  getLocation()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    setState(() {
    });
    print(_locationData);
  }


  @override
  void initState() {
    getLocation();

    super.initState();
  }
  final Set<Marker> markers =  {};
  addMarker (){
    setState(() {
      markers.add(
        Marker(markerId: const MarkerId("current-location"),
            position: LatLng(_locationData!.latitude!.toDouble(), _locationData!.longitude!.toDouble()),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: const InfoWindow(
                title: "renti app"
            )

        ),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: AppColors.whiteLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),

      ),

      child: _locationData!=null? SizedBox(
        height: 200,
        child: GoogleMap(
          zoomControlsEnabled: true,
          zoomGesturesEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target:LatLng(_locationData!.latitude!.toDouble(), _locationData!.longitude!.toDouble()),
            // 23.764211402055338, 90.42693159752628
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            addMarker();
          },
          markers: markers,
        ),
      ):const Center(child: CircularProgressIndicator(),),
      // child: const CustomImage(
      //   imageSrc: AppImages.mapLocationCar,
      //   imageType: ImageType.png,
      // ),
    );
  }
}
