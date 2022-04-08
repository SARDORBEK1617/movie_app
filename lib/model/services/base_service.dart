abstract class BaseService {
  final String apiKey = '?api_key=d8c23eac6c25c1e10788b33809f722e1&language=en-US&page=1';
  final String baseUrl = 'https://api.themoviedb.org/3/movie';

  Future<dynamic> getResponse(String url);
}
