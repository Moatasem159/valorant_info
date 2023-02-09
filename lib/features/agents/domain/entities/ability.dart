import 'package:equatable/equatable.dart';

class Ability extends Equatable {
  const Ability({
     this.slot,
     this.displayName,
     this.description,
     this.displayIcon,
  });

  final String ?slot;
  final String ?displayName;
  final String ?description;
  final String ?displayIcon;


  @override
  List<Object?> get props => [
    slot,
    displayName,
    description,
    displayIcon
  ];
}