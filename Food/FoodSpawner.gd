extends Node2D

const Bakpau = preload("res://Food/BakpauFood.tscn")
const Bakso = preload("res://Food/BaksoFood.tscn")
const MieAyam = preload("res://Food/MieAyamFood.tscn")
const MieGoreng = preload("res://Food/MieGorengFood.tscn")
const NasiGoreng = preload("res://Food/NasiGorengFood.tscn")
const NasiTumpeng = preload("res://Food/NasiTumpengFood.tscn")
const PecelLele = preload("res://Food/PecelLeleFood.tscn")
const SweetMartabak = preload("res://Food/SweetMartabakFood.tscn")
const Rendang = preload("res://Food/RendangFood.tscn")
const Satay = preload("res://Food/SatayFood.tscn")
const EggMartabak = preload("res://Food/EggMartabakFood.tscn")
const Surabi = preload("res://Food/SurabiFood.tscn")

const FoodSpawnPoint = preload("res://Food/FoodSpawnPoint.tscn")

export(int) var horizontal_length = 640

onready var spawnPoints = $SpwanPoints

var random_generator = RandomNumberGenerator.new()

var food_names = ["Bakpau", "Bakso", "MieAyam", "MieGoreng", "NasiGoreng", "NasiTumpeng", "PecelLele", "SweetMartabak", "Rendang", "Satay", "EggMartabak", "Surabi"]

var base_mass = 10

var food_items = {
	"Bakpau": {
		"mass": 0.1 * base_mass,
		"calories": 10,
		"scene": Bakpau
	},
	"Bakso": {
		"mass": 0.1 * base_mass,
		"calories": 26,
		"scene": Bakso
	},
	"MieAyam": {
		"mass": 4 * base_mass,
		"calories": 421,
		"scene": MieAyam
	},
	"MieGoreng": {
		"mass": 2 * base_mass,
		"calories": 163,
		"scene": MieGoreng
	},
	"NasiGoreng": {
		"mass": 3 * base_mass,
		"calories": 347,
		"scene": NasiGoreng
	},
	"NasiTumpeng": {
		"mass": 3 * base_mass,
		"calories": 320,
		"scene": NasiTumpeng
	},
	"PecelLele": {
		"mass": 2 * base_mass,
		"calories": 239,
		"scene": PecelLele
	},
	"SweetMartabak": {
		"mass": 3 * base_mass,
		"calories": 312,
		"scene": SweetMartabak
	},
	"Rendang": {
		"mass": base_mass,
		"calories": 137,
		"scene": Rendang
	},
	"Satay": {
		"mass": 2 * base_mass,
		"calories": 216,
		"scene": Satay
	},
	"EggMartabak": {
		"mass": 3 * base_mass,
		"calories": 312,
		"scene": EggMartabak
	}, 
	"Surabi": {
		"mass": 4 * base_mass,
		"calories": 425,
		"scene": Surabi
	}
}

var food_scenes = []

func _ready():
	generate_spawn_points()
	random_generator.randomize()

func generate_spawn_points():
	var number_of_points = 20
	var distance = horizontal_length / number_of_points
	
	for i in range(0, number_of_points):
		var current_point = FoodSpawnPoint.instance()
		current_point.global_position = Vector2(i * distance, 0)
		spawnPoints.add_child(current_point)

func get_spawn_food():
	var points = spawnPoints.get_children()
	points.shuffle()
	return points[0].global_position
	
func spawn_a_food():
	var spwan_position = get_spawn_food()
	
	var random_number = random_generator.randi_range(0, food_names.size() - 1)
	var food_name_to_generate = food_names[random_number]
	var food_to_generate = food_items[food_name_to_generate]
	
	var food_item = food_to_generate["scene"].instance()
	food_item.mass = food_to_generate["mass"]
	food_item.calories = food_to_generate["calories"]
	
	var main = get_tree().current_scene
	main.add_child(food_item)
	food_item.global_position = spwan_position

func _on_Timer_timeout():
	spawn_a_food()
