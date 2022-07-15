import 'package:manual_de_sobrevivencia/shared/models/subjects.dart';
import 'package:manual_de_sobrevivencia/shared/models/user_abstract.dart';

class UserClient extends AbstractUser {
  late String id;
  late String name;
  late List<Subjects> subjectList;
}
