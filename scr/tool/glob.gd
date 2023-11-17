extends Node

var cat = null
var hp_cat = 9

var fallhu_tm = 2
var humanfallSp = 8

var h_man_tm = 5
var h_man_sp = 5

var perDiffTm = 0
var totalTm = 0

var currDiff = 0

func _physics_process(delta):
	perDiffTm += delta
	
	if perDiffTm >= 30:
		perDiffTm = 0
		currDiff += 1

func DiffUp():
	
	humanfallSp * 1.1
	fallhu_tm * 0.95
