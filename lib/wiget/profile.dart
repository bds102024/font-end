import 'package:flutter/material.dart';
import 'fillter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        // ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: Filter(),
          );
          //return Filter();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 40.0, // Adjust the height to your preference
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Loại BĐS, địa chỉ ...',
                contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                // Background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        backgroundColor:
            Color.fromARGB(255, 245, 133, 47), // Customize the AppBar color
      ),
      body: Stack(children: [
        Positioned(
            top: 0.0,
            child: Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft, // Gradient starts at the top-left
                    end: Alignment
                        .bottomRight, // Gradient ends at the bottom-right
                    colors: [
                      Color.fromARGB(255, 237, 144, 73),
                      Color.fromARGB(
                          255, 243, 110, 33), // First color of the gradient
                      // Second color of the gradient
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                  child: Row(
                                    children: [
                                      Icon(Icons.filter_alt_outlined),
                                      Text("Bộ lọc"),
                                    ],
                                  ),
                                  onTap: () {
                                    _showFilterModal(context);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Cập nhật gần đây"),
                              Icon(Icons.list_alt),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ))),
        Positioned(
            top: 50.0,
            child: Container(
              height: MediaQuery.sizeOf(context).height - 120,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // PropertyCard(
                      //     address: "addres",
                      //     price: "price",
                      //     views: 1,
                      //     likes: 1,
                      //     imageUrl: "https://via.placeholder.com/300"),
                    ],
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String address;
  final String price;
  final int views;
  final int likes;
  final String imageUrl;

  PropertyCard({
    required this.address,
    required this.price,
    required this.views,
    required this.likes,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          // Background image
          Image.asset(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          // Semi-transparent overlay
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.black.withOpacity(0.5),
          ),
          // Property details
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  address,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    Text('$likes', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 20),
                    Icon(Icons.visibility, color: Colors.grey),
                    Text('$views', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
