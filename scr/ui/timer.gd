extends Label

func _process(delta):
	var minute = floor(Singleton.totalTm/60)
	
	var baseText = "%02d:%02d"
	var finText = baseText % [minute,floor(Singleton.totalTm - (minute * 60))]
	
	text = finText
