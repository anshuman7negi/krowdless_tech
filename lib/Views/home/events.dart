import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final List<Map<String, dynamic>> events = [
    {
      "image": "assets/image/hills3.jpg",
      "category": "Pilgrimage",
      "title": "Nanda Devi Raj Jat Yatra",
      "description":
      "A sacred pilgrimage held once every 12 years in Uttarakhand, covering remote Himalayan villages and peaks.",
      "date": "Aug 2026 - Sep 2026",
      "location": "Uttarakhand",
      "categoryColor": Colors.orange.shade100,
      "categoryTextColor": Colors.orange,
    },
    {
      "image": "assets/image/hills.webp",
      "category": "Religious",
      "title": "Mahakumbh Mela",
      "description":
      "The largest human gathering on Earth, held at Prayagraj with millions of devotees taking holy dips.",
      "date": "Jan 2025 - Feb 2025",
      "location": "Prayagraj, Uttar Pradesh",
      "categoryColor": Colors.red.shade100,
      "categoryTextColor": Colors.red,
    },
    {
      "image": "assets/image/beach2.jpg",
      "category": "Cultural",
      "title": "Pushkar Camel Fair",
      "description":
      "One of the world’s largest livestock fairs combined with cultural performances and desert festivities.",
      "date": "Nov 2025",
      "location": "Pushkar, Rajasthan",
      "categoryColor": Colors.brown.shade100,
      "categoryTextColor": Colors.brown,
    },
    {
      "image": "assets/image/beach.jpeg",
      "category": "Adventure",
      "title": "Leh Ladakh Bike Expedition",
      "description":
      "A thrilling high-altitude bike journey through Himalayan passes, monasteries, and scenic valleys.",
      "date": "Jun 2025 - Sep 2025",
      "location": "Leh, Ladakh",
      "categoryColor": Colors.blue.shade100,
      "categoryTextColor": Colors.blue,
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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Events"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return Container(
            margin: EdgeInsets.only(bottom: 3.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Event Image
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(4.w),
                  ),
                  child: Image.asset(
                    event["image"],
                    height: 22.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // ClipRRect(
                //   borderRadius: BorderRadius.vertical(
                //     top: Radius.circular(4.w),
                //   ),
                //   child: CachedNetworkImage(
                //     imageUrl: event["image"],
                //     height: 22.h,
                //     width: double.infinity,
                //     fit: BoxFit.cover,
                //
                //     /// while loading
                //     placeholder: (context, url) => Container(
                //       height: 22.h,
                //       color: Colors.grey.shade300,
                //       child: const Center(
                //         child: CircularProgressIndicator(strokeWidth: 2),
                //       ),
                //     ),
                //
                //     /// if error
                //     errorWidget: (context, url, error) => Container(
                //       height: 22.h,
                //       color: Colors.grey.shade300,
                //       child: const Icon(
                //         Icons.broken_image,
                //         size: 40,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),

                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Category Chip
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 0.8.h,
                        ),
                        decoration: BoxDecoration(
                          color: event["categoryColor"],
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Text(
                          event["category"],
                          style: TextStyle(
                            color: event["categoryTextColor"],
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      SizedBox(height: 1.5.h),

                      /// Title
                      Text(
                        event["title"],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 1.h),

                      /// Description
                      Text(
                        event["description"],
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade700,
                        ),
                      ),

                      SizedBox(height: 2.h),

                      /// Date & Location
                      Row(
                        children: [
                          Icon(Icons.calendar_today,
                              size: 4.w, color: Colors.grey),
                          SizedBox(width: 2.w),
                          Text(
                            event["date"],
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(width: 5.w),
                          Icon(Icons.location_on,
                              size: 4.w, color: Colors.grey),
                          SizedBox(width: 1.w),
                          Expanded(
                            child: Text(
                              event["location"],
                              style: TextStyle(fontSize: 10),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 3.h),

                      /// View Details Button
                      SizedBox(
                        width: double.infinity,
                        height: 6.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.w),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.w),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFF8C00),
                                  Color(0xFF2ECC71),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "View Event Details",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
