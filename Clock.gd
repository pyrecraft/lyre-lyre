extends Sprite

const initial_state = preload('res://godot_redux/initial_state.gd')

var game_time_seconds
var current_level

const next_frame_clock_points = [4, 8, 12, 15, 19, 23, 27, 30, 34, 38, 42, 45, 49, 53, 56, 58, 60]

func _ready():
	store.subscribe(self, "_on_store_changed")
	var init_state = initial_state.get_state()
	current_level = init_state['game']['current_level']
	game_time_seconds = init_state['game']['game_time_seconds']
	$Timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Timer_timeout():
#	print("Timer!")
	if store.get_state() != null and store.get_state()['game']['game_time_seconds'] != null:
		var game_time_seconds = store.get_state()['game']['game_time_seconds'] - 1
		store.dispatch(action_creators.game_set_game_time_seconds(game_time_seconds))
		$RichTextLabel.text = str(game_time_seconds)
		if game_time_seconds == -1:
			store.dispatch(action_creators.game_set_display_scene(utils.DisplayScene.DEATH))
		elif game_time_seconds == 0:
			frame = 0
		else:
			for i in range(next_frame_clock_points.size()):
				if 60 - game_time_seconds == next_frame_clock_points[i]:
					frame += 1

func _on_store_changed(name, state):
	if state.has('current_level') and state['current_level'] != current_level:
		current_level = state['current_level']