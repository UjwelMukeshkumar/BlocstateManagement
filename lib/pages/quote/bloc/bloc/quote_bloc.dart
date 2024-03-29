import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()) {
    on<QuoteRequestevent>((event, emit) async{
      //loading state is emitted
      emit(QuotestateLoaing());
      print("quote request triggered");

    await  Future.delayed(Duration(seconds: 3), () {
        emit(QuotestateLoaded(quote: "your Quote is Loaded"));
      });
      //emit the error state
    });
  }
}
//it can consume in main.dart
