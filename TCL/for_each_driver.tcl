proc for_each_driver {callback} {
	set ss [adf_storage_get_service]
	if {$ss == "NULL"} {
		return
	}

	set res_col [$ss get_items "avl_resource"]
	if {$res_col == "NULL"} {
		return
	}

	set count [$res_col get_count]
	for {set i 0} {$i < $count} {incr i} {
		set item [$res_col get_item_by_pos $i]
		if {$item == "NULL"} {
			continue
		}

		set pl [adf_cast_i_avl_drivers_plugin $item]
		if {$pl == "NULL"} {
			$item release
			continue
		}

		set drivers [$pl get_drivers]

		if {$drivers == "NULL"} {
			$item release
			continue
		}

		set drv_cnt [$drivers get_count]
		for {set j 0} {$j < $drv_cnt} {incr j} {
			set drv_item [$drivers get_item_by_pos $j]
			if {$drv_item == "NULL"} {
				continue
			}

			set drv [adf_cast_i_avl_driver $drv_item]
			if {$drv == "NULL"} {
				$drv_item release
				continue
			}

			set unit_id [$drv get_binded_unit_id]
			set unit_item [$ss get_item_by_id $unit_id]
			set unit [adf_cast_i_avl_unit $unit_item]

			$callback $drv $item $unit
			$drv_item release
			if {$unit != "NULL"} {
				$unit release
			}
		}

		$item release
	}

	$res_col release
	$ss release
}

proc find_event_drat {drv item unit} {
	if {$unit == "NULL"} {
		return
	}

	set res [adf_cast_i_avl_resource $item]

	if {$res == "NULL"} {
		return
	}

	set drat [$unit get_property_int 1 "drat"]

	if {$drat == 1} {
		set activities [$drv get_activities]
		if {$activities == "NULL"} {
			return
		}

		set act_cnt [$activities get_count]

		if {$act_cnt > 100} {
			print "[$res get_name] [$drv get_name] $drat"
		}

	}

}

for_each_driver find_event_drat