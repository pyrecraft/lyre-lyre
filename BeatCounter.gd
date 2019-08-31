extends RichTextLabel

#const initial_state = preload('res://godot_redux/initial_state.gd')
#
#var game_time_seconds
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	store.subscribe(self, "_on_store_changed")
#	var init_state = initial_state.get_state()
#	game_time_seconds = init_state['game']['game_time_seconds']
#
#func set_text(new_text):
#	text = new_text

#func _on_store_changed(name, state):
#	if state.has('game_time_seconds') and state['game_time_seconds'] != game_time_seconds:
#		game_time_seconds = state['game_time_seconds']
#		set_text(str((game_time_seconds % 4) + 1))

#func _process(delta):
#	rect_global_position.x = clamp(rect_global_position.x, 50, 1000)