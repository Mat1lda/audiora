import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody_flow/common/helpers/is_dark_mode.dart';
import 'package:melody_flow/common/widgets/app_bar.dart';
import 'package:melody_flow/core/configs/const/app_url.dart';
import 'package:melody_flow/core/configs/theme/app_colors.dart';
import 'package:melody_flow/presentation/home/widgets/new_songs.dart';
import 'package:melody_flow/domain/entities/song/song.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: Image.asset(
          "assets/images/logo_with_text.png",
          height: 180,
          width: 180,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            homeArtistCard(),
            tab(),
            SizedBox(
              height: 260,
              child: TabBarView(
                  children: [
                    NewSongs(),
                    //test(songs);
                    Container(),
                    Container(),
                    Container()
                  ],
                controller: tabController,
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget test(List<SongEntity> songs){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('${AppUrls.coverFirestorage}${songs[1]}.jpg?${AppUrls.mediaAlt}',))
      ),
    );
  }
  Widget homeArtistCard() {
    return Center(
      child: Container(
        height: 150,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/Frame 2.png")),
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/billie2.png")),
        ]),
      ),
    );
  }

  Widget tab() {
    return TabBar(
        controller: tabController,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        //isScrollable: true,
        padding: EdgeInsets.symmetric(
          vertical: 40,
        ),
        tabs: [
          const Text(
            "NEWS",
          ),
          const Text(
            "VIDEO",
          ),
          const Text(
            "ARTIST",
          ),
          const Text(
            "PODCAST",
          ),
        ]);
  }

}
