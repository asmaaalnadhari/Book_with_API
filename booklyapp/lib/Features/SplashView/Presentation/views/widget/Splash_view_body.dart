import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/assets.dart';
import 'Sliding_Text.dart';

//--------------------------------------------
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  //value(0-1)
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  //-----------------------
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  //-----------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4,),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
  //-----------------------
  void initSlidingAnimation()
  {
    animationController =AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );
    slidingAnimation =
        Tween<Offset>(
            begin:const Offset(0,4) ,
            end:Offset.zero ).animate(animationController);
    animationController.forward();
  }
  //-----------------------

  void navigateToHome()
  {
    Future.delayed(const Duration(seconds: 3)
        ,(){
          GoRouter.of(context).push(AppRouter.kHomeView);
        }
    );

  }
}


