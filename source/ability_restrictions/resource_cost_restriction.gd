extends CostRestriction
class_name ResourceCostRestriction

## 技能资源消耗限制器

@export var cost_resource_id: StringName
@export var cost_value: int

func _init(p_cost_resource_id: StringName = "", p_cost_value: int = 0) -> void:
	cost_resource_id = p_cost_resource_id
	cost_value = p_cost_value

func _can_cost(context: AbilityEffectContext) -> bool:
	var ability = context.get("ability")
	if not ability:
		GASLogger.error("技能{0}判断消耗资源{1}时，技能不存在".format([self, resource_name]))
		return false
	var resource_component : AbilityResourceComponent = context.get("resource_component")
	if not resource_component: 
		GASLogger.error("技能{0}判断消耗资源{1}时，资源组件不存在".format([ability, resource_name]))
		return false
	return resource_component.has_enough_resources(cost_resource_id, cost_value)

func _cost(context: AbilityEffectContext) -> void:
	var resource_component := context.get("resource_component")
	var ability : Ability = context.get("ability")
	if not resource_component: 
		GASLogger.error("技能{0}消耗资源{1}时，资源组件不存在".format([ability, cost_resource_id]))
		return
	resource_component.consume_resources(cost_resource_id, cost_value)
