part of 'quote_bloc.dart';

@immutable
abstract class QuoteState {}
//bloc create intial state
class QuoteInitial extends QuoteState {}


//showing here indicator
class QuotestateLoaing extends QuoteState {}

//here we this is loaded a quate state
class QuotestateLoaded extends QuoteState {
  final String quote;
  QuotestateLoaded({required this.quote});
}

class Quotesateerror extends QuoteState {
  final String msg;
  Quotesateerror({required this.msg});
}
