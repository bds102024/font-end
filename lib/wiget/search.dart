import 'package:flutter/material.dart';

class Timkiem extends StatefulWidget {
  const Timkiem({super.key});

  @override
  State<Timkiem> createState() => _TimkiemState();
}

class _TimkiemState extends State<Timkiem> {
  @override
  Widget build(BuildContext context) {
    return PropertyListScreen();
  }
}

class PropertyListScreen extends StatelessWidget {
  final List<Property> properties = [
    Property(
      imageUrl: 'https://example.com/image1.jpg',
      address: '19.12 Đinh Tiên Hoàng, Tam Thuận, Thanh Khê, Đà Nẵng',
      size: '82 m²',
      price: '5 tỷ 700 triệu đồng',
      rooms: '2',
      bathrooms: '3',
      postedDate: '29/07/2024',
    ),
    Property(
      imageUrl: 'https://example.com/image2.jpg',
      address: '149.43.17B Lê Đình Lý, Hòa Thuận Đông, Hải Châu, Đà Nẵng',
      size: '40 m²',
      price: '2 tỷ 600 triệu đồng',
      rooms: '2',
      bathrooms: '2',
      postedDate: '28/07/2024',
    ),
    // Add more properties as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Listings'),
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return PropertyCard(property: properties[index]);
        },
      ),
    );
  }
}

class Property {
  final String imageUrl;
  final String address;
  final String size;
  final String price;
  final String rooms;
  final String bathrooms;
  final String postedDate;

  Property({
    required this.imageUrl,
    required this.address,
    required this.size,
    required this.price,
    required this.rooms,
    required this.bathrooms,
    required this.postedDate,
  });
}

class PropertyCard extends StatelessWidget {
  final Property property;

  PropertyCard({required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(property.imageUrl), // Replace with actual images
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.address,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text('Size: ${property.size}'),
                Text('Rooms: ${property.rooms}'),
                Text('Bathrooms: ${property.bathrooms}'),
                Text('Price: ${property.price}'),
                Text('Posted on: ${property.postedDate}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
