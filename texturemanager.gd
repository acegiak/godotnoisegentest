extends Node

@onready var texture_display: TextureRect = %TextureDisplay
@onready var field_display: VBoxContainer = %FieldDisplay

@export var generator:MapGenerator

func _ready() -> void:
	generator.start()
	for key in generator.properties:
		var label = Label.new()
		label.text = key
		label.name = key+"_label"
		field_display.add_child(label)
		var field = LineEdit.new()
		field.name = key
		field.text = generator.properties[key]
		field_display.add_child(field)
		

func generate():
	for field in field_display.get_children():
		if not field is LineEdit:
			continue
		if not field.name in generator.properties:
			continue
		generator.properties[field.name] = field.text
	
	var texture = ImageTexture.new()
	var canvas = Image.new()
	canvas = Image.create_empty(generator.output_dimensions.x,generator.output_dimensions.y,false,Image.FORMAT_RGB8)
	canvas.fill(Color.MAGENTA)
	for y in range(generator.output_dimensions.y):
		for x in range(generator.output_dimensions.x):
			var color = generator.get_color(x,y)
			canvas.set_pixel(x,y,color)
	texture = ImageTexture.create_from_image(canvas)
	texture_display.texture = texture
	texture_display.custom_minimum_size = Vector2(generator.output_dimensions.x,generator.output_dimensions.y)
	
