# sharedpreference_utils
[![Pub](https://img.shields.io/pub/v/sharedpreference_utils.svg?style=flat-square&color=009688)](https://pub.dartlang.org/packages/sharedpreference_utils)

Flutter shared_preferences plugin util,Use SharedPreferences easily.

### Pub
```yaml
dependencies:
  sharedpreference_utils: ^1.0.0
```

### Example
```dart
  final list = [
    Person(name: "a1", age: 1, city: "earth"),
    Person(name: "a2", age: 1, city: "earth"),
    Person(name: "a3", age: 1, city: "earth"),
  ];

  await SharedPreferenceUtil.setObjectList("key", list);

  final List<Person?>? l = await SharedPreferenceUtil.getObjectList(
    "key",
    (v) => Person.fromJson(v),
  );
  print(l);

  // String Bool Int Double ......
```



