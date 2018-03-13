#!/bin/bash

# Create driver example
server='http://stan.test.gurtam.net:8030/wialon/ajax.html'
sid='020515ff4122927a84e08814afbde1ba'
svc='report/update_report'

cp='"cp":"[\"\",{},{\"p\":\"time_begin\",\"m\":\"мишань\"},{}]"'



trips='{l":"Поездки","c":"[\"time_begin\",\"time_end\",\"user_column\",\"location_begin\",\"coord_begin\",\"location_end\",\"coord_end\",\"driver\",\"trailer\",\"passengers_count\",\"duration\",\"duration_ival\",\"duration_prev\",\"duration_next\",\"eh_duration\",\"mileage\",\"correct_mileage\",\"urban_mileage\",\"suburban_mileage\",\"absolute_mileage_begin\",\"absolute_mileage_end\",\"toll_roads_mileage\",\"toll_roads_cost\",\"avg_speed\",\"max_speed\",\"trips_count\",\"counter_sensors\",\"initial_counter_sensors\",\"final_counter_sensors\",\"avg_engine_rpm\",\"max_engine_rpm\",\"avg_temp\",\"min_temp\",\"max_temp\",\"beg_temp\",\"end_temp\",\"info_event\",\"loading_avg_weight\",\"msgs_count\",\"fuel_consumption_all\",\"fuel_consumption_imp\",\"fuel_consumption_abs\",\"fuel_consumption_ins\",\"fuel_consumption_fls\",\"fuel_consumption_math\",\"fuel_consumption_rates\",\"fuel_consumption_imp_rates\",\"fuel_consumption_abs_rates\",\"fuel_consumption_ins_rates\",\"fuel_consumption_fls_rates\",\"avg_fuel_consumption_all\",\"avg_fuel_consumption_imp\",\"avg_fuel_consumption_abs\",\"avg_fuel_consumption_ins\",\"avg_fuel_consumption_fls\",\"avg_fuel_consumption_math\",\"avg_fuel_consumption_rates\",\"avg_fuel_consumption_idle_imp\",\"avg_fuel_consumption_idle_abs\",\"avg_fuel_consumption_idle_ins\",\"avg_fuel_consumption_idle_fls\",\"avg_fuel_consumption_idle_math\",\"avg_fuel_consumption_idle_rates\",\"dist_fuel_consumption_imp\",\"dist_fuel_consumption_abs\",\"dist_fuel_consumption_ins\",\"dist_fuel_consumption_fls\",\"dist_fuel_consumption_math\",\"dist_fuel_consumption_rates\",\"fuel_level_begin\",\"fuel_level_end\",\"fuel_level_max\",\"fuel_level_min\",\"ecodriving\",\"ecodriving_mark\",\"dummy\"]","n":"unit_trips","cl":"[\"Начало\",\"Конец\",\"valeron\",\"Нач. положение\",\"Нач. координаты\",\"Кон. положение\",\"Кон. координаты\",\"Водитель\",\"Прицеп\",\"Кол-во пассажиров\",\"Длительность\",\"Общее время\",\"Время между\",\"Время до следующей\",\"Моточасы\",\"Пробег\",\"Пробег (скорректированный)\",\"Городской пробег\",\"Загородный пробег\",\"Начальный пробег\",\"Конечный пробег\",\"Пробег по платным дорогам\",\"Стоимость платных дорог\",\"Ср. скорость\",\"Макс. скорость\",\"Количество поездок\",\"Счетчик\",\"Нач. счетчик\",\"Кон. счетчик\",\"Ср. обороты двигателя\",\"Макс. обороты двигателя\",\"Ср. температура\",\"Мин. температура\",\"Макс. температура\",\"Нач. температура\",\"Кон. температура\",\"Статус\",\"Вес груза\",\"Кол-во сообщений\",\"Потрачено\",\"Потрачено по ДИРТ\",\"Потрачено по ДАРТ\",\"Потрачено по ДМРТ\",\"Потрачено по ДУТ\",\"Потрачено по расчету\",\"Потрачено по нормам\",\"Отклонение расхода по ДИРТ\",\"Отклонение расхода по ДАРТ\",\"Отклонение расхода по ДМРТ\",\"Отклонение расхода по ДУТ\",\"Ср. расход\",\"Ср. расход по ДИРТ\",\"Ср. расход по ДАРТ\",\"Ср. расход по ДМРТ\",\"Ср. расход по ДУТ\",\"Ср. расход по расчету\",\"Ср. расход по нормам\",\"Ср. расход на холостом ходу по ДИРТ\",\"Ср. расход на холостом ходу по ДАРТ\",\"Ср. расход на холостом ходу по ДМРТ\",\"Ср. расход на холостом ходу по ДУТ\",\"Ср. расход на холостом ходу по расчету\",\"Ср. расход на холостом ходу по нормам\",\"Ср. пробег по ДИРТ на единицу топлива\",\"Ср. пробег по ДАРТ на единицу топлива\",\"Ср. пробег по ДМРТ на единицу топлива\",\"Ср. пробег по ДУТ на единицу топлива\",\"Ср. пробег по расчету на единицу топлива\",\"Ср. пробег по нормам на единицу топлива\",\"Нач. уровень\",\"Кон. уровень\",\"Макс. уровень топлива\",\"Мин. уровень топлива\",\"Штраф\",\"Оценка\",\"Заметки\"]","sl":"","s":"","f":4368,"sch":{"y":0,"m":0,"w":0,"f1":0,"f2":0,"t1":0,"t2":0},"p":""}'






engine_hours='{"l":"Моточасы","c":"[\"time_begin\",\"time_end\",\"duration\",\"user_column\"]","n":"unit_engine_hours","cl":"[\"Начало\",\"Конец\",\"Моточасы\",\"User column\"]","sl":"","s":"","f":0,"sch":{"y":0,"m":0,"w":0,"f1":0,"f2":0,"t1":0,"t2":0},"p":""}'
svodka='{"l":"Сводка","c":"[\"mileage\",\"mileage_all\",\"user_column\"]","n":"unit_generic","cl":"[\"Пробег в поездках\",\"Пробег по всем сообщениям\",\"User column\"]","sl":"","s":"","f":0,"sch":{"y":0,"m":0,"w":0,"f1":0,"f2":0,"t1":0,"t2":0},"p":"{\"custom_interval\":{\"type\":\"0\"}}"}'

params='{"n":"18271u","ct":"avl_unit","p":"{\"bind\":null}","tbl":['$trips','$engine_hours','$svodka'],"id":13,"itemId":70643,"callMode":"update"}'
resp=`curl -s "$server?svc=$svc&sid=$sid" --data-urlencode "params=$params"`
echo $resp

	#mresp=''
	#echo $mresp
	#if [ "$mresp" != "$resp" ];
	#	then error "resource/1$rname"
	#fi

