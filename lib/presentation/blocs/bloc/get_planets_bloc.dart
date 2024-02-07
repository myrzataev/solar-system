import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:solar_system/data/models/solar_system_model.dart';
import 'package:solar_system/data/repositories/get_list_of_planets.dart';

part 'get_planets_event.dart';
part 'get_planets_state.dart';

class GetPlanetsBloc extends Bloc<GetPlanetsEvent, GetPlanetsState> {
  GetAllPlanetsRepository repository;

  GetPlanetsBloc({required this.repository}) : super(GetPlanetsInitial()) {
    on<GetPlanetsEvent>((event, emit) async {
      emit(GetPlanetsLoading());
      try {
        final SolarModel model = await repository.getAllPlanets();

        final List<Bodies> planet =
            model.bodies!.where((element) => element.isPlanet == true).toList();
        emit(GetPlanetsSuccess(
          model: planet,
        ));
      } catch (e) {
        emit(GetPlanetsError(errorText: e.toString()));
      }
    });

    on<GetLisOfMoonsEvent>((event, emit) async {
      emit(GetPlanetsLoading());
      try {
        final model = await repository.getAllPlanets();

        final SolarModel = repository.separatePlanets(model);
        final List<Bodies> moons = model.bodies!
            .where((element) => element.bodyType == "Moon")
            .toList();
        emit(GetPlanetsSuccess(
          model: moons,
        ));
      } catch (e) {
        emit(GetPlanetsError(errorText: e.toString()));
      }
    });
    on<GetListOfAsteroidEvent>((event, emit) async {
      emit(GetPlanetsLoading());
      try {
        final model = await repository.getAllPlanets();

        final SolarModel = repository.separatePlanets(model);
        final List<Bodies> asteroids = model.bodies!
            .where((element) => element.bodyType == "Asteroid")
            .toList();
        emit(GetPlanetsSuccess(
          model: asteroids,
        ));
      } catch (e) {
        emit(GetPlanetsError(errorText: e.toString()));
      }
    });
    on<GetListOfDwarfPlanetEvent>((event, emit) async {
      emit(GetPlanetsLoading());
      try {
        final dwarfPlanet = await repository.getAllPlanets();

        final SolarModel = repository.separatePlanets(dwarfPlanet);
        final List<Bodies> asteroids = dwarfPlanet.bodies!
            .where((element) => element.bodyType == "Dwarf Planet")
            .toList();
        emit(GetPlanetsSuccess(
          model: asteroids,
        ));
      } catch (e) {
        emit(GetPlanetsError(errorText: e.toString()));
      }
    }
    );
      on<GetListOfCometEvent>((event, emit) async {
      emit(GetPlanetsLoading());
      try {
        final comets = await repository.getAllPlanets();

        final SolarModel = repository.separatePlanets(comets);
        final List<Bodies> asteroids = comets.bodies!
            .where((element) => element.bodyType == "Comets")
            .toList();
        emit(GetPlanetsSuccess(
          model: asteroids,
        ));
      } catch (e) {
        emit(GetPlanetsError(errorText: e.toString()));
      }
    }
    );
  }
}
