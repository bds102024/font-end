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

  // Constructor
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

  // Tạo đối tượng từ JSON
  factory NewsFeed.fromJson(Map<String, dynamic> json) {
    return NewsFeed(
      rowId: json['RowId'],
      id: json['Id'],
      description: json['Description'],
      price: (json['Price'] as num?)?.toDouble(),
      category: json['Category'],
      actualArea: (json['ActualArea'] as num?)?.toDouble(),
      documentedArea: (json['DocumentedArea'] as num?)?.toDouble(),
      frontageWidth: (json['FrontageWidth'] as num?)?.toDouble(),
      entranceWidth: (json['EntranceWidth'] as num?)?.toDouble(),
      status: json['Status'],
      priority: json['Priority'],
      actualAddress: json['ActualAddress'],
      ward: json['Ward'],
      district: json['District'],
      city: json['City'],
      legalAddress: json['LegalAddress'],
      otherAddress: json['OtherAddress'],
      latitude: json['Latitude'],
      longitude: json['Longitude'],
      legalInformation: json['LegalInformation'],
      legalInformationDescription: json['LegalInformationDescription'],
      furniture: json['Furniture'],
      furnitureDescription: json['FurnitureDescription'],
      numberOfFloors: json['NumberOfFloors'],
      numberOfBedrooms: json['NumberOfBedrooms'],
      numberOfToilets: json['NumberOfToilets'],
      postingDate: json['PostingDate'] != null
          ? DateTime.parse(json['PostingDate'])
          : null,
      employeeId: json['EmployeeId'],
      avataPath: json['AvataPath'],
    );
  }

  // Xuất đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'RowId': rowId,
      'Id': id,
      'Description': description,
      'Price': price,
      'Category': category,
      'ActualArea': actualArea,
      'DocumentedArea': documentedArea,
      'FrontageWidth': frontageWidth,
      'EntranceWidth': entranceWidth,
      'Status': status,
      'Priority': priority,
      'ActualAddress': actualAddress,
      'Ward': ward,
      'District': district,
      'City': city,
      'LegalAddress': legalAddress,
      'OtherAddress': otherAddress,
      'Latitude': latitude,
      'Longitude': longitude,
      'LegalInformation': legalInformation,
      'LegalInformationDescription': legalInformationDescription,
      'Furniture': furniture,
      'FurnitureDescription': furnitureDescription,
      'NumberOfFloors': numberOfFloors,
      'NumberOfBedrooms': numberOfBedrooms,
      'NumberOfToilets': numberOfToilets,
      'PostingDate': postingDate?.toIso8601String(),
      'EmployeeId': employeeId,
      'AvataPath': avataPath,
    };
  }
}
