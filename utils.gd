extends Node

const keys = [KEY_A, KEY_S, KEY_D, KEY_F, KEY_G, KEY_H, KEY_J, KEY_K]

const intro_text_by_level = [
	"",
	"Chapter One\n\nThe First Pitch",
	"Chapter Two\n\nThe High Notes",
	"Chapter Three\n\nThe Last Bar"
]

const songs_beats_per_second = [
	0,
	0.5455,
	0.5455,
	0.5455,
	0.5455,
	0.5455,
	0.5455
]

enum DisplayScene {
	NONE,
	INTRO,
	PLAYING,
	DEATH
}

static func is_playing_lyre():
	for key in keys:
		if Input.is_key_pressed(key):
			return true
	return false

static func get_notes_played():
	var notes_played = []
	if Input.is_key_pressed(utils.keys[0]):
		notes_played.push_back(1)
	if Input.is_key_pressed(utils.keys[1]):
		notes_played.push_back(2)
	if Input.is_key_pressed(utils.keys[2]):
		notes_played.push_back(3)
	if Input.is_key_pressed(utils.keys[3]):
		notes_played.push_back(4)
	if Input.is_key_pressed(utils.keys[4]):
		notes_played.push_back(5)
	if Input.is_key_pressed(utils.keys[5]):
		notes_played.push_back(6)
	if Input.is_key_pressed(utils.keys[6]):
		notes_played.push_back(7)
	if Input.is_key_pressed(utils.keys[7]):
		notes_played.push_back(8)
	return notes_played

static func get_transition_text(level):
	return intro_text_by_level[level]

static func get_level_scene(level):
	match level:
		1:
			return load('res://LevelOne.tscn')
		2:
			return load('res://LevelTwo.tscn')
		3:
			return load('res://LevelThree.tscn')