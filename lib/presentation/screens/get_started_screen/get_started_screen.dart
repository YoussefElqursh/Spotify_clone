import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/screens/choose_mode_screen/choose_mode_screen.dart';
import 'package:spotify/presentation/widgets/common_btn_widget.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 40.0,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppVectors.intro),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  'ds.bkvlmdfz;lkbmsorjoairjudbzuygvuyaegzuvdfvzvdJTzdsvsVCYTSVcytvzstdxvbXCvyeryvjhSBVzjhbveurazvuygvjhdzfvbjhzbreuvyazytdstczhggdcvhgzvytazvhtdvhezgrvdgvyteazytwesfdhgazvsdfyzgsvdyxcytzfesdxhtgcvayjdhgxfcgvreyaiztfgveyarzkfdhxcgvbeskxhdrfgvyitsekrzgdfbhkxzbureslzyvgyuszrdgfvbueszlryjbuesjzrhgf',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                commonBtn(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseModeScreen(),
                      ),
                    );
                  },
                  title: 'Get Started',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
