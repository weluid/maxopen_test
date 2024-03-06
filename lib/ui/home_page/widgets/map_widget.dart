import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maxopen_test/ui/global_widgets/title_and_subtitle.dart';
import 'package:maxopen_test/utils/extentions.dart';

class MapWidget extends StatefulWidget {
  final Position? position;
  final bool internetConnection;

  const MapWidget({super.key, this.position, this.internetConnection = true});

  @override
  State<StatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  late LatLng sourceLocation;
  late String _darkMapStyle;

  @override
  void initState() {
    super.initState();
    if (widget.position != null) {
      sourceLocation = LatLng(
        widget.position!.latitude,
        widget.position!.longitude,
      );
    } else {
      sourceLocation = const LatLng(37.42796133580664, -122.085749655962);
    }

    _loadMapStyles();
  }

  Future _loadMapStyles() async {
    _darkMapStyle =
        await rootBundle.loadString('assets/map_style/dark_mode.json');
  }

  Future _setMapStyle() async {
    final controller = await _controller.future;

    controller.setMapStyle(_darkMapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 44,
      height: MediaQuery.of(context).size.width - 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(55),
        child: Stack(
          children: [
            GoogleMap(
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                zoomControlsEnabled: false,
                rotateGesturesEnabled: false,
                initialCameraPosition:
                    CameraPosition(target: sourceLocation, zoom: 15),
                markers: {
                  Marker(
                    markerId: const MarkerId("sourse"),
                    position: sourceLocation,
                  ),
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  _setMapStyle();
                }),
            widget.position == null || widget.internetConnection
                ? _errorMessage()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: context.colors.buttonDisable,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                "assets/images/home_page/wifi.svg",
              ),
            ),
          ),
          const SizedBox(height: 24),
          const TitleAndSubtitle(
            title: "Відсутній зв'язок",
            subtitle: "Відсутність доступу до геолокації.\n"
                "Переконайтеся, що у додатку увімкнено геолокацію та "
                "перевірте з'єднання з Інтернетом.",
          ),
        ],
      ),
    );
  }
}
