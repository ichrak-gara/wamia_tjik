import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:signin_signup/location_controller.dart';

import '../const/colors.dart';

class MapScreen extends StatefulWidget {
  static const routeName = "/mapScreen";

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late CameraPosition _cameraPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraPosition =
        CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 17);
  }

  late GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps', style: TextStyle(fontSize: 18),),
          backgroundColor: AppColor.red,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
                onMapCreated: (GoogleMapController mapController) {
                  _mapController = mapController;
                },
                initialCameraPosition: _cameraPosition),
            Positioned(
              top: 20,
                left: 19,
                right: 20,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children:<Widget> [
                        Icon(Icons.location_on, size: 25, color: AppColor.red,),
                        SizedBox(width: 5),
                        Expanded(
                            child: Text(
                              '${locationController.pickPlaceMark.name ?? ''}'
                                  '${locationController.pickPlaceMark.locality ?? ''}'
                                  '${locationController.pickPlaceMark.postalCode ?? ''}'
                                  '${locationController.pickPlaceMark.country ?? ''}',
                              style: TextStyle(fontSize: 20),
                              maxLines: 1, overflow: TextOverflow.ellipsis,
                        )),
                        SizedBox(width: 10,),
                        Icon(Icons.search, size: 25, color: Theme.of(context).textTheme.bodyText1!.color),
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      );
    });
  }
}











