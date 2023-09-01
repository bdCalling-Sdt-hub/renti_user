import 'package:flutter/material.dart';
import 'package:renti_user/view/screens/splash/inner_widgets/bottom_section.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/splashbgimage.png'),
                        fit: BoxFit.fill,
                        // colorFilter: ColorFilter.mode(const Color(0xff000B90).withOpacity(0.9), BlendMode.dstATop)
                      )),
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xff000b90).withOpacity(0.6),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 24, top: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            Container(
                              height: 198,
                              width: 198,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:AssetImage('assets/logos/splashlogo.png')
                                  )),
                            ),
                            Spacer(),
                            BottomSection()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          )),
    );
  }
}