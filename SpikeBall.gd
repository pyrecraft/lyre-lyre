extends Sprite

const initial_state = preload('res://godot_redux/initial_state.gd')

var beat_count
var velocity = Vector2()
var direction = 1
export var speed = 250

func _ready():
	store.subscribe(self, "_on_store_changed")
	var init_state = initial_state.get_state()
	beat_count = init_state['game']['beat_count']

func _on_store_changed(name, state):
	if state.has('beat_count') and beat_count != state['beat_count']:
		beat_count = state['beat_count']
		direction *= -1 

func _physics_process(delta):
	rotate(delta)

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		decrement_health()
	
func decrement_health():
	print("Spikeball decrement")
	if store.get_state() and store.get_state()['player']['health']:
		var current_health = store.get_state()['player']['health']
		store.dispatch(action_creators.player_set_health(current_health - 1))
