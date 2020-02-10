class DataArticle {
  var data;
  var source;
  var author;
  var title;
  var description;
  var url;
  var urlToImage;
  var publishedAt;

  @override
  DataArticle(
      {this.source, this.author, this.description, this.publishedAt, this.title, this.url, this.urlToImage});

  factory DataArticle.fromJson(Map<String, dynamic> json) =>
      _dataArticleToJson(json);
}

DataArticle _dataArticleToJson(Map<String, dynamic> json) {
  return DataArticle(
    source: json['source']['name'] as String,
    author: json['author'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    urlToImage: json['urlToImage'] as String,
    publishedAt: json['publishedAt'] as String,
  );
}