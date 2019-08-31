extends Sprite

const initial_state = preload('res://godot_redux/initial_state.gd')

export var is_even_beat_cloud = true

var beat_count

# Called when the node enters the scene tree for the first time.
func _ready():
	store.subscribe(self, "_on_store_changed")
	var init_state = initial_state.get_state()
	beat_count = init_state['game']['beat_count']

func set_odd_beat_cloud():
	is_even_beat_cloud = false

func _on_store_changed(name, state):
	if state.has('beat_count') and beat_count != state['beat_count']:
		beat_count = state['beat_count']
		if is_even_beat_cloud:
			$StaticBody2D/CollisionShape2D.disabled = beat_count % 4 == 2
		else:
			$StaticBody2D/CollisionShape2D.disabled = beat_count % 4 == 0

		if $StaticBody2D/CollisionShape2D.disabled:
			modulate.a = 0
		else:
			modulate.a = 255