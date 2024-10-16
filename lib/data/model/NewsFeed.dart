class NewsFeed {
  int rowId;
  String id;
  String? description;
  double? price;
  int? category;
  double? actualArea;
  double? documentedArea;
  double? frontageWidth;
  double? entranceWidth;
  int? status;
  int? priority;
  String? actualAddress;
  String? ward;
  String? district;
  String? city;
  String? legalAddress;
  String? otherAddress;
  String? latitude;
  String? longitude;
  int? legalInformation;
  String? legalInformationDescription;
  int? furniture;
  String? furnitureDescription;
  int? numberOfFloors;
  int? numberOfBedrooms;
  int? numberOfToilets;
  DateTime? postingDate;
  String? employeeId;
  String? avataPath;

  NewsFeed({
    required this.rowId,
    required this.id,
    this.description,
    this.price,
    this.category,
    this.actualArea,
    this.documentedArea,
    this.frontageWidth,
    this.entranceWidth,
    this.status,
    this.priority,
    this.actualAddress,
    this.ward,
    this.district,
    this.city,
    this.legalAddress,
    this.otherAddress,
    this.latitude,
    this.longitude,
    this.legalInformation,
    this.legalInformationDescription,
    this.furniture,
    this.furnitureDescription,
    this.numberOfFloors,
    this.numberOfBedrooms,
    this.numberOfToilets,
    this.postingDate,
    this.employeeId,
    this.avataPath,
  });

  // Hàm fromJson để tạo đối tượng từ JSON
  factory NewsFeed.fromJson(Map<String, dynamic> json) {
    return NewsFeed(
      rowId: json['rowId'],
      id: json['id'],
      description: json['description'],
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'],
      actualArea: (json['actualArea'] as num?)?.toDouble(),
      documentedArea: (json['documentedArea'] as num?)?.toDouble(),
      frontageWidth: (json['frontageWidth'] as num?)?.toDouble(),
      entranceWidth: (json['entranceWidth'] as num?)?.toDouble(),
      status: json['status'],
      priority: json['priority'],
      actualAddress: json['actualAddress'],
      ward: json['ward'],
      district: json['district'],
      city: json['city'],
      legalAddress: json['legalAddress'],
      otherAddress: json['otherAddress'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      legalInformation: json['legalInformation'],
      legalInformationDescription: json['legalInformationDescription'],
      furniture: json['furniture'],
      furnitureDescription: json['furnitureDescription'],
      numberOfFloors: json['numberOfFloors'],
      numberOfBedrooms: json['numberOfBedrooms'],
      numberOfToilets: json['numberOfToilets'],
      postingDate: json['postingDate'] != null
          ? DateTime.parse(json['postingDate'])
          : null,
      employeeId: json['employeeId'],
      avataPath: json['avataPath'],
    );
  }

  // Hàm toJson để chuyển đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'rowId': rowId,
      'id': id,
      'description': description,
      'price': price,
      'category': category,
      'actualArea': actualArea,
      'documentedArea': documentedArea,
      'frontageWidth': frontageWidth,
      'entranceWidth': entranceWidth,
      'status': status,
      'priority': priority,
      'actualAddress': actualAddress,
      'ward': ward,
      'district': district,
      'city': city,
      'legalAddress': legalAddress,
      'otherAddress': otherAddress,
      'latitude': latitude,
      'longitude': longitude,
      'legalInformation': legalInformation,
      'legalInformationDescription': legalInformationDescription,
      'furniture': furniture,
      'furnitureDescription': furnitureDescription,
      'numberOfFloors': numberOfFloors,
      'numberOfBedrooms': numberOfBedrooms,
      'numberOfToilets': numberOfToilets,
      'postingDate': postingDate?.toIso8601String(),
      'employeeId': employeeId,
      'avataPath': avataPath,
    };
  }
}
