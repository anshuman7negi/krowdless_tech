import 'package:flutter/material.dart';

import '../../Utils/custom navigation.dart';
import 'detaiInfo.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final List<String> images = [
    "assets/image/beach.jpeg",
    "assets/image/beach2.jpg",
    "assets/image/hills.webp",
    "assets/image/hills1.jpg",
    "assets/image/hills3.jpg",
  ];

  final List<Map<String, dynamic>> properties = List.generate(5, (index) {
    return {
      "id": index,
      "name": "Negi HomeStay",
      "state": "Uttarakhand",
      "category": "Beaches",
      "crowd": "Low Crowd",
      "guests": 2,
      "price": 2000 + (index * 500),
      "image": index,
      "liked": true,
    };
  });

  String selectedState = "All States";
  String selectedCategory = "All Categories";
  String selectedCrowd = "All Crowd Levels";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ---------------- TITLE ----------------
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Explore stays",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Find the perfect stay for your next trip 🏡",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            /// ---------------- FILTER BAR ----------------
            SizedBox(
              height: 46,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  filterDropdown(
                    title: selectedState,
                    items: [
                      "All States",

                      // -------- States --------
                      "Andhra Pradesh",
                      "Arunachal Pradesh",
                      "Assam",
                      "Bihar",
                      "Chhattisgarh",
                      "Goa",
                      "Gujarat",
                      "Haryana",
                      "Himachal Pradesh",
                      "Jharkhand",
                      "Karnataka",
                      "Kerala",
                      "Madhya Pradesh",
                      "Maharashtra",
                      "Manipur",
                      "Meghalaya",
                      "Mizoram",
                      "Nagaland",
                      "Odisha",
                      "Punjab",
                      "Rajasthan",
                      "Sikkim",
                      "Tamil Nadu",
                      "Telangana",
                      "Tripura",
                      "Uttar Pradesh",
                      "Uttarakhand",
                      "West Bengal",

                      // -------- Union Territories --------
                      "Andaman and Nicobar Islands",
                      "Chandigarh",
                      "Dadra and Nagar Haveli and Daman and Diu",
                      "Delhi",
                      "Jammu and Kashmir",
                      "Ladakh",
                      "Lakshadweep",
                      "Puducherry",
                    ],
                    onSelected: (value) {
                      setState(() => selectedState = value);
                    },
                  ),
                  filterDropdown(
                    title: selectedCategory,
                    items: [
                      "All Categories",
                      "Beaches",
                      "Mountains",
                      "City",
                      "Adventure",
                      "Temple",
                    ],
                    onSelected: (value) {
                      setState(() => selectedCategory = value);
                    },
                  ),
                  filterDropdown(
                    title: selectedCrowd,
                    items: [
                      "All Crowd Levels",
                      "Low Crowd",
                      "Medium Crowd",
                      "High Crowd",
                    ],
                    onSelected: (value) {
                      setState(() => selectedCrowd = value);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// ---------------- LISTVIEW ----------------
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  final item = properties[index];

                  return InkWell(
                    onTap: (){
                      CustomNavigator.push(context: context, screen: propertInfo());

                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// -------- IMAGE --------
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  images[item["image"] % images.length],
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item["liked"] = !item["liked"];
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      item["liked"]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /// -------- DETAILS --------
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["name"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item["state"],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.person, size: 16),
                                    const SizedBox(width: 4),
                                    Text("${item["guests"]} guests"),
                                    const Spacer(),
                                    Text(
                                      "₹ ${item["price"]}/night",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------- DROPDOWN FILTER ----------------
  Widget filterDropdown({
    required String title,
    required List<String> items,
    required Function(String) onSelected,
  }) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (context) {
        return items
            .map(
              (e) => PopupMenuItem<String>(
            value: e,
            child: Text(e),
          ),
        )
            .toList();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 13)),
            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
    );
  }
}
