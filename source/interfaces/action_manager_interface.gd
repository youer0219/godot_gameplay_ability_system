extends ManagerInterface
class_name ActionManagerInterface

## 动作管理器接口


## 初始化
func initialize(
		_resource_manager : CoreSystem.ResourceManager , 
		_data_manager : DataManager, 
		_action_paths: Dictionary, 
		_action_table_type : TableType) -> void:
	pass


## 应用行动树
func apply_action_tree(_action_id: StringName) -> void:
	pass


## 移除行动树缓存
func remove_action_tree(_action_id: StringName) -> void:
	pass


## 执行行动树
func execute_action_tree(_action_id: StringName, _context: AbilityEffectContext) -> void:
	pass


func get_tree_description(_action_id: StringName, context: AbilityEffectContext) -> String:
	return ""


## 获取行动树
func _create_action_tree(_action_id: StringName) -> AbilityAction:
	return null
