class PostRequest {

  final status;
  final totalResults;
  final articles;

  PostRequest({this.status, this.totalResults, this.articles});

  factory PostRequest.fromJson(Map<String, dynamic> json) {
    return PostRequest(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles']
    );
  }
}