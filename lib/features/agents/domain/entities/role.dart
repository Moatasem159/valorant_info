import 'package:equatable/equatable.dart';

class Role extends Equatable {
  final String ?roleId;
  final String ?displayName;
  final String ?description;
  final String ?displayIcon;
  const Role({
     this.roleId,
     this.displayName,
     this.description,
     this.displayIcon,
  });
  @override
  List<Object?> get props => [
    roleId,
    displayName,
    description,
    displayIcon,
  ];
}