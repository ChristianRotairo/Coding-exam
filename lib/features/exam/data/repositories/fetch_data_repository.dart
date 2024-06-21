import 'dart:async';
import 'package:coding_exam/features/exam/data/models/get_model.dart';

// Interface for getting the data
abstract class FetchDataRepository{
  Future<List<FetchData>> fetchData();
}