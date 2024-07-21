extends Resource
class_name MapGenerator

var properties = {}
var noises = {}

@export var output_dimensions:Vector2i = Vector2i(500,500)

func start():
	properties = {}

func get_noise(key:String,config:Dictionary={})->Noise:
	if not key in noises:
		noises[key] = FastNoiseLite.new()
		noises[key].seed = randi()
	for prop in config:
		noises[key].set(prop,config[prop])
	return noises[key]

func get_color(x:float,y:float)->Color:
	var color = Color.MAGENTA
	return color
