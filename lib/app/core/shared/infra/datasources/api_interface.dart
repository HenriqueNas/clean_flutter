abstract class ApiInterface {
  Future get(
    String url, {
    Map<String, String>? headers,
  });

  Future post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  });

  Future put(
    String url, {
    Map<String, String>? headers,
    Object? body,
  });

  Future delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
  });
}
