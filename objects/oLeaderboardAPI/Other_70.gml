/// @desc Get Scores

if (async_load[? "type"] == "FirebaseRealTime_Read") {
	if (async_load[? "status"] == 200) {
		var _data = async_load[? "value"];
		if !is_undefined(_data) {
			var _value = json_parse(_data);
			show_debug_message(_value);
			var _names = variable_struct_get_names(_value);
			scores = array_create(array_length(_names));
		
			for(var i = 0; i < array_length(_names); i++) {
				var _scoreData = variable_struct_get(_value, _names[i]);
				show_debug_message(_scoreData.points);
				scores[i] = {
					name: _names[i],
					points: _scoreData.points,
					level: _scoreData.level
				}
			}
			
			array_sort(scores, function(_ele1,_ele2){
				return (_ele2.points - _ele1.points) + (_ele2.level - _ele1.level) * 100000
			});
		}
		
	}
}