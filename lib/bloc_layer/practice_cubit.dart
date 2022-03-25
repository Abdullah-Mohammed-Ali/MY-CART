import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycart/data/data_provider/local/database.dart';

part 'practice_state.dart';

class PracticeCubit extends Cubit<PracticeState> {
  PracticeCubit() : super(PracticeInitial());

  static PracticeCubit get(context) => BlocProvider.of(context);

  LocalDB local = LocalDB();
  List<String> list = [];

  Future<void> openDB() async {
    await local.createDatabase();
  }

  void insert({name}) async {
    await local.insertIntoDatabase(name: name);
    getAllData();
  }

  void getAllData() async {
    list = [];
    emit(Loading());
    await openDB();
    await local.getAllDate().then((value) {
      print(value.toString());
      value.forEach((e) => list.add(e['name']));
    });
    emit(Sucess());
  }
}
