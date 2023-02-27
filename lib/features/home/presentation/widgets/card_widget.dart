import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/core/utils/font_size.dart';
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
        padding: const EdgeInsets.all(AppPadding.s8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width:AppSize.s350,
              height: MediaQuery.of(context).size.height/3.7,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.s10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: assetImage
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height:AppSize.s30,
              width:MediaQuery.of(context).size.width-15,
              decoration: const BoxDecoration(
                  color:Colors.black54,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.s10))
              ),
              child:  Text(
                  widget.title.tr(context)!,
                  style: const TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.s18
              )),
            ),
          ],
        ),
      ),
    );
  }
}