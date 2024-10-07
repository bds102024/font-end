class NewsFeed {
  String rowID;
  String id;
  String description;
  String price;
  String category;
  String actualArea;
  String documentedArea;
  String frontageWidth;
  String entranceWidth;
  String status;
  String priority;
  String actualAddress;
  String ward;
  String district;
  String city;
  String legalAddress;
  String otherAddress;
  String latitude;
  String longitude;
  String legalInformation;
  String legalInformationDescription;
  String furniture;
  String furnitureDescription;
  String numberOfFloors;
  String numberOfBedrooms;
  String numberOfToilets;
  String postingDate;
  String employeeID;

  NewsFeed({
    required this.rowID,
    required this.id,
    required this.description,
    required this.price,
    required this.category,
    required this.actualArea,
    required this.documentedArea,
    required this.frontageWidth,
    required this.entranceWidth,
    required this.status,
    required this.priority,
    required this.actualAddress,
    required this.ward,
    required this.district,
    required this.city,
    required this.legalAddress,
    required this.otherAddress,
    required this.latitude,
    required this.longitude,
    required this.legalInformation,
    required this.legalInformationDescription,
    required this.furniture,
    required this.furnitureDescription,
    required this.numberOfFloors,
    required this.numberOfBedrooms,
    required this.numberOfToilets,
    required this.postingDate,
    required this.employeeID,
  });

  // Phương thức để tạo đối tượng từ JSON
  factory NewsFeed.fromJson(Map<String, dynamic> json) {
    return NewsFeed(
      rowID: json['RowID'],
      id: json['ID'],
      description: json['Description'],
      price: json['Price'],
      category: json['Category'],
      actualArea: json['ActualArea'],
      documentedArea: json['DocumentedArea'],
      frontageWidth: json['FrontageWidth'],
      entranceWidth: json['EntranceWidth'],
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
      postingDate: json['PostingDate'],
      employeeID: json['EmployeeID'],
    );
  }

  // Phương thức để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'RowID': rowID,
      'ID': id,
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
      'PostingDate': postingDate,
      'EmployeeID': employeeID,
    };
  }
}