extends Resource
class_name NPC


export (String) var npc_name = "NPC Name"

export (String, MULTILINE) var initial_dialog
export (String, MULTILINE) var post_quest_dialog

export (Resource) var quest_item

var has_received_quest_item := false
var quest_reward = null
