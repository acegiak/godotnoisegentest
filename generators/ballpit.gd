extends MapGenerator

class_name ballpit


func start():
	properties = {"seed":"0","scale":"0.5"}

func get_color(x,y):
	
	var h = get_noise("l1",{"seed":int(properties["seed"])})\
	.get_noise_2d(x/float(properties["scale"]),y/float(properties["scale"]))/2+0.5
	
	var w = get_noise("l2",{"seed":int(properties["seed"]),"noise_type":FastNoiseLite.NoiseType.TYPE_CELLULAR,
	"cellular_return_type":FastNoiseLite.CellularReturnType.RETURN_CELL_VALUE,"fractal_octaves":1})\
	.get_noise_2d(x/float(properties["scale"]),y/float(properties["scale"]))/2+0.5
	
	
	var color = Color.MAGENTA
	color = Color.from_hsv(w,0.75,1-h)
			
	return color
