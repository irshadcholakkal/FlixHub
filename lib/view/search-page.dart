import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quadb_test/model/featching-api.dart';
import 'package:quadb_test/model/model-class.dart';
import 'package:quadb_test/utils/search-bar.dart';
import 'package:quadb_test/utils/variables.dart';
import 'package:quadb_test/view/detials-page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

TextEditingController searchController = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    searchData(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              SearchBarss(controller: searchController),
              Expanded(
                child: FutureBuilder<List<Forecast>>(
                  future: searchData(searchController.text),
                  builder: (context, snapshot) {
                    
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFE50914),
                          strokeCap: StrokeCap.round,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'Search For Movies',
                          style:  GoogleFonts.nunitoSans(color: Colors.white.withOpacity(0.5),fontSize: 20,fontWeight: FontWeight.w800),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: SizedBox(
                          height: height! * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              String? imageUrl =
                                  snapshot.data?[index].show?.image?.original;
                              isLoading = imageUrl != null;
                              return isLoading
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetialsPage(
                                              datass: snapshot.data?[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(imageUrl ??
                                                ""),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        width: width! * 0.45,
                                        height: height! * 0.3,
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        color: Colors.yellow,
                                      ),
                                      width: width! * 0.45,
                                      height: height! * 0.3,
                                      child: buildShimmerEffect(),
                                    );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
