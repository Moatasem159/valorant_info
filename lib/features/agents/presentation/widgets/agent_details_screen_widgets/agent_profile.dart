import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
class AgentProfile extends StatelessWidget {
  final Agent agent;
  const AgentProfile({super.key, required this.agent});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _AgentBackgroundImage(image: agent.background!),
        Hero(
          tag: "hero${agent.agentId}",
          child: CachedNetworkImage(
            imageUrl: agent.fullPortraitV2!,
            imageBuilder: (context, imageProvider) {
              return Container(
                width: AppSize.s290,
                height: AppSize.s350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitHeight)),
              );
            },
            placeholder: (context, url) =>const SizedBox(
              width: AppSize.s290,
              height: AppSize.s350,
            ) ,
          ),
        ),
        Positioned(
          top: 25,
          width: 50,
          left: AppLocalizations.of(context)!.isEnLocale?
          2:MediaQuery.of(context).size.width/1.2,
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back,color: Colors.white,),
          ),
        )
      ],
    );
  }
}

class _AgentBackgroundImage extends StatelessWidget {
  final String image;
  const _AgentBackgroundImage({required this.image,});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: AppSize.s400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitHeight)),
        );
      },
      placeholder: (context, url) =>  SizedBox(
        width: MediaQuery.of(context).size.width,
        height: AppSize.s400,
      ),
      errorWidget: (context, url, error) =>SizedBox(
        width: MediaQuery.of(context).size.width,
        height: AppSize.s400,
      ) ,
    );
  }
}