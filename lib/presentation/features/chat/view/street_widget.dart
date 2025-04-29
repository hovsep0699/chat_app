
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';


class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key, this.center, this.markerIconUrl, this.initialZoom = 10, this.markerHeight, this.markerWidth, this.markerLocations = const []});

  final LatLng? center;
  final String? markerIconUrl;
  final double? markerWidth;
  final double? markerHeight;
  final List<LatLng> markerLocations;
  final double initialZoom;
  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {

  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
  }

  String mapStyle = jsonEncode([
    {
      'elementType': 'geometry.fill',
      'stylers': [
        {
          'color': '#ffffff'
        }
      ]
    },
    {
      'elementType': 'labels.icon',
      'stylers': [
        {
          'color': '#7f172bd7'
        }
      ]
    },
    {
      'elementType': "labels.text",
      "stylers": [
        {
          "color": "#3b27d3"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#ffffff"
        }
      ]
    },
    {
      "featureType": "landscape.man_made",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "color": "#f4f0f0"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "color": "#d6d6d6"
        }
      ]
    }
  ]);


  // Custom Style JSON (as String)

  Future<service.Uint8List?> getBytes() async {
    print("MSSS::: $mapStyle");
    if (widget.markerIconUrl == null) {
      return null;
    }
    final service.ByteData data =
        await service.NetworkAssetBundle(Uri.parse(widget.markerIconUrl!))
            .load('');
    return data.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Google Map')),
      body: FutureBuilder(
        future: getBytes(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            zoomControlsEnabled: false,
            compassEnabled: false,
            style: mapStyle,
            initialCameraPosition: CameraPosition(
              target: widget.center!,
              zoom: widget.initialZoom,
            ),
            markers: widget.markerLocations.map((e) =>
              Marker(
                markerId: MarkerId(uuid.v4()),
                position: e,
                icon: snapshot.data != null ? BitmapDescriptor.bytes(snapshot.data!,
                    width: widget.markerWidth, height: widget.markerHeight) : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), // Custom marker icon
              ),
          ).toSet());
        },
      ),
    );
  }
}
