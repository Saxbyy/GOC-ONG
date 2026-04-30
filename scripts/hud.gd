extends CanvasLayer

func _process(_delta):
	$ScoreLabel.text = "Score: %d" % GameManager.score
