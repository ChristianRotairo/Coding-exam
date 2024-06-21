
// Model to fetch the data, our class will be used to fetch the data
class FetchData {
  final String randomString;

  FetchData({
    required this.randomString,
  });

  factory FetchData.fromJson(Map<String, dynamic> json) {
    return FetchData(
      randomString: json['randomString'] as String,
    );
  }
}
