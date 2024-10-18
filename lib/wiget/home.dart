import 'package:flutter/material.dart';
import 'package:fontend/wiget/list_notification.dart';
import 'package:fontend/wiget/my_color.dart';
import 'package:fontend/wiget/setting_screen.dart';
import '../login/wiget/login.dart';
import 'detail.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/girl.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Hoàng Gia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _createDrawerItem(
              icon: Icons.report,
              text: 'Báo cáo hoa hồng',
              onTap: () {
                // Điều hướng đến Báo cáo hoa hồng
              },
            ),
            _createDrawerItem(
              icon: Icons.edit,
              text: 'Đăng tin',
              onTap: () {
                // Điều hướng đến Đăng tin
              },
            ),
            _createDrawerItem(
              icon: Icons.group_add,
              text: 'Thêm thành viên',
              onTap: () {
                // Điều hướng đến Thêm thành viên
              },
            ),
            Divider(),
            _createDrawerItem(
              icon: Icons.star,
              text: 'Khối/Phòng của tôi',
              onTap: () {
                // Điều hướng đến Khối/Phòng của tôi
              },
            ),
            _createDrawerItem(
              icon: Icons.assignment,
              text: 'Tin tôi đã đăng',
              onTap: () {
                // Điều hướng đến Tin tôi đã đăng
              },
            ),
            _createDrawerItem(
              icon: Icons.storage,
              text: 'Kho BĐS Hoàng Gia',
              onTap: () {
                // Điều hướng đến Kho BĐS Hoàng Gia
              },
            ),
            _createDrawerItem(
              icon: Icons.bookmark,
              text: 'Tin tôi đã lưu',
              onTap: () {
                // Điều hướng đến Tin tôi đã lưu
              },
            ),
            _createDrawerItem(
              icon: Icons.settings,
              text: 'Thiết lập',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.logout,
              text: 'Đăng xuất',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Đăng xuất'),
                    content: Text('Bạn có chắc chắn muốn đăng xuất?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Hủy'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text('Đăng xuất'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(gradient: MyColor.backgroundTitle),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      CircleAvatar(
                        radius: 30 * 1.5,
                        backgroundImage: AssetImage('assets/images/girl.jpg'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Nguyễn Ngọc Tuyến',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationScreen()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: 'Tìm kiếm nhanh địa chỉ BĐS...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            _buildPropertySection(context, 'Tin tôi đăng'),
            SizedBox(height: 20),
            _buildPropertySection(context, 'Yêu thích'),
            SizedBox(height: 20),
            _buildPropertySection(context, 'Tin mới'),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertySection(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 20.0,
            spacing: 20.0,
            children: _buildPropertyCards(context),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPropertyCards(BuildContext context) {
    List<Map<String, String>> items = [
      {
        'imageUrl': 'https://picsum.photos/300',
        'address': '268.1 Trần Cao Vân, Đà Nẵng',
        'price': '4,15 tỷ',
        'date': '03/09/2024',
      },
      {
        'imageUrl': 'https://picsum.photos/300',
        'address': '383.23 Hải Phòng, Đà Nẵng',
        'price': '2,35 tỷ',
        'date': '27/08/2024',
      },
    ];

    return items.map((item) {
      return InkWell(
        onTap: () {
          // Điều hướng đến màn hình chi tiết bất động sản
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyDetailScreen(
                address: item['address']!,
                price: item['price']!,
                date: item['date']!,
                imageUrl: item['imageUrl']!,
                realArea: '',
                registeredArea: '',
                frontLength: '',
                roadWidth: '',
                bedrooms: 0,
                bathrooms: 0,
                floors: 0,
                legalDocuments: '',
                furniture: '',
                addressOnPaper: '',
              ),
            ),
          );
        },
        child: Card(
          child: Container(
            width: 200.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  item['imageUrl']!,
                  height: 150.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Container(
                      height: 150.0,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Icon(Icons.broken_image,
                          size: 50, color: Colors.grey[600]),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                Text(
                  item['address']!,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  item['price']!,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  item['date']!,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
