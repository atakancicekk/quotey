class Quote {
  String sId;
  List<String> tags;
  String author;
  String content;
  String authorSlug;
  int length;

  Quote(
      {this.sId,
      this.tags,
      this.author,
      this.content,
      this.authorSlug,
      this.length});

  Quote.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tags = json['tags'].cast<String>();
    author = json['author'];
    content = json['content'];
    authorSlug = json['authorSlug'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tags'] = this.tags;
    data['author'] = this.author;
    data['content'] = this.content;
    data['authorSlug'] = this.authorSlug;
    data['length'] = this.length;
    return data;
  }
}
