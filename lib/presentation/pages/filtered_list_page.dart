import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/presentation/blocs/bloc/get_planets_bloc.dart';

class FilteredListScreeen extends StatelessWidget {
  const FilteredListScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          "Planets",
          style: TextStyle(fontSize: 30),
        ),
        BlocConsumer<GetPlanetsBloc, GetPlanetsState>(
            listener: (context, state) {},
            builder: (context, state) {
              
              return SizedBox();
            })
      ]),
    );
  }
}
