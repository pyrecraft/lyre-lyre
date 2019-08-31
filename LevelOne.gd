extends Node

func _ready():
	store.dispatch(action_creators.game_set_camera_limit_right(get_tilemap_limit_right()))

func get_tilemap_limit_right():
	var used_cells = $LevelOneTileMap.get_used_cells()
	var max_x = 0
	for pos in used_cells:
		if pos.x > max_x:
			max_x = int(pos.x)
	return max_x * 64