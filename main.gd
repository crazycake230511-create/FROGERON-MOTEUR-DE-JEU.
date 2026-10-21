extends Node2D

# Petit test : un carré qui bouge et réagit au toucher.
var position_carre := Vector2(360, 640)
var cible := Vector2(360, 640)

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	# Fonctionne à la souris et au doigt (émulation tactile).
	if event is InputEventScreenTouch and event.pressed:
		cible = event.position
	elif event is InputEventMouseButton and event.pressed:
		cible = event.position

func _process(delta: float) -> void:
	position_carre = position_carre.lerp(cible, min(1.0, delta * 8.0))
	queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(position_carre - Vector2(40, 40), Vector2(80, 80)), Color("#e6a94a"))
