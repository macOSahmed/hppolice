import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:himcops/citizen/domestichelpverification.dart';
import 'package:himcops/citizen/employeeverification.dart';
import 'package:himcops/citizen/policeclearance.dart';
import 'package:himcops/citizen/searchstaus/characterstatus.dart';
import 'package:himcops/citizen/searchstaus/dmvviewpage.dart';
import 'package:himcops/citizen/searchstaus/empviewpage.dart';
import 'package:himcops/citizen/searchstaus/pccviewpage.dart';
import 'package:himcops/pages/cgridhome.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int? _expandedTileIndex;

  void _onExpansionChanged(int index, bool isExpanded) {
    setState(() {
      _expandedTileIndex = isExpanded ? index : null;
    });
  }

  String loginId = '';
  String firstName = '';
  int? mobile2;
  String email = '';
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _fetchLoginId();
  }

  Future<void> _fetchLoginId() async {
    // Retrieve the values stored in secure storage
    final String? storedLoginId = await storage.read(key: 'loginId');
    final String? storedfirstName = await storage.read(key: 'firstName');
    final String? storedMobile2 = await storage.read(key: 'mobile2');
    final String? storedemail = await storage.read(key: 'email');
    print(
        'loginId:$storedLoginId,firstname:$storedfirstName,mobile:$storedMobile2,email:$storedemail');

    setState(() {
      loginId = storedLoginId ?? 'Unknown';
      firstName = storedfirstName ?? 'Unknown';
      mobile2 = storedMobile2 != null ? int.tryParse(storedMobile2) : null;
      email = storedemail ?? 'Unknown';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 12, 100, 233),
                  Color.fromARGB(255, 139, 197, 230)
                ],
                stops: [0.23, 0.76],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // color:Color.fromARGB(255, 9, 70, 35),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/images/hp_logo.png',
                  width: 70,
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 12, color: Colors.white,
                        fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      // ignore: unnecessary_string_interpolations
                      '$firstName',
                      style: TextStyle(
                        fontSize: 14,//MediaQuery.of(context).size.width * 0.033,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(214, 252, 225, 185),
                      ),
                      // textScaleFactor: MediaQuery.of(context)
                      //     .textScaleFactor
                      //     .clamp(1.0, 2.0),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Contact Number: ',
                        style: TextStyle(
                          fontSize: 14, //MediaQuery.of(context).size.width * 0.030,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '$mobile2',
                            style: TextStyle(
                              fontSize:
                                  14, //MediaQuery.of(context).size.width * 0.030,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(214, 252, 225, 185),
                            ),
                          ),
                        ],
                      ),
                      // textScaleFactor: MediaQuery.of(context)
                      //     .textScaleFactor
                      //     .clamp(1.0, 2.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CitizenGridPage()),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.add),
            title: const Text(
              'Apply For Services',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            initiallyExpanded: _expandedTileIndex == 1,
            onExpansionChanged: (isExpanded) =>
                _onExpansionChanged(1, isExpanded),
            children: [
              ListTile(
                title: const Text('Police Clearance Certificate'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PoliceClearanceCertificatePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Employee Verification'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmployeeVerificationPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Domestic Help Verification'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DomesticHelpVerificationPage()),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.search),
            title: const Text(
              'Track Request Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            initiallyExpanded: _expandedTileIndex == 2,
            onExpansionChanged: (isExpanded) =>
                _onExpansionChanged(2, isExpanded),
            children: [
              ListTile(
                title: const Text('Character Request Status'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CharacterRequestStatusPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Police Clearance Certificate'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PoliceClearanceCertificateViewPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Employee Verification'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const EmployeeVerificationViewPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Domestic Help Verification'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DomesticHelpVerificationViewPage()),
                  );
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: const TextStyle(
                // fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
