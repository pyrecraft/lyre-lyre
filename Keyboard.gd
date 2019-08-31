extends Node

const low_c_texture_active = preload('res://sprites/piano/keyboard-low-c2.png')
const d_texture_active = preload('res://sprites/piano/keyboard-d2.png')
const e_texture_active = preload('res://sprites/piano/keyboard-e2.png')
const f_texture_active = preload('res://sprites/piano/keyboard-f2.png')
const g_texture_active = preload('res://sprites/piano/keyboard-g2.png')
const a_texture_active = preload('res://sprites/piano/keyboard-a2.png')
const b_texture_active = preload('res://sprites/piano/keyboard-b2.png')
const high_c_texture_active = preload('res://sprites/piano/keyboard-high-c2.png')

var default_key_textures = []

func _ready():
	default_key_textures.push_back($"keyboard-low-c1".texture)
	default_key_textures.push_back($"keyboard-d1".texture)
	default_key_textures.push_back($"keyboard-e1".texture)
	default_key_textures.push_back($"keyboard-f1".texture)
	default_key_textures.push_back($"keyboard-g1".texture)
	default_key_textures.push_back($"keyboard-a1".texture)
	default_key_textures.push_back($"keyboard-b1".texture)
	default_key_textures.push_back($"keyboard-high-c1".texture)

func _process(delta):
	if $"keyboard-low-c1".texture == low_c_texture_active and !Input.is_key_pressed(utils.keys[0]):
		$"keyboard-low-c1".texture = default_key_textures[0]
		$"keyboard-low-c1/ColorRect".color = Color("fff1e8")
	if $"keyboard-d1".texture == d_texture_active and !Input.is_key_pressed(utils.keys[1]):
		$"keyboard-d1".texture = default_key_textures[1]
		$"keyboard-d1/ColorRect".color = Color("fff1e8")
	if $"keyboard-e1".texture == e_texture_active and !Input.is_key_pressed(utils.keys[2]):
		$"keyboard-e1".texture = default_key_textures[2]
		$"keyboard-e1/ColorRect".color = Color("fff1e8")
	if $"keyboard-f1".texture == f_texture_active and !Input.is_key_pressed(utils.keys[3]):
		$"keyboard-f1".texture = default_key_textures[3]
		$"keyboard-f1/ColorRect".color = Color("fff1e8")
	if $"keyboard-g1".texture == g_texture_active and !Input.is_key_pressed(utils.keys[4]):
		$"keyboard-g1".texture = default_key_textures[4]
		$"keyboard-g1/ColorRect".color = Color("fff1e8")
	if $"keyboard-a1".texture == a_texture_active and !Input.is_key_pressed(utils.keys[5]):
		$"keyboard-a1".texture = default_key_textures[5]
		$"keyboard-a1/ColorRect".color = Color("fff1e8")
	if $"keyboard-b1".texture == b_texture_active and !Input.is_key_pressed(utils.keys[6]):
		$"keyboard-b1".texture = default_key_textures[6]
		$"keyboard-b1/ColorRect".color = Color("fff1e8")
	if $"keyboard-high-c1".texture == high_c_texture_active and !Input.is_key_pressed(utils.keys[7]):
		$"keyboard-high-c1".texture = default_key_textures[7]
		$"keyboard-high-c1/ColorRect".color = Color("fff1e8")

func _input(event):
	if Input.is_key_pressed(utils.keys[0]) and $"keyboard-low-c1".texture == default_key_textures[0]:
		$"keyboard-low-c1".texture = low_c_texture_active
		$"keyboard-low-c1/ColorRect".color = Color("b86962")
	if Input.is_key_pressed(utils.keys[1]) and $"keyboard-d1".texture == default_key_textures[1]:
		$"keyboard-d1".texture = d_texture_active
		$"keyboard-d1/ColorRect".color = Color("b86962")
	if Input.is_key_pressed(utils.keys[2]) and $"keyboard-e1".texture == default_key_textures[2]:
		$"keyboard-e1".texture = e_texture_active
		$"keyboard-e1/ColorRect".color = Color("b86962")
	if Input.is_key_pressed(utils.keys[3]) and $"keyboard-f1".texture == default_key_textures[3]:
		$"keyboard-f1".texture = f_texture_active
		$"keyboard-f1/ColorRect".color = Color("b86962")
	if Input.is_key_pressed(utils.keys[4]) and $"keyboard-g1".texture == default_key_textures[4]:
		$"keyboard-g1".texture = g_texture_active
		$"keyboard-g1/ColorRect".color = Color("b86962")
	if Input.is_key_pressed(utils.keys[5]) and $"keyboard-a1".texture == default_key_textures[5]:
		$"keyboard-a1".texture = a_texture_active
		$"keyboard-a1/ColorRect".color = Color("b86962")
	if Input.is_key_pressed(utils.keys[6]) and $"keyboard-b1".texture == default_key_textures[6]:
		$"keyboard-b1".texture = b_texture_active
		$"keyboard-b1/ColorRect".color = Color("b86962")
	if Input.is_key_pressed(utils.keys[7]) and $"keyboard-high-c1".texture == default_key_textures[7]:
		$"keyboard-high-c1".texture = high_c_texture_active
		$"keyboard-high-c1/ColorRect".color = Color("b86962")