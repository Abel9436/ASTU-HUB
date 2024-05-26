import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var DBBox = Hive.box('Astu Hub');

  var username = '';
  var year;

  bool isEditingName = false;
  bool isEditingYear = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    username = DBBox.get('name');
    year = DBBox.get('year');
    nameController = TextEditingController(text: username);
    yearController = TextEditingController(text: year);
  }

  @override
  void dispose() {
    nameController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var appcolor = Theme.of(context).colorScheme;
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/back.jpeg')),
              color: appcolor.tertiary,
            ),
            accountName: isEditingName
                ? TextField(
                    controller: nameController,
                    onSubmitted: (value) async {
                      setState(() {
                        username = value;
                        nameController.text =
                            value; // Update the controller's value
                        isEditingName = false;
                      });
                      await DBBox.put('name', username);
                    },
                  )
                : Row(
                    children: [
                      Text(
                        username.toString(),
                        style: TextStyle(
                            fontSize: height / 45, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
            accountEmail: isEditingYear
                ? Padding(
                    padding:
                        EdgeInsets.only(left: height / 50, right: height / 50),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: appcolor.tertiary,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      controller: yearController,
                      onSubmitted: (value) async {
                        setState(() {
                          year = value;
                          isEditingYear = false;
                        });
                        await DBBox.put('year', year);
                      },
                    ),
                  )
                : Row(
                    children: [
                      Text(
                        year.toString(),
                        style: TextStyle(
                            fontSize: height / 60, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            isEditingYear = true;
                          });
                        },
                      ),
                    ],
                  ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage('assets/images/propic2.jpeg'),
            ),
          ),
          SizedBox(
            height: height / 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 40, right: height / 40),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/mainhome');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.tertiary,
                ),
                child: ListTile(
                    title: Text('Home',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Icon(
                      Icons.home,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 40, right: height / 40),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.tertiary,
                ),
                child: ListTile(
                  title: Text('Contact Us',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.contact_support),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 40, right: height / 40),
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://tinyurl.com/abelaportfolio'));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.tertiary,
                ),
                child: ListTile(
                  title: Text('About Developer',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.question_answer),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 40, right: height / 40),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/privacy');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.tertiary,
                ),
                child: ListTile(
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.privacy_tip),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 40, right: height / 40),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/rules');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.tertiary,
                ),
                child: ListTile(
                  title: Text(
                    'ASTU Rules',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.rule),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 40, right: height / 40),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/locations');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.tertiary,
                ),
                child: ListTile(
                  title: Text(
                    'Key Locations',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.location_on),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 40, right: height / 40),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/cafe');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.tertiary,
                ),
                child: ListTile(
                  title: Text(
                    'Cafes In ASTU',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.restaurant),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 4.5,
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 40, right: height / 40),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appcolor.tertiary,
                ),
                child: ListTile(
                  title: Text('Logout',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.logout),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
