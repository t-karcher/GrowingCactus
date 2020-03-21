extends TextureButton

onready var cactus : Node2D = $Cactus

func _on_CactusBlock_pressed():
	cactus.start_growing()
