class PostModel {
  int id = 0;
  String name = '';
  String? title;
  String image = '';
  bool isOnline = false;
  bool isLike = false;
  DateTime? createTime;

  PostModel(this.id, this.name, this.title, this.image, this.isOnline, this.isLike,
      this.createTime);
}
