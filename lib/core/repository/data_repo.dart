import 'package:dio/dio.dart';
import '../models/request_model.dart';

class MyDataRepository {
  static final Dio _dio = Dio();

  Future<MyRequestItemsModel?> postData(MyRequestItemsModel data) async {
    try {
      final response = await _dio.post(
        'https://food-data-model.onrender.com/predict',
        data: data.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MyRequestItemsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to create data: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception('API error: ${e.message}');
    }
  }
}