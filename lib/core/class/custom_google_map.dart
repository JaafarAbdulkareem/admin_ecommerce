import 'dart:math';

import 'package:admin_ecommerce/core/constant/app_color.dart';
import 'package:admin_ecommerce/core/constant/app_images.dart';
import 'package:admin_ecommerce/core/constant/constant_api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/data/models/order/detail_order/detail_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap {
  PolylinePoints polylinePoints = PolylinePoints();
  final LatLng latLngSource = const LatLng(
    ConstantScale.latitudeStore,
    ConstantScale.longitudeStore,
  );

  LatLng? latLngDestination;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  LatLngBounds? bounds;

  void mapCameraPosition({
    required DetailOrderModel detailOrderData,
    required VoidCallback refresh,
  }) async {
    if (detailOrderData.addressId != null) {
      markers.add(
        Marker(
          icon: AssetMapBitmap(
            AppImages.imagesStore,
            width: 40,
            height: 40,
          ),
          markerId: const MarkerId(ConstantKey.idStoreLocation),
          position: latLngSource,
        ),
      );

      latLngDestination = LatLng(
        detailOrderData.address!.latitude,
        detailOrderData.address!.longitude,
      );
      markers.add(
        Marker(
          icon: AssetMapBitmap(
            AppImages.imagesCustomerHome,
            width: 40,
            height: 40,
          ),
          markerId: const MarkerId(ConstantKey.idUserLocation),
          position: latLngDestination!,
        ),
      );

      await getRoutePolyline();
      refresh();
    }
  }

  Future<void> getRoutePolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: ConstantApiKey.apiKeyDirection,
      request: PolylineRequest(
        origin: PointLatLng(latLngSource.latitude, latLngSource.longitude),
        destination: PointLatLng(
            latLngDestination!.latitude, latLngDestination!.longitude),
        mode: TravelMode.walking,
      ),
    );

    bounds = selectBoundlePolyline(result.points);

    if (result.points.isNotEmpty) {
      polylineCoordinates.clear();
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      polylines.add(
        Polyline(
          polylineId: const PolylineId("route"),
          color: AppColor.primary,
          width: 4,
          points: polylineCoordinates,
        ),
      );
    } else {
      debugPrint("********{No polyline points found}*******"
          "********{custom Google Map file in class}*******");
    }
  }

  LatLngBounds selectBoundlePolyline(List<PointLatLng> points) {
    double southwestLatitude = points.first.latitude;
    double southwestLongitude = points.first.longitude;
    double northeastLatitude = points.first.latitude;
    double northeastLongitude = points.first.longitude;
    for (var element in points) {
      southwestLatitude = min(southwestLatitude, element.latitude);
      southwestLongitude = min(southwestLongitude, element.longitude);
      northeastLatitude = max(northeastLatitude, element.latitude);
      northeastLongitude = max(northeastLongitude, element.longitude);
    }
    return LatLngBounds(
      /*minimum point*/
      southwest: LatLng(
        southwestLatitude,
        southwestLongitude,
      ),
      /*maximum point */
      northeast: LatLng(
        northeastLatitude,
        northeastLongitude,
      ),
    );
  }
}
