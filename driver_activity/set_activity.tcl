set resource_id 6
set driver_id 5
set timestamp [clock seconds]
set time_back [expr {3600*10}]
set activity "3"
set finalize 1
set distance 0
set source 2

set plugin [adf_cast_i_avl_drivers_plugin [$ss get_item_by_id $resource_id]]
set driver [$plugin get_driver $driver_id]
set timestampf [clock format [expr {$timestamp-$time_back}]]
print [$driver get_name]
print $timestampf
set reg [$plugin register_activity $driver $activity [expr {$timestamp-$time_back}] $finalize $distance $source]
print "Request result:"
print $reg



