/// @desc Get the current leaderboards
function LeaderboardGet() {
	FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Read();
}

/// @desc Post a score to the leaderboards
/// @param {struct} score
function LeaderboardPost(_score) {
	with(oLeaderboardAPI) {
		var _index = array_find_index(scores, function(_val) {
			return _val.name == _score.name;
		});
		
		if _index == -1 or scores[_index].score < _score.score {
			if (_index == -1) array_push(scores, _score);
			else scores[_index].score = _score.score;
			
			array_sort(scores, function(_ele1,_ele2){return _ele2.score - _ele1.score});
			FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path(_score.name).Set(_score.score);
		}
	}
}