import 'package:flutter/material.dart';
import 'package:krowdless/Utils/custom%20widget.dart';
import 'package:sizer/sizer.dart';

class propertInfo extends StatefulWidget {
  const propertInfo({super.key});

  @override
  State<propertInfo> createState() => _propertInfoState();
}

class _propertInfoState extends State<propertInfo> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

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

      /* ---------------- APP BAR ---------------- */

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Property Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /* ---------------- IMAGE CAROUSEL ---------------- */

              SizedBox(
                height: 30.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 1.5.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                      (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    width: currentIndex == index ? 10 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Colors.black
                          : Colors.black26,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 3.h),

              /* ---------------- TITLE + ADDRESS ---------------- */

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Valley of Flowers",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "A vibrant alpine valley famous for seasonal wildflowers and Himalayan views.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2.w),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                      label: const Text("View Address"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 3.h),

              /* ---------------- WEATHER + ACTIONS ---------------- */

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  children: [
                    Container(
                      width: 45.w,
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.w),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6),
                        ],
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.wb_cloudy, color: Colors.orange,size: 20,),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "-15.84°C",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(Icons.air, size: 15),
                                  SizedBox(width: 4),
                                  Text("5.48 km/h", style: TextStyle(fontSize: 10)),
                                ],
                              ),
                              Text(
                                "Overcast Clouds",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Spacer(),
                    // button(isLoading: false, title: "Start Joureny",width: 20.w),
                    // Expanded(
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     style: ElevatedButton.styleFrom(
                    //       padding: EdgeInsets.symmetric(vertical: 2.h),
                    //       backgroundColor: Colors.transparent,
                    //       elevation: 0,
                    //     ),
                    //     child: Ink(
                    //       decoration: BoxDecoration(
                    //         gradient: const LinearGradient(
                    //           colors: [Colors.orange, Colors.green],
                    //         ),
                    //         borderRadius: BorderRadius.circular(3.w),
                    //       ),
                    //       child: const Center(
                    //         child: Text(
                    //           "🚀 Start Journey",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 15,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: 2.w),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 4.w),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.w),
                        ),
                      ),
                      child:
                      const Icon(Icons.play_arrow, color: Colors.white),
                    )
                  ],
                ),
              ),

              SizedBox(height: 3.h),

              /* ---------------- INFO CARDS ---------------- */

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  children: [
                    infoCard(Icons.star, "Rating", "4.5 / 5"),
                    SizedBox(width: 2.w),
                    infoCard(Icons.access_time, "Opening", "9 AM – 6 PM"),
                    SizedBox(width: 2.w),
                    infoCard(Icons.currency_rupee, "Entry Fee", "₹0"),
                  ],
                ),
              ),

              SizedBox(height: 3.h),

              /* ---------------- ABOUT ---------------- */

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.w),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About this place",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Valley of Flowers National Park is a UNESCO World Heritage Site known for its colorful meadows of endemic alpine flowers, snow-fed streams, and breathtaking Himalayan landscapes.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(IconData icon, String title, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.w),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.orange),
            SizedBox(height: 1.h),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
