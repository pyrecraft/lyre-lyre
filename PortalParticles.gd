extends CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if store.get_state() != null and store.get_state()['game']['current_level'] != null:
		var current_level = store.get_state()['game']['current_level']
		store.dispatch(action_creators.game_set_current_level(current_level + 1))
	store.dispatch(action_creators.game_set_display_scene(utils.DisplayScene.INTRO))