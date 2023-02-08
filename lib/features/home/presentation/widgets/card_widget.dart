import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
class CardWidget extends StatefulWidget {
  final String cover;
  final String title;
  final VoidCallback onTap;
  const CardWidget({super.key, required this.cover, required this.title, required this.onTap,});
  @override
  State<CardWidget> createState() => _CardWidgetState();
}
class _CardWidgetState extends State<CardWidget> {
  late AssetImage assetImage;
  @override
  void initState() {
    super.initState();
    assetImage=AssetImage(widget.cover);
  }
  @override
  void didChangeDependencies() {
    precacheImage(assetImage, context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: AppSize.s350,
              height: AppSize.s200,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: assetImage
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height:AppSize.s30,
              width: AppSize.s350,
              decoration: const BoxDecoration(
                  color:Colors.black54,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppSize.s10))
              ),
              child:  Text(widget.title,style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppSize.s18
              )),
            ),
          ],
        ),
      ),
    );
  }
}