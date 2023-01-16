class WeatherAPI {
  WeatherAPI(this.apiKEY);

  final String apiKEY;

  //* HOW TO MAKE API CALL
  //* https://api.openweathermap.org/data/2.5/weather?q=London&appid={API key}

  static const String _baseURL = "api.openweathermap.org";
  static const String _apiPath = "";

  /// WEATHER ENDPOINT
  Uri weather(String city) => _buildURI(
        parametersBuilder: () => cityQueryParameters(city),
        endpoint: "weather",
      );

  /// FORECAST ENDPOINT
  Uri forecast(String city) => _buildURI(
        parametersBuilder: () => cityQueryParameters(city),
        endpoint: "forecast",
      );

  /// BUILD URI (UNIFORM RESOURCE IDENTIFIER)
  Uri _buildURI({
    required Map<String, dynamic> Function() parametersBuilder,
    required String endpoint,
  }) {
    return Uri(
      scheme: "https",
      host: _baseURL,
      path: "$_apiPath$endpoint",
      queryParameters: parametersBuilder(),
    );
  }

  /// Query Method / Parameters
  Map<String, dynamic> cityQueryParameters(String city) => {
        "q": city,
        "appid": apiKEY,
        "units": "metric",
      };
}
