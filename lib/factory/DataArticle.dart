class DataArticle {
  var raw;
  var data;
  var source;
  var author;
  var title;
  var description;
  var content;
  var url;
  var urlToImage;
  var publishedAt;

  @override
  DataArticle(
      {this.raw, this.source, this.author, this.description, this.publishedAt, this.title, this.url, this.urlToImage, this.content});

  factory DataArticle.fromJson(Map<String, dynamic> json) =>
      _dataArticleToJson(json);
}

DataArticle _dataArticleToJson(Map<String, dynamic> json) {
  return DataArticle(
    raw: json,
    source: json['source']['name'] as String,
    author: json['author'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    content: json['content'] as String,
    url: json['url'] as String,
    urlToImage: json['urlToImage'] as String,
    publishedAt: json['publishedAt'] as String,
  );
}