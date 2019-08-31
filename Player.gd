extends KinematicBody2D

const initial_state = preload('res://godot_redux/initial_state.gd')
const note_emission = preload('res://NoteEmission.tscn')

var gravity
var walk_speed
var jump_speed
var camera_limit_right

var velocity = Vector2()

func _ready():
	store.subscribe(self, "_on_store_changed")
	var init_state = initial_state.get_state()
	gravity = init_state['game']['gravity']
	walk_speed = init_state['player']['walk_speed']
	jump_speed = init_state['player']['jump_speed']
	camera_limit_right = init_state['game']['camera_limit_right']

func set_velocities(delta):
	velocity.x = 0
	velocity.y += gravity * delta
	if Input.is_action_pressed("ui_right"):
		velocity.x += walk_speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= walk_speed
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = jump_speed

	velocity = move_and_slide(velocity, Vector2(0, -1))

func clamp_pos_to_screen():
	position.x = clamp(position.x, 0, camera_limit_right)
#	position.y = clamp(position.y, 0, screen_size.y)

func _physics_process(delta):
	set_velocities(delta)
	handle_animation()
	clamp_pos_to_screen()

func _input(event):
	if event.is_pressed() and not event.is_echo() and utils.is_playing_lyre():
		if Input.is_key_pressed(utils.keys[0]):
			var add_note = note_emission.instance()
			self.add_child(add_note)
			add_note.set_color("67b6bd")
		if Input.is_key_pressed(utils.keys[1]):
			var add_note = note_emission.instance()
			self.add_child(add_note)
			add_note.set_color("7869c4")
		if Input.is_key_pressed(utils.keys[2]):
			var add_note = note_emission.instance()
			self.add_child(add_note)
			add_note.set_color("8b3f96")
		if Input.is_key_pressed(utils.keys[3]):
			var add_note = note_emission.instance()
			self.add_child(add_note)
			add_note.set_color("b86962")
		if Input.is_key_pressed(utils.keys[4]):
			var add_note = note_emission.instance()
			self.add_child(add_note)
			add_note.set_color("bfce72")
		if Input.is_key_pressed(utils.keys[5]):
			var add_note = note_emission.instance()
			self.add_child(add_note)
			add_note.set_color("94e089")
		if Input.is_key_pressed(utils.keys[6]):
			var add_note = note_emission.instance()
			self.add_child(add_note)
			add_note.set_color("55a049")
		if Input.is_key_pressed(utils.keys[7]):
			var add_note = note_emission.instance()
			self.add_child(add_note)
			add_note.set_color("2399bd")

func _on_store_changed(name, state):
	if state.has('gravity'):
		gravity = state['gravity']
	if state.has('camera_limit_right'):
		camera_limit_right = state['camera_limit_right']
		$Camera2D.limit_right = camera_limit_right
	if state.has('walk_speed'):
		walk_speed = state['walk_speed']
	if state.has('jump_speed'):
		jump_speed = state['jump_speed']	

func handle_animation():
	if velocity.x != 0:
		$Sprite.flip_h = velocity.x < 0
	if !is_on_floor():
		if utils.is_playing_lyre():
			$AnimationPlayer.play("jump_and_play_lyre")
		else:
			$AnimationPlayer.play("jump_right")
	elif abs(velocity.x) == 0:
		if utils.is_playing_lyre():
			$AnimationPlayer.play("play_lyre")
		else:
			$AnimationPlayer.play("stand_right")
	else:
		if utils.is_playing_lyre():
			$AnimationPlayer.play("walk_and_play_lyre")
		else:
			$AnimationPlayer.play("walk_right")
