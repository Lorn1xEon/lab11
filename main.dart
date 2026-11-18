
Future<String> getUser() async {
  print('Початок getUser');
  await Future.delayed(Duration(seconds: 2));
  print('Завершено getUser');
  return 'Олег (ID: 1001)';
}

Future<List<String>> getProducts() async {
  print('Початок getProducts');
  await Future.delayed(Duration(seconds: 3));
  print('Завершено getProducts');
  return ['Ноутбук', 'Мишка', 'Навушники'];
}

Future<List<String>> getOrders() async {
  print('Початок getOrders');
  await Future.delayed(Duration(seconds: 2));
  print('Завершено getOrders');
  return ['Замовлення #101', 'Замовлення #102'];
}

Future<void> main() async {
  print('Завантаження даних магазину...\n');

  try {
    final results = await Future.wait<Object>([
      getUser(),
      getProducts(),
      getOrders(),
    ]);

    print('Користувач: ${results[0]}');

    print('\nТовари:');
    for (final product in results[1] as List<String>) {
      print('- $product');
    }

    print('\nЗамовлення:');
    for (final order in results[2] as List<String>) {
      print('- $order');
    }

    print('\nДані успішно завантажено!');
  } catch (e) {
    print('Помилка: $e');
  }
}
