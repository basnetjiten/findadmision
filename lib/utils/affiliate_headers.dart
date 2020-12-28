class AffiliateHeaders {


  static Map<String, String> authHeaders(String accessToken) {
    return {
      'Accept': 'application/json',
      "Content-Authentication": '$accessToken',
      'Content-type': 'application/json'

    };
  }
}
