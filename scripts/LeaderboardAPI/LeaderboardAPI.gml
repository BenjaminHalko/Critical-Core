/// @desc Get the current leaderboards
function LeaderboardGet() {
	FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Read();
}

/// @desc Post a score to the leaderboards
/// @param {struct} score
function LeaderboardPost(_score) {
	with(oLeaderboardAPI) {
		var _index = array_find_index(scores, function(_val) {
			return _val.name == global.username;
		});
		
		if _index == -1 or scores[_index].points < _score.points {
			if (_index == -1) array_push(scores, _score);
			else scores[_index].points = _score.points;
			
			array_sort(scores, function(_ele1,_ele2) {
				return (_ele2.points - _ele1.points) + (_ele2.level - _ele1.level) * 100000
			});
			FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path(_score.name+"/points").Set(_score.points);
			FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path(_score.name+"/level").Set(_score.level);
		}
	}
}