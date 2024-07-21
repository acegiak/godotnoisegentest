# godotnoisegentest

A simple template project for experimenting with noise generation

created for Godot 4.3

create new generators that extend MapGenerator

override the start() and get_color(x,y) functions, see the example generators/ballpit.gd for an example

In the scene, select the Generator sode and set the Generator property to one of your new generators


get_noise(key:String,properties:Dictionary={}) allows you to manage multiple instances of FastNoiseLite with different options and access them with a simple string key. Leaving the second argument blank will still return the noise source for that key leaving the properties as they were last, or default