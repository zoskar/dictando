import 'package:dict/cubits/dictando_cubit.dart';
import 'package:dict/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeatWidget extends StatelessWidget {
  const BeatWidget({
    required this.step,
    Key? key,
  }) : super(key: key);

  final double step;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DictandoCubit, DictandoState>(
        builder: (context, state) => Row(
          children: [
            for (var i = 0;
                i <
                    context
                        .read<DictandoCubit>()
                        .dictando
                        .beats[context.read<DictandoCubit>().beatIndex]
                        .notes
                        .length;
                i++)
              Column(
                children: [
                  SizedBox(
                    height: context
                            .read<DictandoCubit>()
                            .dictando
                            .beats[context.read<DictandoCubit>().beatIndex]
                            .notes[i]
                            .pitch *
                        step,
                  ),
                  SizedBox(
                    width: 52,
                    // TODO(zoskar): remove workaround
                    height: 0,
                    child: Icon(
                      context.read<DictandoCubit>().noteAt(i),
                      color: i == context.read<DictandoCubit>().noteIndex
                          ? AppColors.a
                          : Colors.black,
                      size: 9 * step,
                    ),
                  ),
                ],
              ),
          ],
        ),
      );
}
