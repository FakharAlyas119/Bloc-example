class PostDetialModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostDetialModel({this.userId, this.id, this.title, this.body});

  PostDetialModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
