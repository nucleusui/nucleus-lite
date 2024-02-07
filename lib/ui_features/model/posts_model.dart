import 'dart:convert';

List<Posts> postsFromJson(String str) =>
    List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String? icon;
  String? title;
  String? imgThumb;
  String? organization;
  String? time;
  String? authors;
  String? head;
  String? desc;
  String? content;

  Posts({
    this.icon,
    this.title,
    this.imgThumb,
    this.organization,
    this.time,
    this.authors,
    this.head,
    this.desc,
    this.content,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        icon: json["icon"],
        title: json["title"],
        imgThumb: json["imgThumb"],
        organization: json["organization"],
        time: json["time"],
        authors: json["authors"],
        head: json["head"],
        desc: json["desc"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "imgThumb": imgThumb,
        "organization": organization,
        "time": time,
        "authors": authors,
        "head": head,
        "desc": desc,
        "content": content,
      };
}
