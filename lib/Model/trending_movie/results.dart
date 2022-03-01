/// original_title : "Texas Chainsaw Massacre"
/// poster_path : "/meRIRfADEGVo65xgPO6eZvJ0CRG.jpg"
/// video : false
/// vote_average : 5.3
/// id : 632727
/// overview : "After nearly 50 years of hiding, Leatherface returns to terrorize a group of idealistic young friends who accidentally disrupt his carefully shielded world in a remote Texas town."
/// release_date : "2022-02-18"
/// adult : false
/// backdrop_path : "/aTSA5zMWlVFTYBIZxTCMbLkfOtb.jpg"
/// vote_count : 241
/// genre_ids : [27]
/// title : "Texas Chainsaw Massacre"
/// original_language : "en"
/// popularity : 225.791
/// media_type : "movie"

class Results {
  Results({
      this.originalTitle, 
      this.posterPath, 
      this.video, 
      this.voteAverage, 
      this.id, 
      this.overview, 
      this.releaseDate, 
      this.adult, 
      this.backdropPath, 
      this.voteCount, 
      this.genreIds, 
      this.title, 
      this.originalLanguage, 
      this.popularity, 
      this.mediaType,});

  Results.fromJson(dynamic json) {
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    video = json['video'];
    voteAverage = json['vote_average'];
    id = json['id'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    voteCount = json['vote_count'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    title = json['title'];
    originalLanguage = json['original_language'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }
  String? originalTitle;
  String? posterPath;
  bool? video;
  double? voteAverage;
  int? id;
  String? overview;
  String? releaseDate;
  bool? adult;
  String? backdropPath;
  int? voteCount;
  List<int>? genreIds;
  String? title;
  String? originalLanguage;
  double? popularity;
  String? mediaType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['original_title'] = originalTitle;
    map['poster_path'] = posterPath;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['id'] = id;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['vote_count'] = voteCount;
    map['genre_ids'] = genreIds;
    map['title'] = title;
    map['original_language'] = originalLanguage;
    map['popularity'] = popularity;
    map['media_type'] = mediaType;
    return map;
  }

}