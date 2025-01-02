class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> obj) {
    return NewsModel(
      author: obj['author'].toString(),
      title: obj['title'].toString(),
      description: obj['description'].toString(),
      url: obj['url'].toString(),
      urlToImage: obj['urlToImage'].toString(),
      publishedAt: obj['publishedAt'].toString(),
      content: obj['content'].toString(),
    );
  }
}
