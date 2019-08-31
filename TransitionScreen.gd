extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextHoldTimer.connect("timeout", self, "_on_TextHoldTimer_timeout")
	$DestroyTimer.connect("timeout", self, "_on_DestroyTimer_timeout")
	$SetScenePlayingTimer.connect("timeout", self, "_on_SetScenePlayingTimer_timeout")

	$AnimationPlayer.play("Fade In")
	$TextHoldTimer.start()
	store.dispatch(action_creators.game_set_display_scene(utils.DisplayScene.PLAYING))

func set_text(text):
	$RichTextLabel.text = text

# Fade Out
func _on_TextHoldTimer_timeout():
	$AnimationPlayer.play_backwards("Fade In")
	$DestroyTimer.start()

# Free Memory
func _on_DestroyTimer_timeout():
	self.queue_free()

# Start loading the main game
#func _on_SetScenePlayingTimer_timeout():
#	store.dispatch(action_creators.game_set_display_scene(utils.DisplayScene.PLAYING))