extends Area2D

const initial_state = preload('res://godot_redux/initial_state.gd')

export var player_x_spawn = 100
export var player_y_spawn = 250

func _on_Pitfall_body_entered(body):
	if "Player" in body.name:
		decrement_health()
		body.position.x = player_x_spawn
		body.position.y = player_y_spawn

func decrement_health():
#	print("Pitfall decrement")
	if store.get_state() and store.get_state()['player']['health']:
		var current_health = store.get_state()['player']['health']
		store.dispatch(action_creators.player_set_health(current_health - 1))