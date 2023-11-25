import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quadb_test/model/featching-api.dart';
import 'package:quadb_test/model/model-class.dart';
import 'package:quadb_test/utils/variables.dart';
import 'package:quadb_test/view/detials-page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

PageController controller = PageController();

int currentPage = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return FutureBuilder<List<Forecast>>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          lengths = datas?.length;

          return Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Center(
                  child: Text(
                    "FlixHub",
                    style: GoogleFonts.bebasNeue(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 5),
                  ),
                )),
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height! * 0.6,
                        width: width,
                        child: PageView.builder(
                          controller: controller,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            int ?reversedIndex =
                                  (datas?.length ?? 0) - 2 - index;
                            if (datas == null || datas!.isEmpty) {
                                  return buildShimmerEffect(); }
                                    
                            String? imageUrl =
                                datas?[reversedIndex].show?.image?.original;
                            isLoading = imageUrl != null;
                            return isLoading
                                ? InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetialsPage(
                                                    datass: datas?[reversedIndex],
                                                  )));
                                    },
                                    child: Image.network(imageUrl ?? "",fit: BoxFit.fill,))
                                : buildShimmerEffect();
                          },
                        ),
                      ),
                      Center(
                        child: SizedBox(
                            height: height! * 0.02,
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: 5,
                              effect: const ExpandingDotsEffect(
                                activeDotColor: Colors.white,
                                dotColor: Colors.grey,
                                dotHeight: 7,
                                dotWidth: 10,
                              ),
                            )),
                      ),
                    ],
                  ),









                  Container(
                    margin: const EdgeInsets.only(left: 5,right: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Popular on Flixhub",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  letterSpacing: 1),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "See all",
                                  style: TextStyle(color: Colors.white38),
                                ))
                          ],
                        ),
                        SizedBox(
                            height: height! * 0.3,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: datas?.length,
                                itemBuilder: (context, index) {
                                  
                                  String? imageUrl =
                                      datas?[index].show?.image?.medium;
                                  isLoading = imageUrl != null;
                                  return isLoading
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetialsPage(
                                                          datass: datas?[index],
                                                        )));
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        imageUrl ?? ""),
                                                    fit: BoxFit.fill)),
                                            width: width! * 0.45,
                                            height: height! * 0.3,
                                          ),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.yellow,
                                          ),
                                          width: width! * 0.45,
                                          height: height! * 0.3,
                                          child: buildShimmerEffect(),
                                        );
                                })),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "New on Flixhub",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  letterSpacing: 1),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "See all",
                                  style: TextStyle(color: Colors.white38),
                                ))
                          ],
                        ),
                        SizedBox(
                            height: height! * 0.3,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: datas?.length,
                                itemBuilder: (context, index) {
                                  int reversedIndex =
                                      (datas?.length ?? 0) - 1 - index;
                                  String? imageUrl =
                                      datas?[reversedIndex].show?.image?.medium;
                                  isLoading = imageUrl != null;
                                  return isLoading
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetialsPage(
                                                          datass:
                                                              datas?[reversedIndex],
                                                        )));
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        imageUrl ?? ""),
                                                    fit: BoxFit.fill)),
                                            width: width! * 0.45,
                                            height: height! * 0.3,
                                          ),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.yellow,
                                          ),
                                          width: width! * 0.45,
                                          height: height! * 0.3,
                                          child: buildShimmerEffect(),
                                        );
                                })),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
