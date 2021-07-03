/*
var/list/saiyan_pod_shuttlecomp = list()
var/list/saiyan_pod_cameracomp = list()
var/list/saiyan_pod_mobile_port = list()
var/list/saiyan_pod_stationary_port = list()
*/
////////////////////////////////////////////////////////////////////////////
/obj/machinery/computer/shuttle/saiyan_pod
	name = "saiyan pod console"
	shuttleId = "saiyan_pod"
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = COLOR_SOFT_RED
	possible_destinations = "saiyan_pod_away;saiyan_pod_home;saiyan_pod_custom"

/*
/obj/machinery/computer/shuttle/saiyan_pod/Initialize()
	saiyan_pod_shuttlecomp += src
	shuttleId = "saiyan_pod[saiyan_pod_shuttlecomp.len]"
	possible_destinations = "saiyan_pod[saiyan_pod_shuttlecomp.len]_away;saiyan_pod[saiyan_pod_shuttlecomp.len]_home;saiyan_pod[saiyan_pod_shuttlecomp.len]_custom"
	..()

/obj/machinery/computer/shuttle/saiyan_pod/Destroy()
	saiyan_pod_shuttlecomp -= src
	..()*/
//////////////////////////////////////////////////////////////////////////
/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/saiyan_pod
	name = "saiyan pod navigation computer"
	desc = "Used to designate a precise transit location for the saiyan pod."
	shuttleId = "saiyan_pod"
	lock_override = CAMERA_LOCK_STATION
	shuttlePortId = "saiyan_pod_custom"
	x_offset = 9
	y_offset = 0
	see_hidden = FALSE

/*	
/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/saiyan_pod/Initialize()
	saiyan_pod_cameracomp += src
	shuttlePortId = "saiyan_pod[saiyan_pod_cameracomp.len]_custom"
	..()

/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/saiyan_pod/Destroy()
	saiyan_pod_cameracomp -= src
	..()
*/
/////////////////////////////////////////////////////////////////////////
/obj/docking_port/mobile/saiyan_pod
	name = "saiyan pod"
	id = "saiyan_pod"
	rechargeTime = 3 MINUTES
	dwidth = 2
	dheight = 2
	width = 5
	height = 5

/*
/obj/docking_port/mobile/saiyan_pod/Initialize()
	saiyan_pod_mobile_port += src
	id = "saiyan_pod[saiyan_pod_mobile_port.len]"
	..()

/obj/docking_port/mobile/saiyan_pod/Destroy()
	saiyan_pod_mobile_port -= src
	..()
*/
////////////////////////////////////////////////////////////////////////
/obj/docking_port/stationary/saiyan_pod
	name = "saiyan pod"
	id = "saiyan_pod_home"
	dwidth = 5
	dheight = 5
	width = 10
	height = 10
	roundstart_template = /datum/map_template/shuttle/saiyan_pod

/*
/obj/docking_port/stationary/saiyan_pod/Initialize()
	saiyan_pod_stationary_port += src
	id = "saiyan_pod[saiyan_pod_stationary_port.len]_home"
	..()

/obj/docking_port/stationary/saiyan_pod/Destroy()
	saiyan_pod_stationary_port -= src
	..()
*/
//////////////////////////////////////////////////////////////////////////////
/datum/map_template/shuttle/saiyan_pod
	port_id = "saiyan_pod"
	suffix = "default"
	//width = 5
	//height = 5
	can_be_bought = FALSE
