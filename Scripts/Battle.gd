extends Node2D

@onready var player = $Player
@onready var tile_map = $Ground

var hovered_cell: Variant = null
var astart: AStar2D

func _ready() -> void:
	var start_cell = tile_map.local_to_map(tile_map.to_local(player.global_position))
	player.global_position = tile_map.to_global(tile_map.map_to_local(start_cell))

func _process(_delta: float) -> void:
	var cell = tile_map.local_to_map(tile_map.get_local_mouse_position())

	if tile_map.get_cell_source_id(cell) == -1:
		hovered_cell = null
		return

	if cell != hovered_cell:
		hovered_cell = cell
		print(cell)
