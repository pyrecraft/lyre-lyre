extends Node

const keys = [KEY_W, KEY_E, KEY_R, KEY_T, KEY_Y, KEY_U, KEY_I, KEY_O]

onready var low_c_note = preload('res://audio/harp-low-c.wav')
onready var d_note = preload('res://audio/harp-d.wav')
onready var e_note = preload('res://audio/harp-e.wav')
onready var f_note = preload('res://audio/harp-f.wav')
onready var g_note = preload('res://audio/harp-g.wav')
onready var a_note = preload('res://audio/harp-a.wav')
onready var b_note = preload('res://audio/harp-b.wav')
onready var high_c_note = preload('res://audio/harp-high-c.wav')

const is_playing = false

func _input(event):
	if !is_playing:
		return
	var just_pressed = event.is_pressed() and not event.is_echo()
	if just_pressed and utils.is_playing_lyre():
		if Input.is_key_pressed(keys[0]):
			$AudioStreamPlayer.stream = low_c_note
			$AudioStreamPlayer.play()
		if Input.is_key_pressed(keys[1]):
			$AudioStreamPlayer.stream = d_note
			$AudioStreamPlayer.play()
		if Input.is_key_pressed(keys[2]):
			$AudioStreamPlayer.stream = e_note
			$AudioStreamPlayer.play()
		if Input.is_key_pressed(keys[3]):
			$AudioStreamPlayer.stream = f_note
			$AudioStreamPlayer.play()
		if Input.is_key_pressed(keys[4]):
			$AudioStreamPlayer.stream = g_note
			$AudioStreamPlayer.play()
		if Input.is_key_pressed(keys[5]):
			$AudioStreamPlayer.stream = a_note
			$AudioStreamPlayer.play()
		if Input.is_key_pressed(keys[6]):
			$AudioStreamPlayer.stream = b_note
			$AudioStreamPlayer.play()
		if Input.is_key_pressed(keys[7]):
			$AudioStreamPlayer.stream = high_c_note
			$AudioStreamPlayer.play()