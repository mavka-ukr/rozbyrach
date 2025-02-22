# Розбирач Мавки

Рукописний розбирач Мавки.

## Приклад

```ціль
взяти визначення розбирач;

дія система_виділити_сиру_памʼять(система: адреса<мавка::розбирач::Система>, розмір: позитивне): памʼять<п8> {
  вернути пусто як памʼять<п8>; // треба втілити самостійно
}

дія система_перевиділити_сиру_памʼять(система: адреса<мавка::розбирач::Система>, значення: памʼять<п8>, новий_розмір: позитивне): памʼять<п8> {
  вернути пусто як памʼять<п8>; // треба втілити самостійно
}

дія система_звільнити_сиру_памʼять(система: адреса<мавка::розбирач::Система>, значення: невідома_памʼять) {
  // треба втілити самостійно
}

дія дописати_в_стандартний_вихід(система: адреса<мавка::розбирач::Система>, потік: адреса<мавка::розбирач::ВихіднийПотік>, розмір: позитивне, дані: памʼять<п8>): логічне {
  // треба втілити самостійно
  вернути так;
}

дія старт(): ц32 {
  ціль значення_ю8 = ю8"2 + 2 * 2";

  ціль система = мавка::розбирач::Система {
    дані = пусто,
    виділити_сиру_памʼять = система_виділити_сиру_памʼять,
    перевиділити_сиру_памʼять = система_перевиділити_сиру_памʼять,
    звільнити_сиру_памʼять = система_звільнити_сиру_памʼять,
  };
  ціль потік_в_стандартний_вихід = мавка::розбирач::ВихіднийПотік {
    дані = пусто,
    дописати = дописати_в_стандартний_вихід
  };

  змінна ціль слова = мавка::розбирач::Слова { 0, пусто };
  змінна ціль помилка_розбору_на_слова = мавка::розбирач::ПомилкаРозборуНаСлова { ... };
  якщо мавка::розбирач::розібрати_ю8_на_слова(система::адреса, значення_ю8, слова::адреса, помилка_розбору_на_слова::адреса) == ні {
    ціль рядок = мавка::розбирач::отримати_рядок_помилки_розбору_на_слова(система::адреса, помилка_розбору_на_слова);
    ціль стовпець = мавка::розбирач::отримати_стовпець_помилки_розбору_на_слова(система::адреса, помилка_розбору_на_слова);
    ціль ю8_помилки = ю8 { ... };
    якщо мавка::розбирач::отримати_ю8_помилки_розбору_на_слова(система::адреса, помилка_розбору_на_слова, ю8_помилки::адреса) {
      // надрукувати помилку
      мавка::розбирач::звільнити_памʼять(система::адреса, ю8_помилки.дані);
    }
    мавка::розбирач::звільнити_помилку_розбору_на_слова(система::адреса, помилка_розбору_на_слова);
    вернути 1;
  }
  мавка::розбирач::вивести_слова(система::адреса, потік_в_стандартний_вихід::адреса, значення_ю8, слова);

  змінна ціль гілки = мавка::розбирач::Гілки { 0, пусто };
  змінна ціль помилка_розбору_на_гілки = мавка::розбирач::ПомилкаРозборуНаГілки { ... };
  якщо мавка::розбирач::розібрати_слова_на_гілки(система::адреса, слова, гілки::адреса, помилка_розбору_на_гілки::адреса) == ні {
    ціль рядок = мавка::розбирач::отримати_рядок_помилки_розбору_на_гілки(система::адреса, помилка_розбору_на_гілки);
    ціль стовпець = мавка::розбирач::отримати_стовпець_помилки_розбору_на_гілки(система::адреса, помилка_розбору_на_гілки);
    ціль ю8_помилки = ю8 { ... };
    якщо мавка::розбирач::отримати_ю8_помилки_розбору_на_гілки(система::адреса, помилка_розбору_на_гілки, ю8_помилки::адреса) {
      // надрукувати помилку
      мавка::розбирач::звільнити_памʼять(система::адреса, ю8_помилки.дані);
    }
    мавка::розбирач::звільнити_слова(система::адреса, слова);
    мавка::розбирач::звільнити_помилку_розбору_на_гілки(система::адреса, помилка_розбору_на_гілки);
    вернути 1;
  }
  мавка::розбирач::вивести_гілки(система::адреса, потік_в_стандартний_вихід::адреса, значення_ю8, слова, гілки);

  мавка::розбирач::звільнити_слова(система::адреса, слова);
  мавка::розбирач::звільнити_гілки(система::адреса, гілки);

  вернути 0;
}
```

## Тестувати

```shell
sh збудувати_тестувальник.sh
sh тестувати.sh ./тестувальник
```