GLOBAL_LIST_INIT(town_positions, list(
	"Mayor",
	"Secretary",
	"Sheriff",
	"Deputy",
	"Detective",
	"WcDonalds Chef",
	"Town Farmer",
	"Doctor",
	"Scientist",
	"Chief Engineer",
	"Engineer",
	"Warehouse Manager",
	"Warehouse Crew",
	"Trash Man",
	"Lawyer",
	"News Anchor",
	"Civilian"))

// job categories for rendering the late join menu
GLOBAL_LIST_INIT(ms13_position_categories, list(
	EXP_TYPE_TOWN= list("jobs" = town_positions, "color" = "#4feb64")
))

GLOBAL_LIST_INIT(ms13_exp_jobsmap, list(
	EXP_TYPE_TOWN = list("titles" = town_positions)
))

GLOBAL_PROTECT(ms13_exp_jobsmap)
