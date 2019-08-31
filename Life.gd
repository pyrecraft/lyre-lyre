extends Sprite

const initial_state = preload('res://godot_redux/initial_state.gd')

var health
var current_level

# Called when the node enters the scene tree for the first time.
func _ready():
	store.subscribe(self, "_on_store_changed")
	var init_state = initial_state.get_state()
	health = init_state['player']['health']
	current_level = init_state['game']['current_level']

func _on_store_changed(name, state):
	if state.has('health') and health != state['health'] and current_level != 1:
		health = state['health']
		if health == 0:
			print("you died!")
			store.dispatch(action_creators.game_set_display_scene(utils.DisplayScene.DEATH))
		else:
			frame = frame + 1
	if state.has('current_level') and current_level != state['current_level']:
		current_level = state['current_level']