import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/core/network/dio_settings.dart';
import 'package:solar_system/data/repositories/get_list_of_planets.dart';
import 'package:solar_system/presentation/blocs/bloc/get_planets_bloc.dart';
import 'package:solar_system/presentation/pages/home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DioSettings>(create: (context) => DioSettings()),
        RepositoryProvider<GetAllPlanetsRepository>(
            create: (context) => GetAllPlanetsRepository(
                dio: RepositoryProvider.of<DioSettings>(context).dio))
      ],
      child: BlocProvider(
        create: (context) => GetPlanetsBloc(
            repository:
                RepositoryProvider.of<GetAllPlanetsRepository>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
