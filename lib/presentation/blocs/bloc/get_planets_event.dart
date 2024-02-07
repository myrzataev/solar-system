part of 'get_planets_bloc.dart';

@immutable
sealed class GetPlanetsEvent {}

class GetLisOfPlanetsEvent extends GetPlanetsEvent {}

class GetLisOfMoonsEvent extends GetPlanetsEvent {}

class GetListOfAsteroidEvent extends GetPlanetsEvent {}

class GetListOfDwarfPlanetEvent extends GetPlanetsEvent {}

class GetListOfCometEvent extends GetPlanetsEvent {}
