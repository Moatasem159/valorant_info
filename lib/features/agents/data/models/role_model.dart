import 'package:valorant_info/features/agents/domain/entities/role.dart';

class RoleModel extends Role{
  const RoleModel({
    super.roleId,
    super.description,
    super.displayIcon,
    super.displayName,
});
  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    roleId: json["uuid"]??'',
    displayName: json["displayName"]??'',
    description: json["description"]??'',
    displayIcon: json["displayIcon"]??'',
  );
  Map<String, dynamic> roleToJson() => {
    "uuid": roleId,
    "displayName": displayName,
    "description": description,
    "displayIcon": displayIcon,
  };
}