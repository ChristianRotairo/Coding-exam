import 'package:flutter/foundation.dart';
import 'package:coding_exam/features/exam/data/models/get_model.dart';
import 'package:coding_exam/features/exam/data/repositories/fetch_data_repository.dart';

// FetchDataProvider manages the state of fetching data and notifies listeners of changes
class FetchDataProvider extends ChangeNotifier {
  // Repository used to fetch data
  final FetchDataRepository repository;
  
  // Constructor requiring a repository to be injected
  FetchDataProvider({required this.repository});

  List<FetchData> _data = []; // Stores the fetched data
  bool _isLoading = false;    // Indicates if data is currently being fetched
  String? _error;             // Holds any error message if fetch fails

  // Getters to access the private state variables
  List<FetchData> get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Method to fetch data from the repository
  Future<void> fetchData() async {
    // Set loading to true and clear any previous errors
    _isLoading = true;
    _error = null;
    // Notify listeners to rebuild UI
    notifyListeners();

    try {
      // Attempt to fetch data from the repository
      _data = await repository.fetchData();
    } catch (e) {
      // If an error occurs, store the error message
      _error = e.toString();
    } finally {
      // Whether successful or not, we're no longer loading
      _isLoading = false;
      // Notify listeners to rebuild UI with new state
      notifyListeners();
    }
  }
}