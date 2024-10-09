import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/screens/profile_screen/profile_screen.dart';
import 'package:spotify/presentation/widgets/app_bar_widget.dart';
import 'package:spotify/presentation/widgets/news_songs.dart';
import 'package:spotify/presentation/widgets/playlist_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context,
        SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
            },
            icon: const Icon(
                Icons.person
            )
        ),
        hideBackBtn: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(AppVectors.homeTopCard),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(AppVectors.home),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TabBar(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              labelColor: context.isDarkMode ? Colors.white : Colors.black,
              indicatorColor: AppColors.primary,
              dividerHeight: 0,
              dividerColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              tabs: const [
                Text(
                  'News',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  'Videos',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  'Artists',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  'Podcasts',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  NewsSongs(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
            ),
            const PlaylistWidget()
          ],
        ),
      ),
    );
  }
}
