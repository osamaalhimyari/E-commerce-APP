class CategoryModel {
  int? catId;
  String? catNameEn;
  String? catNameAr;
  String? catImage;
  String? catDatetime;
  String? catDescription;

  CategoryModel(
      {this.catId,
      this.catNameEn,
      this.catNameAr,
      this.catImage,
      this.catDatetime,
      this.catDescription});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catNameEn = json['cat_name_en'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catDatetime = json['cat_datetime'];
    catDescription = json['cat_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cat_id'] = catId;
    data['cat_name_en'] = catNameEn;
    data['cat_name_ar'] = catNameAr;
    data['cat_image'] = catImage;
    data['cat_datetime'] = catDatetime;
    data['cat_description'] = catDescription;
    return data;
  }
}
