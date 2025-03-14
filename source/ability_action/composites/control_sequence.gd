extends ControlAction
class_name ControlSequence

## 序列节点：按顺序执行所有子节点，一个失败则整体失败

## 上次执行的子节点索引
var _last_executed_index: int = -1


## 执行
## [param context] 上下文
## [return] 节点状态
func _execute(context: AbilityEffectContext) -> STATUS:
	var index: int = 0
	for child in children:
		var status = await child.execute(context)
		if status != STATUS.SUCCESS:
			_last_executed_index = index
			return status
		index += 1
	return STATUS.SUCCESS


## 撤销
## [return] 是否撤销成功
func _revoke() -> bool:
	if _last_executed_index == -1:
		# 未执行过
		return true
	for index in _last_executed_index:
		var ok = await children[index].revoke()
		if not ok:
			GASLogger.error("ControlSequenceAction revoke failed, because child {0} revoke failed".format([index]))
			return false
	return true
