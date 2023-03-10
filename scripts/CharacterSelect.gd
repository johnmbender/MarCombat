extends Node2D

var players
var player1
var player2

var game_controller
var storymode_controller

onready var player_select_scene = preload("res://scenes/PlayerSelection.tscn")
onready var character_info_scene = preload("res://scenes/CharacterInfo.tscn")

func set_game_controller(controller):
	game_controller = controller

func _ready():
	set_players(1)
	prepare()

func set_players(p:int):
	players = p

func prepare():
	var player_select = player_select_scene.instance()
	player_select.set_game_controller(game_controller)
	$HSplitContainer/Left.add_child(player_select)
	
	if players == 1:
		var character_info = character_info_scene.instance()
		$HSplitContainer/Right.add_child(character_info)
		player_select.set_info_scene(character_info)
	else:
		pass
