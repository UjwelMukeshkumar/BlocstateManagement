import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xample/pages/quote/bloc/bloc/quote_bloc.dart';
import 'package:xample/pages/quote/widgets/custom_butto.dart';
import 'package:xample/pages/quote/widgets/errormessage.dart';
import 'package:xample/pages/quote/widgets/quotewidget.dart';

class Quotepagewrapper extends StatelessWidget {
  const Quotepagewrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteBloc(),
      child: Quotepage(),
    );
  }
}

class Quotepage extends StatelessWidget {
  const Quotepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote Home"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Center(
                //    child: Text("Your Quote is waiting"),

                //here we use bloc builder in the widget of child Text("")
                //quotebloc we want o consume and consume the quote state emit state
                child: BlocBuilder<QuoteBloc, QuoteState>(
                  builder: (context, state) {
                    if (state is QuoteInitial) {
                      return const Text("Your Quote is waiting");
                    } else if (state is QuotestateLoaing) {
                      return const CircularProgressIndicator(
                        color: Colors.amber,
                      );
                    } else if (state is QuotestateLoaded) {
                      return Quotewidget(Quote: state.quote);
                    } else if (state is Quotesateerror) {
                      return ErrorMessage(msg: state.msg);
                    }
                    return const ErrorMessage(msg: "something wrong");
                  },
                ),
              ),
            ),

            // called quote widget page
            //  Quotewidget(Quote: "Quote"),
            //    ErrorMessage(msg: "Some Error Occured"),
            //  CircularProgressIndicator(
            //   color: Colors.purple,
            CostumButton()
          ],
        ),
      ),
    );
  }
}
