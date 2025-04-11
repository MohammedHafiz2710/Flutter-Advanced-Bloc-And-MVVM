import 'package:basketball/cubit/cubit/counter_cubit.dart';
import 'package:basketball/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PointsCounterPage extends StatelessWidget {
  const PointsCounterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            "Points Counter",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Team A",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          BlocProvider.of<CounterCubit>(context).counterA.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 150,
                          ),
                        ),
                        CustomElevatedButton(
                          text: 'Add 1 point',
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).incrementA(points: 1);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomElevatedButton(
                          text: 'Add 2 point',
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).incrementA(points: 2);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomElevatedButton(
                          text: 'Add 3 point',
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).incrementA(points: 3);
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 400,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          "Team B",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          BlocProvider.of<CounterCubit>(context).counterB.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 150,
                          ),
                        ),
                        CustomElevatedButton(
                          text: 'Add 1 point',
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).incrementB(points: 1);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomElevatedButton(
                          text: 'Add 2 point',
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).incrementB(points: 2);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomElevatedButton(
                          text: 'Add 3 point',
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).incrementB(points: 3);
                          },
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                CustomElevatedButton(
                  text: 'Reset',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).reset();
                  },
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
