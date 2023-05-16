import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/framework/network2/Git.dart';
import 'package:flutter_shop/utils/textfield_util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import 'package:geocoding/geocoding.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var latitude = 0.0;
  var longitude = 0.0;
  List<Placemark>? placemarks1;

  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _determinePosition().then((pos) async {
      latitude = pos.latitude;
      longitude = pos.longitude;

      print("=======" + latitude.toString() + "====" + longitude.toString());
      setState(() {});
      // var testLat = 32.00125010508044;
      // var testLng = 110.5635815486312;
      // var testLat = 37.539297;
      // var testLng = 126.371382;
      // placemarks1 = await placemarkFromCoordinates(testLat, testLng);
      // print("=======1==" +
      //     testLat.toString() +
      //     "===" +
      //     testLng.toString() +
      //     placemarks1.toString());
      // placemarks2 = await placemarkFromCoordinates(latitude, longitude);
      // print("=======2==" + placemarks2.toString());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("当前经纬度--lat--$latitude--long--$longitude"),
              Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black12)),
                    child: TextField(
                      controller: latController,
                      decoration:
                          TextFieldUtil.noStyleDecoration("lat", textSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: lngController,
                    decoration:
                        TextFieldUtil.noStyleDecoration("lng", textSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      var lat = latController.text;
                      var lng = lngController.text;

                      if (lat.isEmpty || lng.isEmpty) {
                        Fluttertoast.showToast(msg: "empty");
                        return;
                      }
                      // 传音地址解析，todo 连续请求会报错，不知道原因
                      Git.customDio.options.baseUrl =
                          "https://pfgateway.transsion.com:9199";
                      Map<String, dynamic> map = Map();
                      map["authority"] = "pfgateway.transsion.com:9199";
                      Git.customDio.options.headers = map;
                      Git(context).getTransferGeocoding(lat, lng).then((value) {
                        setState(() {
                          print("==");
                          print(value.toString());
                        });
                      });

                      // geocoding 解析
                      try {
                        placemarks1 = await placemarkFromCoordinates(
                            double.parse(lat), double.parse(lng));
                      } catch (e, stackTrace) {
                        print(e);
                        print("===========");
                        print(stackTrace);
                        Fluttertoast.showToast(msg: "" + e.toString());
                      }

                      setState(() {});
                    },
                    child: Text("解析成地址"))
              ]),
              Text("解析的地址是---${placemarks1.toString()}")
              // Text("placemarks2--${placemarks2.toString()}")
            ],
          ),
        ),
      ),
    );
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Fluttertoast.showToast(
      msg: "Location services are disabled.",
    );
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      Fluttertoast.showToast(
        msg: "Location permissions are denied",
      );
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    Fluttertoast.showToast(
      msg:
          "Location permissions are permanently denied, we cannot request permissions.",
    );
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
