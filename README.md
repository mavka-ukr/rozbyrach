# Розбирач Мавки

Вручну написаний мовою Ціль розбирач Мавки.

## Приклад

```ціль
взяти визначення розбирач;

дія система_виділити_сиру_памʼять(система: адреса<мавка::розбирач::Система>, розмір: позитивне): памʼять<п8> {
  // треба втілити
}

дія система_перевиділити_сиру_памʼять(система: адреса<мавка::розбирач::Система>, значення: памʼять<п8>, новий_розмір: позитивне): памʼять<п8> {
  // треба втілити
}

дія система_звільнити_сиру_памʼять(система: адреса<мавка::розбирач::Система>, значення: невідома_памʼять) {
  // треба втілити
}

дія система_померти(система: адреса<мавка::розбирач::Система>, код: ціле) {
  // треба втілити
}

дія дописати_в_стандартний_вихід(система: адреса<мавка::розбирач::Система>, потік: адреса<мавка::розбирач::ВихіднийПотік>, розмір: позитивне, дані: памʼять<п8>): логічне {
  // треба втілити
}

дія старт(кількість_аргументів: ц32, аргументи: памʼять<памʼять<п8>>): ц32 {
  ціль значення_ю8 = ю8"2 + 2 * 2";

  ціль система = мавка::розбирач::Система {
    дані = пусто,
    виділити_сиру_памʼять = система_виділити_сиру_памʼять,
    перевиділити_сиру_памʼять = система_перевиділити_сиру_памʼять,
    звільнити_сиру_памʼять = система_звільнити_сиру_памʼять,
    померти = система_померти,
  };
  ціль потік_в_стандартний_вихід = мавка::розбирач::ВихіднийПотік {
    дані = пусто,
    дописати = дописати_в_стандартний_вихід
  };

  ціль слова = мавка::розбирач::Слова { 0, пусто };
  змінна ціль позиція_помилки_розбору_на_слова: позитивне = 0;
  якщо мавка::розбирач::розібрати_ю8_на_слова(система::адреса, значення_ю8, слова::адреса, позиція_помилки_розбору_на_слова::адреса) == ні {
    вернути 1;
  }
  мавка::розбирач::вивести_слова(система::адреса, потік_в_стандартний_вихід::адреса, слова);

  ціль гілки = мавка::розбирач::Гілки { 9, пусто };
  змінна ціль позиція_слова_помилки_розбору_на_гілки: позитивне = 0;
  якщо мавка::розбирач::розібрати_слова_на_гілки(система::адреса, слова, гілки::адреса, позиція_слова_помилки_розбору_на_гілки::адреса) == ні {
    вернути 1;
  }
  мавка::розбирач::вивести_гілки(система::адреса, потік_в_стандартний_вихід::адреса, гілки);

  вернути 0;
}
```