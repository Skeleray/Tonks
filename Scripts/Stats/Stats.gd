extends Node

@export var base_stats : BaseStatsResource



var buff_list : Array[TemporaryBuff] = []

var baseStats :Dictionary 
var addStats : Dictionary
var multiplyStats : Dictionary


func _ready() :
	baseStats[str(StateTypes.Movement_speed)] = base_stats.movement_speed
	addStats[str(StateTypes.Movement_speed)] = 0
	multiplyStats[str(StateTypes.Movement_speed)] = 1
	
	baseStats[str(StateTypes.Health)] = base_stats.health
	addStats[str(StateTypes.Health)] = 0
	multiplyStats[str(StateTypes.Health)] = 1
	
	baseStats[str(StateTypes.Rotate_speed)] = base_stats.rotate_speed
	addStats[str(StateTypes.Rotate_speed)] = 0
	multiplyStats[str(StateTypes.Rotate_speed)] = 1
	
	
	baseStats[str(StateTypes.Shoot_speed)] = base_stats.Shoot_speed
	addStats[str(StateTypes.Shoot_speed)] = 0
	multiplyStats[str(StateTypes.Shoot_speed)] = 1
	
	




func _get_stat (stat_type:String)->int:
	return (baseStats[stat_type] + addStats[stat_type]) * multiplyStats[stat_type] 
	
	
func _add_buff(stat_name:String, buff_type:String, buff_value :float, ):
	if (buff_type == str(BuffTypes.Add)):
		addStats[stat_name] = addStats[stat_name] + buff_value
	elif (buff_type == str(BuffTypes.Multiply)):
		multiplyStats[stat_name] = multiplyStats[stat_name] + buff_value
	
func _add_timed_buff(stat_name:String, buff_type:String, buff_value :float, duration:float):
	if (buff_type == str(BuffTypes.Add)):
		addStats[stat_name] = addStats[stat_name] + buff_value
		var timer := Timer.new()
		timer.wait_time = duration
		timer.autostart = true
		var temp_buff := TemporaryBuff.new()
		temp_buff.buff_duration = duration
		temp_buff.buff_type = str(BuffTypes.Add)
		temp_buff.stat_name = stat_name
		buff_list.append(temp_buff)
		
	elif (buff_type == str(BuffTypes.Multiply)):
		multiplyStats[stat_name] = multiplyStats[stat_name] + buff_value
		multiplyStats[stat_name] = multiplyStats[stat_name] + buff_value
		var timer := Timer.new()
		timer.wait_time = duration
		timer.autostart = true
		var temp_buff := TemporaryBuff.new()
		temp_buff.buff_duration = duration
		temp_buff.buff_type =str(BuffTypes.Multiply)
		temp_buff.stat_name = stat_name
		buff_list.append(temp_buff)
		
func _physics_process(delta: float) -> void:
	var removeIndexes : Array[int] = []
	var index = 0
	for   buff in buff_list :
		buff.buff_duration = buff.buff_duration - delta
		if (buff.buff_duration < 0):
			_add_buff(buff.stat_name, buff.buff_type,-buff.buff_value)
			removeIndexes.append(index)
		index = index+1
		
	if !removeIndexes.is_empty():
		## reverse index from largest to smalles
		removeIndexes.reverse()
		for removeIndex in removeIndexes :
			buff_list.remove_at(removeIndex)
			
	
	
