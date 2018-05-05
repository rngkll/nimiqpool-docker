function formatStats(raw) {
	let formatted = Object.assign({}, raw);

	raw.expected = raw.rewards/raw.connected

	let index = 0, scale = ['H/s', 'kH/s', 'MH/s', 'GH/s', 'TH/s', 'PH/s'];
	while (formatted.hashpower >= 1000) {
		index++;
		formatted.hashpower /= 1000;
	}
	formatted.hashpower = `${formatted.hashpower} ${scale[index]}`

	return { raw, formatted };
}

function loadStats() {
	return {
		// currently
		connected: 100,
		// per day
		rewards: 4000,
		// current H/s
		hashpower: 1000000,
	}
}
