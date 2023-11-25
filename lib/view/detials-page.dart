import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quadb_test/model/model-class.dart';
import 'package:quadb_test/utils/variables.dart';

class DetialsPage extends StatefulWidget {
  final Forecast? datass;
  DetialsPage({Key? key, required this.datass}) : super(key: key);

  @override
  State<DetialsPage> createState() => _DetialsPageState();
}

class _DetialsPageState extends State<DetialsPage> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.datass?.show?.image?.original ?? ""),
                        fit: BoxFit.fill)),
                width: width,
                height: height! * 0.45,
                
                ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.datass?.show?.name}",
                          style: GoogleFonts.bebasNeue(fontSize: 40,color: Colors.white),
                        ),
                        Column(
                          children: [
                            Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ratingBar(
                        rating: widget.datass?.show?.rating?.average ?? 0,
                        minirating: 10,
                        size: 10.0),
                        
                    Text(
                      "${widget.datass?.show?.rating?.average ?? 0}",
                      style: GoogleFonts.bebasNeue(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height:height!*0.01,),
                            Text(
                              "Runtime:\n${widget.datass?.show?.runtime ?? 0}mins",
                              style: GoogleFonts.nunitoSans(fontSize: 10,color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        SizedBox(
                          
                          width: width!*0.5,
                          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [ Text(
                              "${widget.datass?.show?.premiered}",
                              style: GoogleFonts.nunitoSans(fontSize: 10,color: Colors.white),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "GENRES: ",
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 10, fontWeight: FontWeight.w900,color: Colors.white),
                              ),
                              TextSpan(
                                text: "${widget.datass?.show?.genres}",
                                style: GoogleFonts.nunitoSans(fontSize: 10,color: Colors.white),
                              )
                            ])),
                            RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "LANG: ",
                        style: GoogleFonts.nunitoSans(color: Colors.white,
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: "${widget.datass?.show?.language}",
                        style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 10),
                      )
                    ])),
                     RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Show Type: ",
                        style: GoogleFonts.nunitoSans(color: Colors.white,
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: "${widget.datass?.show?.type}",
                        style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 10),
                      )
                    ])),
                    
                            ],
                          ),
                        ),
                         SizedBox(
                          
                          width: width!*0.26,
                          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "IMDB: ",
                                style: GoogleFonts.nunitoSans(color: Colors.white,
                                    fontSize: 10, fontWeight: FontWeight.w900),
                              ),
                              TextSpan(
                                text:
                                    "${widget.datass?.show?.externals?.imdb ?? 0.00}",
                                style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 10),
                              )
                            ])),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "TVRAGE: ",
                                style: GoogleFonts.nunitoSans(color: Colors.white,
                                    fontSize: 10, fontWeight: FontWeight.w900),
                              ),
                              TextSpan(
                                text:
                                    "${widget.datass?.show?.externals?.tvrage ?? 0.00}",
                                style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 10),
                              )
                            ])),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "THETVDB: ",
                                style: GoogleFonts.nunitoSans(color: Colors.white,
                                    fontSize: 10, fontWeight: FontWeight.w900),
                              ),
                              TextSpan(
                                text:
                                    "${widget.datass?.show?.externals?.thetvdb ?? 0.00}",
                                style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 10),
                              )
                            ])),
                            RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "STATUS:\n",
                        style: GoogleFonts.nunitoSans(color: Colors.white,
                            fontSize: 8, fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: "${widget.datass?.show?.status}",
                        style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 10),
                      )
                    ])),

                     RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Site: ",
                        style: GoogleFonts.nunitoSans(color: Colors.white,
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: "${widget.datass?.show?.officialSite}",
                        style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 10),
                      )
                    ])),

                            ],
                          ),
                        )
                      ]),
                    ),
                  
                    SizedBox(height:height!*0.009,),
                    
                    Container(
                        
                        width: width,
                        height: height! * 0.24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.08)),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                              child: RichText(
                                  text: TextSpan(children: [
                            TextSpan(
                              text: "Summary:\n",
                              style: GoogleFonts.nunitoSans(color: Colors.white,
                                  fontSize: 15, fontWeight: FontWeight.w900),
                            ),
                            TextSpan(
                              text: "${widget.datass?.show?.summary}",
                              style: GoogleFonts.nunitoSans(color: Colors.white,fontSize: 15),
                            )
                          ]))),
                        )),
                    Text(
                      "Recommended :",
                      style: GoogleFonts.nunitoSans(color: Colors.white,
                          fontSize: 20, fontWeight: FontWeight.w900),
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}






























 
                        















                        















                        
                          