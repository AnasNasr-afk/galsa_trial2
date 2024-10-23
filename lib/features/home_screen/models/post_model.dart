class PostModel {
  String? image;
  String price;
  String title;
  String location;
  String description;

  PostModel({this.image, required this.price, required this.title, required this.location, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'price': price,
      'title': title,
      'location': location,
      'description': description,
    };
  }
}
