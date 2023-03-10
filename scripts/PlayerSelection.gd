extends Control

var character_info_scene
var player_count = 1

var game_controller

var selected = 0
onready var characters = ["John","Kelsie","Terje","Tyler"]
onready var random_unselected = preload("res://sprites/UI/random-unselected.png")
onready var random_selected = preload("res://sprites/UI/random-selected.png")
onready var character_selected = preload("res://sprites/UI/character-selected.png")
onready var character_unselected = preload("res://sprites/UI/character-unselected.png")

func set_game_controller(controller):
	game_controller = controller

func _ready():
	randomize()
	characters.shuffle()
	draw_characters()

func set_info_scene(node):
	character_info_scene = node
	draw_selection()

func _input(event):
	if event is InputEventMouse:
		pass # so dumb
	
	if event.is_action_pressed("ui_up"):
		selected -= 3
		if selected < 0:
			selected += 9
		draw_selection()
	elif event.is_action_pressed("ui_down"):
		selected += 3
		if selected >= 9:
			selected -= 9
		draw_selection()
	elif event.is_action_pressed("ui_left"):
		selected -= 1
		if selected == 2 or selected == 5 or selected == -1:
			selected += 3
		draw_selection()
	elif event.is_action_pressed("ui_right"):
		selected += 1
		if selected == 3 or selected == 6 or selected == 9:
			selected -= 3
		draw_selection()
	elif event.is_action_pressed("ui_accept"):
		select_character()
	elif event.is_action_pressed("quit"):
		game_controller.load_launch_screen()

func draw_characters():
	for c in range(0, characters.size()):
		var texture = load("res://characters/%s/sprites/unselected.png" % characters[c])
		if texture:
			get_node("GridContainer/TextureRect%s" % c).texture = texture
	
	for c in range(characters.size(), 9):
		get_node("GridContainer/TextureRect%s" % c).texture = random_unselected

func play_name(character:String):
	$Announcer.stream = load("res://sounds/announcer/select-%s.ogg" % character)
	$Announcer.play()

func draw_selection():
	var _character_to_display = "random"
	if selected < characters.size():
		_character_to_display = characters[selected]
	
	for node in character_info_scene.get_children():
		if node.name != "Panel":
			character_info_scene.remove_child(node)
			node.queue_free()
	
	if selected >= characters.size():
		character_info_scene.get_node("Panel").visible = false
	else:
		var character = characters[selected]
		play_name(character)
		var convo_scene = load("res://characters/%s/%s-conversation.tscn" % [character, character]).instance()
		convo_scene.name = character
		character_info_scene.add_child(convo_scene)
		convo_scene.offset = Vector2(-90, 50)
		if character == "Kelsie":
			convo_scene.offset.x = -110
		convo_scene.scale = Vector2(1.6, 1.6)
		character_info_scene.move_child(convo_scene, 0)
		convo_scene.flip_h = true
		var info = convo_scene.info
		character_info_scene.get_node("Panel/PlayerInfo").text = "Name: %s\nBirthday: %s\nHometown: %s" % [info.name, info.birthday, info.hometown]
		character_info_scene.get_node("Panel").visible = true
		
	for c in range(0, characters.size()):
		var texture
		if selected == c:
			texture = load("res://characters/%s/sprites/selected.png" % characters[c])
		else:
			texture = load("res://characters/%s/sprites/unselected.png" % characters[c])
		if texture:
			get_node("GridContainer/TextureRect%s" % c).texture = texture
	
	for c in range(characters.size(), 9):
		if selected == c:
			get_node("GridContainer/TextureRect%s" % c).texture = random_selected
		else:
			get_node("GridContainer/TextureRect%s" % c).texture = random_unselected

func select_character():
	game_controller.gong()
	game_controller.menu_music_fade("out")
	if player_count == 1:
		if selected >= characters.size():
			# random
			randomize()
			characters.shuffle()
			selected = 0
		game_controller.load_mode(characters[selected], false)
