import 'package:blogonomy/Repository/card_repositoriesCateg.dart';
import 'package:blogonomy/cubit/network/card_cubitCateg.dart';
import 'package:blogonomy/cubit/network/card_stateCateg.dart';
import 'package:blogonomy/main.dart';
import 'package:blogonomy/widget/card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardCubit cardCubit = context.read<CardCubit>();
    cardCubit.fetchCard();

    return BlocBuilder<CardCubit, CardState>(builder: (context, state) {
      if (state is CardLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is CardLoadedState) {
        return RefreshIndicator(
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.loadedCard?.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print("click");
                          },
                          child: CardView(
                              id: '${state.loadedCard?[index].id}',
                              name: '${state.loadedCard?[index].name}',
                              //image: '${state.loadedCard?[index].picUrl}',
                              image: '${state.loadedCard?[index].picUrl}',
                              numberOfBloggers:
                                  state.loadedCard?[index].numBloggers ?? 1),
                        )),
              )
            ]),
            onRefresh: cardCubit.fetchCard);
      }
      return Text("Error");
    });
  }
}
