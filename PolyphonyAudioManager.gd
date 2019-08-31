extends Node

func _input(event):
	if event.is_pressed() and not event.is_echo() and utils.is_playing_lyre():
		if event.scancode == utils.keys[0] and Input.is_key_pressed(utils.keys[0]):
			$LowCAudioStreamPlayer.play()
		if event.scancode == utils.keys[1] and Input.is_key_pressed(utils.keys[1]):
			$DAudioStreamPlayer.play()
		if event.scancode == utils.keys[2] and Input.is_key_pressed(utils.keys[2]):
			$EAudioStreamPlayer.play()
		if event.scancode == utils.keys[3] and Input.is_key_pressed(utils.keys[3]):
			$FAudioStreamPlayer.play()
		if event.scancode == utils.keys[4] and Input.is_key_pressed(utils.keys[4]):
			$GAudioStreamPlayer.play()
		if event.scancode == utils.keys[5] and Input.is_key_pressed(utils.keys[5]):
			$AAudioStreamPlayer.play()
		if event.scancode == utils.keys[6] and Input.is_key_pressed(utils.keys[6]):
			$BAudioStreamPlayer.play()
		if event.scancode == utils.keys[7] and Input.is_key_pressed(utils.keys[7]):
			$HighCAudioStreamPlayer.play()