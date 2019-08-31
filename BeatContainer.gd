extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	set_background_neutral()

func set_background_neutral():
	$Background.modulate = Color("323c39")

func set_background_success():
	$Background.modulate = Color("55a049")

func set_background_failure():
	$Background.modulate = Color("883932")

func set_single_note(note):
	$SingleNote.visible = true
	$SingleNote/RichTextLabel.text = str(note)

func set_double_note(note_one, note_two):
	$DoubleNote.visible = true
	$DoubleNote/RichTextLabelTop.text = str(note_one)
	$DoubleNote/RichTextLabelBottom.text = str(note_two)

func set_triple_note(note_one, note_two, note_three):
	$TripleNote.visible = true
	$TripleNote/RichTextLabelTop.text = str(note_one)
	$TripleNote/RichTextLabelMiddle.text = str(note_two)
	$TripleNote/RichTextLabelBottom.text = str(note_three)