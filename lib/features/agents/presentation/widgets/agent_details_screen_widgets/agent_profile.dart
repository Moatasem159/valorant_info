import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        CachedNetworkImage(
          imageUrl: agent.background!,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: AppSize.s400,
              height: AppSize.s400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitHeight)),
            );
          },
          placeholder: (context, url) => const SizedBox(
            width: AppSize.s400,
            height: AppSize.s400,
          ),
        ),
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
          left: 12,
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