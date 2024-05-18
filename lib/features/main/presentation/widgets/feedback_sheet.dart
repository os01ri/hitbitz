part of '../pages/main_page.dart';

class _FeedbackSheet extends StatefulWidget {
  const _FeedbackSheet();

  @override
  State<_FeedbackSheet> createState() => _FeedbackSheetState();
}

class _FeedbackSheetState extends State<_FeedbackSheet> {
  late final ValueNotifier<FeedbackType> _listenableValue;
  late final TextEditingController _description;

  @override
  void initState() {
    super.initState();
    _listenableValue = ValueNotifier(FeedbackType.feedback);
    _description = TextEditingController();
  }

  @override
  void dispose() {
    _listenableValue.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<MainCubit>(),
      child: BlocListener<MainCubit, MainState>(
        listener: _listener,
        child: BottomSheetWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextWidget(
                'Send Feedback',
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              DropDownWidget<FeedbackType>(
                listenableValue: _listenableValue,
                label: 'Type',
                items: FeedbackType.validValues
                    .map((e) => DropdownMenuItem<FeedbackType>(
                          value: e,
                          child: Row(
                            children: [
                              e.icon,
                              const Gap(10),
                              TextWidget(e.name),
                            ],
                          ),
                        ))
                    .toList(),
              ),
              const Gap(10),
              TextWidget(
                'Description',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(5),
              TextFieldWidget(
                controller: _description,
                hint: 'type something...',
                maxLines: 6,
              ),
              const Gap(10),
              ButtonWidget(
                backgroundColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.onPrimary,
                width: context.width,
                text: 'Send',
                onPressed: () => di<MainCubit>().makeSuggestion(SuggestionParams(
                  type: _listenableValue.value,
                  description: _description.text,
                )),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, MainState state) {
    if (state.suggestionStatus == CubitStatus.loading) {
      Toaster.showLoading();
    } else if (state.suggestionStatus == CubitStatus.failure) {
      Toaster.closeLoading();
      Toaster.showError(context: context, message: 'error!');
    } else if (state.suggestionStatus == CubitStatus.success) {
      Toaster.closeLoading();
      context.popDialog();
      Toaster.showSuccess(
          context: context, message: 'Your feedback sent  successfully, thanks for sharing it with us!, we will be checking it very soon');
    }
  }
}
