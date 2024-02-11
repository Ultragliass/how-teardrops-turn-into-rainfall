extends Node

var wind = load("res://assets/sfx/wind.mp3")
var sky_wind = load("res://assets/sfx/sky_wind.mp3")

func play_ambiance(file):
	print(file)
	match file:
		"wind": $Ambiance.stream = wind
		
		"sky_wind": $Ambiance.stream = sky_wind
		
	$Ambiance.play()

func stop_playing(): $Ambiance.stop()
