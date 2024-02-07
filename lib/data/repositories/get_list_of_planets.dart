import 'package:dio/dio.dart';
import 'package:solar_system/data/models/solar_system_model.dart';

class GetAllPlanetsRepository {
  static List<Bodies> nonPlanets = [];
  Dio dio;
  Future<SolarModel> getAllPlanets() async {
    Response response =
        await dio.get("https://api.le-systeme-solaire.net/rest/bodies/");
    var result = SolarModel.fromJson(response.data);

    return result;
  }

  List<Bodies> separatePlanets(SolarModel solarData) {
    List<Bodies> isPlanet = [];
    solarData.bodies?.forEach((body) {
      if (body.isPlanet == true) {
        isPlanet.add(body);
      }
    });

    return isPlanet;
  }

  List<Bodies> separateNonPlanets(SolarModel solarData) {
    List<Bodies> isPlanet = [];
    solarData.bodies?.forEach((body) {
      if (body.isPlanet == false) {
        isPlanet.add(body);
      }
    });

    return isPlanet;
  }

  GetAllPlanetsRepository({required this.dio});
}
