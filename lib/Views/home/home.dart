import 'package:flutter/material.dart';
import 'package:krowdless/Utils/colors.dart';
import 'package:krowdless/Utils/custom%20navigation.dart';
import 'package:sizer/sizer.dart';

import 'detaiInfo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

/* -------------------- MODELS -------------------- */

class Property {
  String propertyId;
  String name;
  String city;
  bool liked;

  Property({
    required this.propertyId,
    required this.name,
    required this.city,
    this.liked = false,
  });
}

class Content {
  Property property;
  bool liked;

  Content({required this.property, this.liked = false});
}

class Villas {
  String id;
  String name;
  bool isLiked;

  Villas({required this.id, required this.name, this.isLiked = false});
}

class Data {
  String city;
  List<Villas> villas;

  Data({required this.city, required this.villas});
}

/* -------------------- SCREEN -------------------- */

class _HomeState extends State<Home> {
  List<Content> recommendedList = [];
  List<Data> cityPropertyList = [];

  final List<String> images = [
    "assets/image/beach.jpeg",
    "assets/image/beach2.jpg",
    "assets/image/hills.webp",
    "assets/image/hills1.jpg",
    "assets/image/hills3.jpg",
  ];

  @override
  void initState() {
    super.initState();

    recommendedList = List.generate(
      5,
          (i) => Content(
        property: Property(
          propertyId: "R$i",
          name: "Luxury Villa $i",
          city: "Goa",
        ),
      ),
    );

    cityPropertyList = List.generate(
      3,
          (c) => Data(
        city: "City ${c + 1}",
        villas: List.generate(
          5,
              (v) => Villas(
            id: "C$c-V$v",
            name: "Villa $v",
          ),
        ),
      ),
    );
  }

  /* -------------------- HERO CAROUSEL -------------------- */

  Widget heroSection(double height) {
    return SizedBox(
      height: height * 0.3,
      child: PageView(
        children: [
          heroCard(
            image: images[0],
            title: "Diwali Festival in Varanasi",
            subtitle: "Experience the Festival of Lights",
          ),
          heroCard(
            image: images[1],
            title: "Explore Goa Beaches",
            subtitle: "Plan your peaceful vacation",
          ),
        ],
      ),
    );
  }

  Widget heroCard({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(subtitle,
                style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () {}, child: const Text("Learn More")),
          ],
        ),
      ),
    );
  }

  /* -------------------- CROWD TRACKER -------------------- */

  Widget crowdTracker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Live Crowd Tracker",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 30.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                crowdInfoCard(
                  title: "Taj Mahal",
                  image: images[2],
                  current: 1250,
                  capacity: 2000,
                ),
                crowdInfoCard(
                  title: "Jaipur Palace",
                  image: images[3],
                  current: 890,
                  capacity: 1500,
                ),
                crowdInfoCard(
                  title: "Kerala Backwaters",
                  image: images[1],
                  current: 670,
                  capacity: 1200,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget crowdInfoCard({
    required String title,
    required String image,
    required int current,
    required int capacity,
  }) {
    final percent = current / capacity;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 70.w,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(3, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.asset(
                image,
                height: 15.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Current Visitors",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        current.toString(),
                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Capacity",
                        style: TextStyle(color: Colors.grey,fontSize: 13),
                      ),
                      Text(
                        capacity.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: percent,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade200,
                      color: Colors.amber,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Medium (${(percent * 100).round()}%)",
                          style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 13),
                        ),
                      ),
                      const Text(
                        "Updated 5 min ago",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget crowdCard(String name, int percent, String image,
      {bool isCrowded = false}) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.black.withOpacity(0.55),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            const Spacer(),
            LinearProgressIndicator(
              value: percent / 100,
              color: isCrowded ? Colors.red : Colors.orange,
              backgroundColor: Colors.white30,
            ),
            const SizedBox(height: 6),
            Text(
              "$percent% Crowd",
              style: TextStyle(
                  color: isCrowded ? Colors.red : Colors.orange),
            )
          ],
        ),
      ),
    );
  }

  /* -------------------- EXPLORE BY STATE -------------------- */

  Widget exploreByState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Explore by State",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (_, i) => Container(
                width: 140,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(images[i]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Text(
                    "State ${i + 1}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* -------------------- PROPERTY CARD -------------------- */

  Widget propertyCard(double width, double height, String title, String image,
      bool liked, VoidCallback onLike) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: onLike,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(color: Colors.black, blurRadius: 6)],
            ),
          ),
        ),
      ],
    );
  }

  /* -------------------- BUILD -------------------- */

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heroSection(height),
            const SizedBox(height: 16),
            crowdTracker(),
            const SizedBox(height: 24),
            exploreByState(),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text("Top Destinations this Week",
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: height * 0.22,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 12),
                itemCount: recommendedList.length,
                itemBuilder: (context, index) {
                  final item = recommendedList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: InkWell(
                      onTap: (){
                        CustomNavigator.push(context: context, screen: propertInfo());
                      },
                      child: propertyCard(
                        width * 0.65,
                        height * 0.18,
                        item.property.name,
                        images[index % images.length],
                        item.liked,
                            () {
                          setState(() {
                            item.liked = !item.liked;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
            rewardsBanner(width),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  /* -------------------- REWARDS BANNER -------------------- */

  Widget rewardsBanner(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFFFF7A18), Color(0xFF4CAF50)],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.card_giftcard, color: Colors.white),
                SizedBox(width: 10),
                Text("Incredible India Rewards",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 14),
            const Text(
              "Earn points while you travel & redeem exciting rewards.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
