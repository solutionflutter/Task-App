class Data {
  int? id;
  String? caption;
  String? videoUrl;
  String? createdAt;

  Data({this.id, this.caption, this.videoUrl, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    videoUrl = json['video_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['video_url'] = this.videoUrl;
    data['created_at'] = this.createdAt;
    return data;
  }
}