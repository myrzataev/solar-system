part of 'get_planets_bloc.dart';

@immutable
sealed class GetPlanetsState {}

final class GetPlanetsInitial extends GetPlanetsState {}

final class GetPlanetsLoading extends GetPlanetsState {}

final class GetPlanetsSuccess extends GetPlanetsState {
  List<Bodies> model;
  GetPlanetsSuccess({required this.model,});
}

final class GetPlanetsError extends GetPlanetsState {
  String errorText;
  GetPlanetsError({required this.errorText});
}
