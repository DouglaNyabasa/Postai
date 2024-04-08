import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:iconsax/iconsax.dart';
import 'package:postai/components/messages.dart';
import 'package:postai/pages/blank.dart';
import 'package:postai/pages/trackntrace.dart';
import 'package:postai/utils/colors.dart';


import 'calculate.dart';
import 'mail_services.dart';


class Item {
  final String image;
  final Widget page;
  Item(this.image, this.page,);
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Sample associative array (map)

  final Map<String, Item> dataMap = {
    // "Mail": Item("mail.png", const MailServices()),
    "Parcels": Item("parcel.png", const BlankPage()),
    "Track 'n' Trace": Item("track.png", const TracknTrace()),
    "Financial services": Item("bonds.png", const BlankPage()),
    "Call a bike": Item("scooter.png", const BlankPage()),
    "Zipfound": Item("found.png", const BlankPage()),
    "Boxes and Bags": Item("handcart.png", const BlankPage()),
    "Nearest Post Office": Item("mailbox.png", const BlankPage()),
    "Shipping Cost": Item("mailbox.png",  WeightFormScreen()),
    //"log Out": Item("mailbox.png", const LogIn()),
    "About Zimpost": Item("logo1.png", const BlankPage()),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            // expandedHeight: 150.0,
            pinned: true, // Set to true to make the app bar stick to the top
            expandedHeight: MediaQuery.of(context).size.height * .3,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        const Text(
                          'Postai',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        // Icon(size: 16,color: Colors.black, )
                        // easy to use
                        CustomPopup(
                          content: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Messages',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Divider(),
                              Expanded(child: Messages())
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Icon(
                                Iconsax.message5,
                                color: Colors.black,
                                size: 18,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3, left: 12),
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(postred),
                                ),
                                child: const Text(
                                  '3',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'lib/assets/images/bg1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black
                        .withOpacity(0.5), // Adjust opacity as needed
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'lib/assets/images/logo1.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * .4,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  String name = dataMap.keys.elementAt(index);
                  Item item = dataMap[name]!;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => item.page),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icon(
                          //     Icons.star,
                          //     size: 50,
                          //     color: Color(postblue),
                          //   ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Image.asset(
                              'lib/assets/images/${item.image}',
                              fit: BoxFit.cover,
                              scale: 1.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  );
                },
                childCount: dataMap.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
