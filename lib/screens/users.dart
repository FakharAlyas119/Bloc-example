import 'package:bloc_learning/bloc/user_bloc/user_bloc.dart';
import 'package:bloc_learning/bloc/user_bloc/user_event.dart';
import 'package:bloc_learning/bloc/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserEmpty) {
            context.read<UserBloc>().add(FetchUsers());
          }
          if (state is UserOnError) {
            return const Center(
              child: Text('No Data Found'),
            );
          }
          if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.listOfUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(1, 1),
                      )
                    ],
                  ),
                  child: ListTile(
                    leading: Text(state.listOfUsers[index].id.toString()),
                    title:
                        Text(state.listOfUsers[index].company!.name.toString()),
                    subtitle: Text(state.listOfUsers[index].address.toString()),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
