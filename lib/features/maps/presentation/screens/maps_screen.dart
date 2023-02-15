import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/core/widgets/loading_body.dart';
import 'package:valorant_info/features/maps/presentation/cubits/map_cubit.dart';
import 'package:valorant_info/features/maps/presentation/cubits/map_state.dart';
import 'package:valorant_info/features/maps/presentation/widgets/map_screen_body.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapStates>(
      builder: (context, state) {
        MapCubit cubit=BlocProvider.of<MapCubit>(context);
        if(state is GetMapSuccessState) {
          return  MapScreenBody(maps: cubit.maps,);
        }
        if(state is GetMapsLoadingState)
          {
            return const LoadingBody();
          }
        return const LoadingBody();
      },
    );
  }
}

