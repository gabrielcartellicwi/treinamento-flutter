import 'package:dio/dio.dart';
import 'package:exercicio_10/models/brand.model.dart';
import 'package:exercicio_10/models/detail.model.dart';
import 'package:exercicio_10/models/model.model.dart';
import 'package:exercicio_10/models/vehicle.model.dart';

class FipeService {
  static Future<List<Brand>> getBrands(String type) async {
    Map<String, String> types = {
      'Cars': 'carro',
      'Motorcycles': 'motos',
      'Trucks': 'caminhoes',
    };

    Dio dio = Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    Response response = await dio.get('${types[type]}/marcas.json');

    final dynamic data = response.data;

    List<Brand> brandsList = <Brand>[];

    data.forEach((value) {
      if (value is Map) {
        Brand brandItem = Brand.fromJson(value);
        brandsList.add(brandItem);
      }
    });

    return brandsList;
  }

  static Future<List<Vehicle>> getVehicles(String type, int id) async {
    Map<String, String> types = {
      'Cars': 'carro',
      'Motorcycles': 'motos',
      'Trucks': 'caminhoes',
    };

    Dio dio = Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    Response response = await dio.get('${types[type]}/veiculos/$id.json');

    final dynamic data = response.data;

    List<Vehicle> vehicleList = <Vehicle>[];

    data.forEach((value) {
      if (value is Map) {
        Vehicle vehicleItem = Vehicle.fromJson(value);
        vehicleList.add(vehicleItem);
      }
    });

    return vehicleList;
  }

  static Future<List<Model>> getModels(
      String type, dynamic id, dynamic key) async {
    Map<String, String> types = {
      'Cars': 'carro',
      'Motorcycles': 'motos',
      'Trucks': 'caminhoes',
    };

    Dio dio = Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    Response response = await dio.get('${types[type]}/veiculo/$id/$key.json');

    final dynamic data = response.data;

    List<Model> modelList = <Model>[];

    data.forEach((value) {
      if (value is Map) {
        Model modelItem = Model.fromJson(value);
        modelList.add(modelItem);
      }
    });

    return modelList;
  }

  static Future<Detail> getDetail(
      String type, dynamic id, dynamic key, dynamic info) async {
    Map<String, String> types = {
      'Cars': 'carro',
      'Motorcycles': 'motos',
      'Trucks': 'caminhoes',
    };

    Dio dio = Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    Response response =
        await dio.get('${types[type]}/veiculo/$id/$key/$info.json');

    final dynamic data = response.data;

    Detail detail = Detail.fromJson(data);

    return detail;
  }
}
