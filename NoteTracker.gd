extends Sprite

const initial_state = preload('res://godot_redux/initial_state.gd')
const note = preload("res://Note.tscn")

var test_notes_to_render = [0, 1, 0, 1, 0, 5, 0, 1, 0, 5, 0, 1, 0, 1, 0, 5, 0, 1, 0, 5, 0, 1, 0, 1, 0, 5, 0, 1, 0, 5, 0, 1, 0, 1, 0, 5, 0, 1, 0, 5, 0, 1, 0, 1, 0, 5, 0, 1, 0, 5, 0, 1, 0, 1, 0, 5, 0, 1, 0, 5, 0, 1, 0, 1, 0, 5, 0, 1, 0, 5]
var level_one_notes = [
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0,
	1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0,
	5, 0, 0, 0, 5, 0, 0, 0, 5, 0, 0, 0, 5, 0, 0, 0,
	1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0,
	5, 0, 3, 0, 5, 0, 3, 0, 6, 0, 5, 0, 6, 0, 5, 0,
	5, 0, 3, 0, 5, 0, 3, 0, 6, 0, 5, 0, 5, 4, 3, 2,
	1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0,
	5, 0, 0, 0, 5, 0, 0, 0, 5, 0, 0, 0, 5, 0, 0, 0,
	1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0,
	5, 0, 3, 0, 5, 0, 3, 0, 6, 0, 5, 0, 6, 0, 5, 0
]
var level_two_notes = [
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0,
	1, 0, 5, 0, 1, 0, 5, 0, 4, 0, 4, 0, 4, 0, 4, 0,
	8, 0, 7, 0, 6, 0, 5, 0, 8, 0, 5, 0, 3, 0, 1, 0,
	1, 0, 5, 0, 1, 0, 5, 0, 4, 0, 4, 0, 4, 0, 4, 0,
	8, 0, 7, 0, 6, 0, 5, 0, 8, 0, 5, 0, 3, 0, 1, 0,
	1, 0, 3, 0, 5, 0, 8, 0, 1, 0, 3, 0, 5, 0, 8, 0,
	7, 8, 6, 7, 7, 8, 6, 7, 8, 0, 5, 0, 3, 0, 1, 0,
	1, 0, 5, 0, 1, 0, 5, 0, 4, 0, 4, 0, 4, 0, 4, 0,
	8, 0, 7, 0, 6, 0, 5, 0, 8, 0, 5, 0, 3, 0, 1, 0,
	1, 0, 5, 0, 1, 0, 5, 0, 4, 0, 4, 0, 4, 0, 4, 0,
	8, 0, 7, 0, 6, 0, 5, 0, 8, 0, 5, 0, 3, 0, 1, 0,
	1, 0, 3, 0, 5, 0, 8, 0, 1, 0, 3, 0, 5, 0, 8, 0,
	7, 8, 6, 7, 7, 8, 6, 7, 8, 0, 5, 0, 3, 0, 1, 0,
]
var level_three_notes = [
	0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	1, 4, 3, 2, 1, 4, 3, 2, 1, 4, 3, 2, 1, 0, 1, 0,
	1, 3, 5, 8, 1, 3, 5, 8, 8, 5, 3, 1, 8, 5, 3, 1,
	7, 8, 6, 7, 7, 8, 6, 7, 8, 0, 5, 0, 3, 0, 1, 0,
	1, 3, 5, 8, 1, 3, 5, 8, 8, 5, 3, 1, 8, 5, 3, 1,
	7, 8, 6, 7, 7, 8, 6, 7, 8, 0, 5, 0, 3, 0, 1, 0,
	1, 4, 3, 2, 1, 4, 3, 2, 1, 4, 3, 2, 1, 0, 1, 0,
	1, 3, 5, 8, 1, 3, 5, 8, 8, 5, 3, 1, 8, 5, 3, 1,
	7, 8, 6, 7, 7, 8, 6, 7, 8, 0, 5, 0, 3, 0, 1, 0,
	1, 3, 5, 8, 1, 3, 5, 8, 8, 5, 3, 1, 8, 5, 3, 1,
	7, 8, 6, 7, 7, 8, 6, 7, 8, 0, 5, 0, 3, 0, 1, 0,
]

var max_visible_notes_allowed = 12
var distance_apart = 50
var current_notes_visible = []
var working_notes = []

var beat_count
var current_level

func get_notes(level):
	match level:
		1:
			return level_one_notes
		2:
			return level_two_notes
		3:
			return level_three_notes
	return test_notes_to_render

# Called when the node enters the scene tree for the first time.
func _ready():
	store.subscribe(self, "_on_store_changed")
	var init_state = initial_state.get_state()
	beat_count = init_state['game']['beat_count']
	current_level = init_state['game']['current_level']

func render_initial_notes():
	working_notes = get_notes(current_level).duplicate()
	for i in range(max_visible_notes_allowed):
		var next_x_position = (i * distance_apart) - (distance_apart * 2)
		var next_note = note.instance()
		next_note.position.x = next_x_position
		next_note.position.y = 0
		next_note.set_num_text(working_notes[i])
		add_child(next_note)
		current_notes_visible.push_back(next_note)
	for i in range(max_visible_notes_allowed):
		working_notes.pop_front()

func update_notes():
	for i in range(current_notes_visible.size()):
		var current_note = current_notes_visible[i]
		if i == 0:
			if current_note.is_failure():
#				print ("Found failed note")
				if store.get_state()['player'] and store.get_state()['player']['health']:
					store.dispatch(action_creators.player_set_health(store.get_state()['player']['health'] - 1))
			current_note.queue_free()
		else:
			if i == 2 and current_note.get_num_text() != "" and !current_note.is_success_or_failure():
#				print("Setting note to failure from update_notes")
				current_note.set_background_failure()
			current_note.position.x -= distance_apart
#	print("Popping " + str(current_notes_visible.front()))
	current_notes_visible.pop_front()
	var next_note_num = working_notes.pop_front()
	var next_note = note.instance()
	next_note.set_num_text(next_note_num)
	next_note.position.x = (max_visible_notes_allowed - 1) * distance_apart - (distance_apart * 2)
	next_note.position.y = 0
	add_child(next_note)
	current_notes_visible.push_back(next_note)

func _on_store_changed(name, state):
	if state.has('beat_count') and state['beat_count'] != beat_count and current_notes_visible.size() == max_visible_notes_allowed:
		beat_count = state['beat_count']
#		print(state)
		update_notes()
		handle_note_logic()
#		print(level_three_notes.size())
#		print(working_notes.size())
	if state.has('current_level') and state['current_level'] != current_level:
		current_level = state['current_level']
		render_initial_notes()

func _input(event):
	if event.is_pressed() and not event.is_echo() and utils.is_playing_lyre():
		var next_note = current_notes_visible[2]
		if next_note.get_num_text() == "":
			return
		if is_right_notes_played():
			next_note.set_background_success()
		else:
			next_note.set_background_failure()
			pass
		
func handle_note_logic():
	var next_note = current_notes_visible[2]
	
	if next_note.get_num_text() == "":
		return
	
	if is_right_notes_played():
		next_note.set_background_success()
	else:
		pass

func is_right_notes_played():
	var correct_note_to_play = current_notes_visible[2].get_num_text()
	var notes_played = utils.get_notes_played()
	# Assumes 1 note allowed per beat
	if notes_played.size() == 0 or notes_played.size() > 1:
		return false
	var note_that_player_played = str(notes_played[0])
	return str(note_that_player_played) == str(correct_note_to_play)