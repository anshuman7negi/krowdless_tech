import 'package:flutter/material.dart';

class Journey extends StatefulWidget {
  const Journey({super.key});

  @override
  State<Journey> createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
  final List<Map<String, dynamic>> destinations = [
    {
      "name": "Tungnath",
      "state": "Uttarakhand",
      "crowd": "UNKNOWN",
      "image": 2,
    },
    {
      "name": "Valley of Flowers",
      "state": "Uttarakhand",
      "crowd": "HIGH",
      "image": 3,
    },
    {
      "name": "Auli",
      "state": "Uttarakhand",
      "crowd": "HIGH",
      "image": 4,
    },
  ];

  final List<String> images = [
    "assets/image/beach.jpeg",
    "assets/image/beach2.jpg",
    "assets/image/hills.webp",
    "assets/image/hills1.jpg",
    "assets/image/hills3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Build Your Journey",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ---------------- STEPPER ----------------
            stepper(),
            const SizedBox(height: 24),

            /// ---------------- TITLE ----------------
            const Text(
              "Choose Your Destination",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            /// ---------------- FILTERS ----------------
            filters(),
            const SizedBox(height: 24),

            /// ---------------- DESTINATION LIST ----------------
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                return destinationCard(destinations[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  /* ---------------- STEPPER ---------------- */

  Widget stepper() {
    return Row(
      children: [
        stepCircle("1", true, "Destination"),
        stepLine(),
        stepCircle("2", false, "Stay"),
        stepLine(),
        stepCircle("3", false, "Transport"),
        stepLine(),
        stepCircle("4", false, "Guide"),
        stepLine(),
        stepCircle("5", false, "Summary"),
      ],
    );
  }

  Widget stepCircle(String number, bool active, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: active ? Colors.orange : Colors.grey.shade300,
          child: Text(
            number,
            style: TextStyle(color: active ? Colors.white : Colors.black),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: active ? Colors.orange : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget stepLine() {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 18),
        color: Colors.grey.shade300,
      ),
    );
  }

  /* ---------------- FILTERS ---------------- */

  Widget filters() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Search destinations...",
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            filterBox("All States"),
            const SizedBox(width: 10),
            filterBox("All Categories"),
            const SizedBox(width: 10),
            filterBox("All Crowd Levels"),
          ],
        ),
      ],
    );
  }

  Widget filterBox(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
    );
  }

  /* ---------------- DESTINATION CARD ---------------- */

  Widget destinationCard(Map<String, dynamic> item) {
    bool isHigh = item["crowd"] == "HIGH";

    return Container(
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

          /// IMAGE
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  images[item["image"]],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isHigh ? Colors.red : Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item["crowd"],
                    style:
                    const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

          /// DETAILS
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
                  style:
                  const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
