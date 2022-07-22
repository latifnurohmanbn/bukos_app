class Space {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  String? city;
  String? country;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;

  Space(
    this.city,
    this.country,
    this.id,
    this.imageUrl,
    this.name,
    this.price,
    this.rating,
    this.address,
    this.mapUrl,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    this.numberOfKitchens,
    this.phone,
    this.photos,
  );

  Space.fromJson(json) {
    // int id = json['id'];
    // String name = json['name'];
    // String city = json['city'];
    // String country = json['country'];
    // String imageUrl = json['image_url'];
    // int price = json['price'];
    // int rating = json['rating'];
    // String address = json['address'];
    // String phone = json['phone'];
    // String? mapUrl = json['map_url'];
    // List photos = json['photos'];
    // int? numberOfBedrooms = json['number_of_bedrooms'];
    // int? numberOfCupboards = json['number_of_cupboards'];
    // int? numberOfKitchens = json['number_of_kitchens'];

    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    price = json['price'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
  }
}
