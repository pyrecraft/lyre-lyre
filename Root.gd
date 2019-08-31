extends Node

const initial_state = preload('res://godot_redux/initial_state.gd')
const transition_screen = preload('res://TransitionScreen.tscn')

onready var actions = get_node('/root/action_creators')
onready var reducers = get_node('/root/reducers')
onready var store = get_node('/root/store')

var current_level
var display_scene

func _ready():
	store.create([
		{'name': 'game', 'instance': reducers},
		{'name': 'player', 'instance': reducers}
	], [
		{'name': '_on_store_changed', 'instance': self}
	])
	var init_state = initial_state.get_state()
	current_level = init_state['game']['current_level']
	display_scene = init_state['game']['display_scene']
	store.dispatch(action_creators.game_set_screen_width(get_viewport().size.x))
	store.dispatch(action_creators.game_set_screen_height(get_viewport().size.y))
	store.dispatch(action_creators.game_set_current_level(1))
	store.dispatch(action_creators.game_set_display_scene((utils.DisplayScene.INTRO)))
	
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	
func _on_store_changed(name, state):
	print(state)
	if state.has('current_level') and current_level != state['current_level']:
		current_level = state['current_level']
	if state.has('display_scene') and display_scene != state['display_scene']:
		print('Display Scene changed from ' + str(display_scene) + ' to ' + str(state['display_scene']))
		display_scene = state['display_scene']
		handle_display_scene()

func handle_display_scene():
	if display_scene == utils.DisplayScene.INTRO:
		print('Current Level: ' + str(current_level))
		var next_transition_screen = transition_screen.instance()
		next_transition_screen.set_text(utils.get_transition_text(current_level))
		add_child(next_transition_screen)
	elif display_scene == utils.DisplayScene.PLAYING:
		print("Planning to load level: " + str(current_level))
		var next_level = utils.get_level_scene(current_level).instance()
		clear_level_nodes()
		add_child(next_level)
	elif display_scene == utils.DisplayScene.DEATH:
		print("Planning to load level: " + str(current_level))
		var existing_level = utils.get_level_scene(current_level).instance()
		clear_level_nodes()
		add_child(existing_level)

func _on_Timer_timeout():
	if store.get_state() != null and store.get_state()['game']['game_time_seconds'] != null:
		var curr_seconds = store.get_state()['game']['game_time_seconds']
		store.dispatch(action_creators.game_set_game_time_seconds(curr_seconds + 1))
	$AudioStreamPlayer.play()
	if utils.is_playing_lyre():
		print("Hit note")
	else:
		print("Missed note")

func clear_all_children_nodes():
	for child in get_children():
		child.queue_free()

func clear_level_nodes():
	for child in get_children():
		if 'Level' in child.name:
			child.queue_free()