import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Ability extends Equatable {
   Ability({
     this.slot,
     this.displayName,
     this.description,
     this.displayIcon,
     this.isSelected,
  });

  final String ?slot;
  final String ?displayName;
  final String ?description;
  final String ?displayIcon;
  bool ?isSelected;


  @override
  List<Object?> get props => [
    slot,
    displayName,
    description,
    displayIcon
  ];
}