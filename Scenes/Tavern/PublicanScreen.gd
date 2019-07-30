extends "res://Scenes/Tavern/OneTavernScreen.gd"

onready var vine_btn = find_node("VineBtn")

func _ready():
	vine_btn.connect("bought", self, "_on_VinenBtn_bought")
	
func _on_VinenBtn_bought() -> void:
	vine_btn.call_deferred("set_enabled", false)
	
func on_enter():
	.on_enter()
	set_wine_btn_access()
	
func set_wine_btn_access() -> void:
	vine_btn.set_enabled(should_wine_be_access())
	
func should_wine_be_access() -> bool:
	var elf = get_node("/root/World").find_node("Elf")
	var elf_stats = get_node("/root/World/ElfStats")
	var game_data = get_node("/root/World/GameData")
	
	var max_hp: int = elf_stats.get_stat_value("vitality")
	return elf.hp < max_hp and vine_btn.price <= game_data.gold
	