class Hotel {
  String? id;
  String? title;
  num? rating;
  Map<String, dynamic>? prices;
  String? mainImage;
  List<dynamic>? otherImages;
  List<dynamic>? amenities;

  Hotel({
    this.id,
    this.title,
    this.rating,
    this.prices,
    this.mainImage,
    this.otherImages,
    this.amenities,
  });
}
