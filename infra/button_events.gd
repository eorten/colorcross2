extends Node

signal on_quit_button_pressed
signal on_main_menu_button_pressed
signal on_play_menu_button_pressed
signal on_hint_button_pressed
signal on_play_button_pressed(board_size:int)
signal on_tutorial_button_pressed
signal on_laser_button_pressed(row:bool, laser_idx:int) #row=false means col
