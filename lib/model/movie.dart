class Autogenerated {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  Autogenerated({this.status, this.totalResults, this.articles});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles =  <Articles>[];
      json['articles'].forEach((v) {
        articles?.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      { this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source?.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}





// class Movie {
//   bool? adult;
//   String? backdropPath;
//   List<int>? genreIds;
//   int? id;
//   String? originalLanguage;
//   String?  originalTitle;
//   String? overview;
//   num? popularity;
//   String? posterPath;
//   String? releaseDate;
//   String? title;
//   bool? video;
//   num? voteAverage;
//   int? voteCount;
//
//   Movie(
//       {this.adult,
//       this.backdropPath,
//       this.genreIds,
//       this.id,
//       this.originalLanguage,
//       this.originalTitle,
//       this.overview,
//       this.popularity,
//       this.posterPath,
//       this.releaseDate,
//       this.title,
//       this.video,
//       this.voteAverage,
//       this.voteCount});
//
//   Movie.fromJson(Map<String, dynamic> json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     genreIds = json['genre_ids'].cast<int>();
//     id = json['id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     releaseDate = json['release_date'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['adult'] = adult;
//     data['backdrop_path'] = this.backdropPath;
//     data['genre_ids'] = this.genreIds;
//     data['id'] = this.id;
//     data['original_language'] = this.originalLanguage;
//     data['original_title'] = this.originalTitle;
//     data['overview'] = this.overview;
//     data['popularity'] = this.popularity;
//     data['poster_path'] = this.posterPath;
//     data['release_date'] = this.releaseDate;
//     data['title'] = this.title;
//     data['video'] = this.video;
//     data['vote_average'] = this.voteAverage;
//     data['vote_count'] = this.voteCount;
//     return data;
//   }
// }