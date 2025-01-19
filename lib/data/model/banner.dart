class BannerModel {
  int id;
  String title;
  String image;
  DateTime createdAt;
  DateTime uploadedAt;

  BannerModel({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.uploadedAt,
  });
  
  factory BannerModel.fromJson(Map<String,dynamic> json){
    return BannerModel(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['created_at']),
      uploadedAt: DateTime.parse(json['updated_at']));
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    
    data['id']=id;
    data['title']=title;
    data['image']=image;
    data['created_at']=createdAt.toIso8601String();
    data['updated_at']=uploadedAt.toIso8601String();
    return data;
  }
}