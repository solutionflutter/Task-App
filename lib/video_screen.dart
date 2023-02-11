import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/Api_service/api_service.dart';
import 'package:taskapp/video_play_screen.dart';
import 'package:video_player/video_player.dart';

import 'model/Data_model.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ApiService().getVideoData();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(
        builder: (_,apiService,__){
          return Scaffold(
              body: FutureBuilder<List<Data>>(
                future: apiService.getVideoData(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          leading: TextButton(
                            onPressed: null,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  "images/Camera Button.png"
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: null,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                    "images/Notification button.png"
                                ),
                              ),
                            ),
                          ],
                          backgroundColor: Colors.transparent,
                          pinned: false,
                          floating: true,
                          title: Text(
                            "Explore",
                            style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black54
                            ),
                          ),
                          centerTitle: true,
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    height: MediaQuery.of(context).size.height/2,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(219, 255, 238, 1),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          //caption text
                                          Text(
                                            "${snapshot.data![index].caption}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),

                                          Text(
                                            "${DateFormat.jm().format(DateTime.parse(snapshot.data![index].createdAt!)).toString()}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(108, 122, 156, 1),
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 12),
                                                height: MediaQuery.of(context).size.height/2.7,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(155, 155, 155, 1),
                                                  borderRadius: BorderRadius.circular(25),
                                                ),
                                                child: VideoPlayScreen(videoUrl: snapshot.data![index].videoUrl!,),
                                              ),

                                              Positioned(
                                                top: MediaQuery.of(context).size.height/3.1,
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height/15,
                                                    width: MediaQuery.of(context).size.width/1.14,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black54,
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(25),
                                                        bottomRight: Radius.circular(25),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Image(
                                                                image: AssetImage("images/Chat.png"),
                                                                height: MediaQuery.of(context).size.height/20,
                                                                width: MediaQuery.of(context).size.width/20,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "10",
                                                                style: GoogleFonts.poppins(
                                                                  fontSize: 17,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: Colors.white,
                                                                  fontStyle: FontStyle.normal,
                                                                ),
                                                              ),

                                                              SizedBox(
                                                                width: 10,
                                                              ),

                                                              Image(
                                                                image: AssetImage("images/heart.png"),
                                                                height: MediaQuery.of(context).size.height/20,
                                                                width: MediaQuery.of(context).size.width/20,
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "122",
                                                                style: GoogleFonts.poppins(
                                                                  fontSize: 17,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: Colors.white,
                                                                  fontStyle: FontStyle.normal,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Image(
                                                                image: AssetImage("images/Send.png"),
                                                                height: MediaQuery.of(context).size.height/20,
                                                                width: MediaQuery.of(context).size.width/20,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Image(
                                                                image: AssetImage("images/bookmark.png"),
                                                                height: MediaQuery.of(context).size.height/20,
                                                                width: MediaQuery.of(context).size.width/20,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ),
                              );
                            },
                            childCount: snapshot.data!.length, // 1000 list items
                          ),
                        ),
                      ],
                    );
                  }else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                },
              )
          );
        }
    );
  }
}
