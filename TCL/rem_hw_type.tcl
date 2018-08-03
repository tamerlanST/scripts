# Скрипт для проверки объектов и удаления оборудования
# 1. На сайте gurtam получаем список приборов заданного типа оборудования (производителя) и создаем list
# https://gurtam.com/en/hw-manufacturers/assetlink-global //manufacter
# https://gurtam.com/en/gps-hardware/soft/assetlink  //device
set HW_device0 {cGuard Personal}
set HW_device1 {cGuard Personal}
set HW_device2 {cGuard Personal}

set hw_list [list $HW_device0 $HW_device1 $HW_device2]

# 2. Проверяем объекты на hw_type, чтобы таких не было

set units_col [$ss get_items "avl_unit"]
for {set i 0} {$i < [$units_col get_count]} {incr i} {
    set unit [adf_cast_i_avl_unit [$units_col get_item_by_pos $i]]
    if {$unit == "NULL"} {
        continue
    }
    set hw_type [$unit get_hw_type]
    if {$hw_type != "NULL"} {
        set hw_name [$hw_type get_name]
        if {[lsearch -exact $hw_list $hw_name] != -1} {
            #свписок юнитов
            print $hw_name [$unit get_name]  
            #удалить юниты
            print [$unit delete_item]
        }
        $hw_type release
    }
    $unit release
}
$units_col release
return

# 3. Удаляем на lic-сервере указаного производителя из лицензии

# 4. Удаляем hw_type по списку

set col [adf_sort_col [$ss get_items "avl_hw"] 1]
if {$col != "NULL"} {
    for {set i 0} {$i < [$col get_count]} {incr i} {
        set hw [adf_cast_i_avl_hw_type [$col get_item_by_pos $i]]
        if {$hw == "NULL"} { continue }
        set hw_name [$hw get_name]
        if {[lsearch -exact $hw_list $hw_name] != -1} {
            print "$hw_name : [$hw delete_item]"
        }
        $hw release
    }
}
$col release
return