extends Node

const keys = [KEY_A, KEY_S, KEY_D, KEY_F, KEY_G, KEY_H, KEY_J, KEY_K]

const intro_text_by_level = [
	"",
	"Chapter One\n\nThe First Pitch"
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

static func get_transition_text(level):
	return intro_text_by_level[level]

static func get_level_scene(level):
	match level:
		1:
			return load('res://LevelOne.tscn')