class MyMovie {
  String? name;
  String? genre;
  int? year;
  String? imageUrl;

  MyMovie(this.name, this.genre, this.year, this.imageUrl);

  MyMovie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    genre = json['genre'];
    year = json['year'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['genre'] = this.genre;
    data['year'] = this.year;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
