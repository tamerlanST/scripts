proc register {date} {
	set date1 [clock scan $date]
	set file_name "res_$date.log"
	set file_content [adf_read_file $file_name]
	set odometer 20000
	variable ss
	#### get resource "wialon"
	set res [adf_cast_i_avl_resource [$ss get_item_by_id "5"]]
	if {$res == "NULL"} {
		print "res null"
		return
	}
	### get driver plugin
	set drv_pl [adf_cast_i_avl_drivers_plugin $res]
	if {$drv_pl == "NULL"} {
		print "drv_pl null"
		return
	}
	## get driver
	#set drv [$drv_pl get_driver "1"]
	set drv [$drv_pl get_driver_by_code "10000007895050"]
	print [$drv get_name]	
	
	set lines [split $file_content "\n"]
	set last_time 0
	
	foreach line $lines {
		foreach {activity duration time} $line {
			set activity [string map {"," ""} $activity]
			set time_1 [string map {"(" "" ")" ""} $time]
			
			set time_1 [clock scan $time_1 -base $date1]
		
			print "[$drv_pl register_activity $drv $activity [expr $time_1 - $duration * 60] 1 $odometer 2 $duration] - $activity $duration $time $time_1 $odometer"
			
			incr odometer $duration
			set last_time $time_1
		}
	}
}

register "2016-03-10"
register "2016-03-11"

return