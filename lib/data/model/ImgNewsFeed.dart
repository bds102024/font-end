class ImgNewsFeed {
  String rowID;
  String id;
  String idNewsFeed;
  String pathImg;

  ImgNewsFeed({
    required this.rowID,
    required this.id,
    required this.idNewsFeed,
    required this.pathImg,
  });

  // Phương thức để tạo đối tượng từ JSON
  factory ImgNewsFeed.fromJson(Map<String, dynamic> json) {
    return ImgNewsFeed(
      rowID: json['RowID'],
      id: json['ID'],
      idNewsFeed: json['IdNewsFeed'],
      pathImg: json['PathImg'],
    );
  }

  // Phương thức để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'RowID': rowID,
      'ID': id,
      'IdNewsFeed': idNewsFeed,
      'PathImg': pathImg,
    };
  }
}