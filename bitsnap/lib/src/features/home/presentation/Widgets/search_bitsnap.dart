import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/utils.dart';
import '../../providers/home_providers.dart';

class SearchBitsnap extends HookConsumerWidget {
  const SearchBitsnap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = useTextEditingController();
    final searchKey = useState('');
    useEffect(() {
      searchTextController.addListener(() {
        searchKey.value = searchTextController.text;
      });
      return () {};
    }, [searchTextController]);
    return Padding(
      padding: const EdgeInsets.only(
          top: UIDimens.size35, left: UIDimens.size10, right: UIDimens.size10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(UIDimens.size8),
        child: TextField(
          controller: searchTextController,
          onSubmitted: (value) {
            ref.read(searchBitsnap.notifier).state = value;
          },
          style: context.textThemes.titleSmall,
          decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              labelStyle: context.textThemes.titleSmall,
              fillColor: Colors.grey.withOpacity(0.2),
              suffixIcon: IconButton(
                  onPressed: () {
                    ref.read(searchBitsnap.notifier).state = searchKey.value;
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ))),
        ),
      ),
    );
  }
}
