/// @desc Get Scores

if (async_load[? "type"] == "FirebaseRealTime_Read") {
	if (async_load[? "status"] == 200) {
		var _data = async_load[? "value"];
		if !is_undefined(_data) {
			var _value = json_parse(_data);
			var _names = variable_struct_get_names(_value);
			scores = array_create(array_length(_names));
		
			for(var i = 0; i < array_length(_names); i++) {
				scores[i] = {
					name: _names[i],
					score: variable_struct_get(_value, _names[i])
				}
			}
			
			array_sort(scores, function(_ele1,_ele2){return _ele2.score - _ele1.score});
		}
	}
}