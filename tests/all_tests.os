#Использовать asserts
#Использовать ".."

Перем ПутьКТаблице;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    ВсеТесты = Новый Массив;    
    ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеЛистовКниги");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеДанныхЛистов");
	
    Возврат ВсеТесты;

КонецФункции

Процедура ТестДолжен_ПроверитьПолучениеДанныхЛистов() Экспорт
	Книга = Новый КнигаЭксель(ПутьКТаблице);
	Книга.Прочитать();	

	Лист = Книга.ЛистПоНомеру(1);
	
	Ожидаем.Что(Лист.ЗначениеЯчейкиПоАдресу("E1"), 
				"Получение булево истина").Равно(Истина);

	Ожидаем.Что(Лист.ЗначениеЯчейкиПоАдресу("E2"), 
				"Получение булево ложь").Равно(Ложь);

	Ожидаем.Что(Лист.ЗначениеЯчейкиПоАдресу("D2"), 
				"Получение строки").Равно("строка 2");
	
	Ожидаем.Что(Лист.ЗначениеЯчейкиПоАдресу("B1"), 
				"Получение даты 1").Равно(Дата("20210101"));

	Ожидаем.Что(Лист.ЗначениеЯчейкиПоАдресу("B2"), 
				"Получение даты 2").Равно(Дата("20210102"));

	Ожидаем.Что(Лист.ЗначениеЯчейкиПоАдресу("B3"), 
				"Получение даты 3").Равно(Дата("20210103"));

	Ожидаем.Что(Лист.ЗначениеЯчейкиПоАдресу("B4"), 
				"Получение даты 4").Равно(Дата("20210104"));

	Ожидаем.Что(Лист.ЗначениеЯчейкиПоКоординатам(2,4), 
				"Получение строки по координатам").Равно("строка 2");

	ТЗ = Лист.ТаблицаПоДиапазону("A1:H5");

	Ожидаем.Что(ТЗ.Количество(), 
				"Количество строк тз 5").Равно(5);

	Ожидаем.Что(ТЗ.Колонки.Количество(), 
				"Количество колонок тз 8").Равно(8);

	Ожидаем.Что(ТЗ[0].Колонка1, 
				"Значение в таблице").Равно("1");

КонецПроцедуры


Процедура ТестДолжен_ПроверитьПолучениеЛистовКниги() Экспорт
	Книга = Новый КнигаЭксель(ПутьКТаблице);
	Книга.Прочитать();	

	Ожидаем.Что(Книга.КоличествоЛистов(), 
				"Листов в книге два").Равно(2);

	Ожидаем.Что(Книга.ЛистПоНомеру(3), 
				"Лист по номеру 3 не найден").Равно(Неопределено);

	Ожидаем.Что(Книга.ЛистПоИмени("нет имени"), 
				"Лист по имени не найден").Равно(Неопределено);

	Ожидаем.Что(не Книга.ЛистПоНомеру(1) = Неопределено, 
				"Лист по номеру 1 найден").Равно(Истина);

	Ожидаем.Что(не Книга.ЛистПоИмени("Второй лист") = Неопределено, 
				"Лист по номеру имени найден").Равно(Истина);

КонецПроцедуры

Процедура ПередЗапускомТеста() Экспорт
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
КонецПроцедуры

ПутьКТаблице = ОбъединитьПути(ТекущийСценарий().Каталог, "Книга1.xlsx");