/// maximum : "2022-02-19"
/// minimum : "2022-01-02"

class Dates {
  Dates({
      this.maximum, 
      this.minimum,});

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
  String? maximum;
  String? minimum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }

}