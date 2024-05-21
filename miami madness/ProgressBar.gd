extends ProgressBar

@onready var player = $"../.."
@onready var progress_bar = $"."


func _ready():
	update()
func _process(delta):
	update()
func update():
	progress_bar.value= player.health
