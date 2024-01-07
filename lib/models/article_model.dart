class ArticleModel {
  final Source? source;
  final String? image;
  final String? title;
  final String? subTitle;
  final String? url;

  ArticleModel(
      {required this.source,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.url});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
      url: json['url'],
    );
  }
}

class Source {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
