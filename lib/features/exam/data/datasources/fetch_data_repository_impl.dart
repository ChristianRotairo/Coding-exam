import 'package:dio/dio.dart';
import 'package:coding_exam/features/exam/data/models/get_model.dart';
import 'package:coding_exam/features/exam/data/repositories/fetch_data_repository.dart';

class FetchDataRepositoryImpl implements FetchDataRepository {
  final Dio dio = Dio(); 
  final String apiurl = 'https://o7q6ka26qs232rmbtpbrxghy6u0vyrup.lambda-url.ap-southeast-1.on.aws/';

  @override
  Future<List<FetchData>> fetchData() async {
    try {
      final response = await dio.get(apiurl);
      // Check status if 200 then success
      // Else throw an exception
      if (response.statusCode == 200) {
        // Parse the single object response
        Map<String, dynamic> data = response.data;
        // Create a single FetchData object and return it as a list
        return [FetchData.fromJson(data)];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}