/// backdrop_path : "/7q448EVOnuE3gVAx24krzO7SNXM.jpg"
/// first_air_date : "2021-09-03"
/// genre_ids : [10764]
/// id : 130392
/// name : "The D'Amelio Show"
/// origin_country : ["US"]
/// original_language : "en"
/// original_name : "The D'Amelio Show"
/// overview : "From relative obscurity and a seemingly normal life, to overnight success and thrust into the Hollywood limelight overnight, the D’Amelios are faced with new challenges and opportunities they could not have imagined."
/// popularity : 19.535
/// poster_path : "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg"
/// vote_average : 9.4
/// vote_count : 2639

class Results {
  Results({
      this.backdropPath, 
      this.firstAirDate, 
      this.genreIds, 
      this.id, 
      this.name, 
      this.originCountry, 
      this.originalLanguage, 
      this.originalName, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.voteAverage, 
      this.voteCount,});

  Results.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    name = json['name'];
    originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  String? backdropPath;
  String? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  dynamic? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['first_air_date'] = firstAirDate;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['name'] = name;
    map['origin_country'] = originCountry;
    map['original_language'] = originalLanguage;
    map['original_name'] = originalName;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}