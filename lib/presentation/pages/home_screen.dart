import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/presentation/blocs/bloc/get_planets_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetPlanetsBloc>(context).add(GetLisOfPlanetsEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Solar system",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<GetPlanetsBloc, GetPlanetsState>(
          listener: (context, state) {
        if (state is GetPlanetsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorText),
            ),
          );
        }
      }, builder: (context, state) {
        if (state is GetPlanetsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetPlanetsSuccess) {
          return Center(
            child: Column(children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<GetPlanetsBloc>(context)
                              .add(GetLisOfMoonsEvent());
                        },
                        child: Text("Moon")),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<GetPlanetsBloc>(context)
                              .add(GetListOfAsteroidEvent());
                        },
                        child: Text("Asteroids")),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<GetPlanetsBloc>(context)
                              .add(GetListOfDwarfPlanetEvent());
                        },
                        child: Text("Dwarf Planet")),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<GetPlanetsBloc>(context)
                              .add(GetListOfCometEvent());
                        },
                        child: Text("Comet")),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: state.model.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(7),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey[600]),
                              child: ListTile(
                                title:
                                    Text(state.model[index].englishName ?? ""),
                                subtitle: Text(
                                    "Discovered by: ${state.model[index].discoveredBy}\n in: ${state.model[index].discoveryDate}"),
                              ),
                            ));
                      }))
            ]),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
