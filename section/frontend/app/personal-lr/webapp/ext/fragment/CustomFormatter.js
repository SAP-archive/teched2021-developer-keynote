sap.ui.define([], function () {
	"use strict";
	return {
		formatNationality: function (nationCode) {
			switch (nationCode) {
				case "DEU":
					return "🇩🇪";
				case "USA":
					return "🇺🇸";
				case "CHN":
					return "🇨🇳";
				case "ZAF":
					return "🇿🇦";
				case "GBR":
					return "🇬🇧";
				case "FRA":
					return "🇫🇷";
			}
			return nationCode;
		}
	};
});
