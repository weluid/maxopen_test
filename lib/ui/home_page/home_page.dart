import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maxopen_test/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:maxopen_test/ui/home_page/home_page_view.dart';

/// Home page with bloc builder logic
class HomePage extends StatefulWidget {
  final Position? position;

  const HomePage({
    super.key,
    this.position,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomePageBloc>(context).add(
      GetPositionValuesEvent(
        position: widget.position,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is InitialStateWithPosition) {
          return HomePageView(
           position: widget.position,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
