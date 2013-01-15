liberator.plugins.cssRules = function () {

	liberator.commands.addUserCommand(
		["css[rule]"],
		"Sets CSS rule for current page",
		function (args, count, special) {
			//                             1                                  2   3           4 
			var matches = args.match(/^\s*?([:\[\]"'^*~|= #.,a-zA-Z0-9_>+-]+)(\s*([-+^])?=\s*(.*))?\s*$/);
			var ruleName = matches[1];
			var setValue = !!matches[2];
			var operator = matches[3];
			var ruleValue = matches[4];
			if (count > 0) count = count - 1; else count = -1;

			var rule = liberator.plugins.cssRules.getRule(ruleName, count);
			if (!rule) {
				if (special) {
					rule = liberator.plugins.cssRules.addRule(ruleName, count);
					if (!rule) {
						liberator.echoerr("Failed to add CSS rule '" + ruleName + "'!");
						return;
					}
				} else {
					liberator.echoerr("CSS rule '" + ruleName + "' was not found!");
					return;
				}
			}

			if (!setValue) {
				liberator.echo(rule.selectorText + " {\n\t" + rule.style.cssText.replace(/; /g, ";\n\t") + "\n}");
			} else {
				liberator.plugins.cssRules.setRule(rule, ruleValue) 
			}
		}, {}, true
	);

	liberator.commands.addUserCommand(
		["rmcss[rule]"],
		"Remove CSS rule for current page",
		function (args, count, special) {
			var args = args.replace(/^\s*/, "").replace(/\s*$/, "");
			if (args.match(/[^:\[\]"'^*~|= #.,a-zA-Z0-9_>+-]/)) {
				liberator.echoerr("Not a CSS rule name: '" + args + "'!");
				return;
			}

			if (count > 0) count = count - 1; else count = -1;
			var rule = liberator.plugins.cssRules.getRule(args, count);

			if (!rule) {
				liberator.echoerr("CSS rule '" + args + "' was not found!");
				return;
			}

			liberator.plugins.cssRules.rmRule(rule);
		}, {}, true
	);

	liberator.commands.addUserCommand(
		["cssrules"],
		"Lists all CSS rules for current page",
		function (args, count) {

			var ss = liberator.tabs.getTab().linkedBrowser.contentDocument.styleSheets;
            var list = ":" + (liberator.util.escapeHTML(liberator.commandline.getCommand()) || ":cssrules") + "<br/>" +
                       "<table><tr align=\"left\" class=\"hl-Title\"><th colspan=\"2\">--- CSS rules ---</th></tr>";

			var from = 0;
			var len = ss.length;

			if (count > 0) {
				from = count - 1;
				len = count;
			}

			for (var i = from; i < len; i++) {
				var href = ss[i].href;
				if (href)
					href = "<a href=\"#\" class=\"hl-URL\">" + liberator.util.escapeHTML(href) + "</a>";
				else
					href = "<span class=\"hl-InfoMsg\">Embedded Styles</span>";

				var rules = "";
				for (var j = 0, lenj = ss[i].cssRules.length; j < lenj; j++) {
					rules += "<span style=\"font-weight: bold\">" + ss[i].cssRules[j].selectorText + "</span> {";
					rules += "<div style=\"margin-left: 2em\">" + ss[i].cssRules[j].style.cssText.replace(/; /g, ";<br/>") + "</div>}<br/><br/>";
				}
				list += "<tr align=\"left\"><th>" + (i + 1) + ":</th>" + href + "</th></tr>";
				list += "<tr><td> </td><td>" + rules + "</td></tr>";
			}
			list += "</table>";

            liberator.commandline.echo(list, liberator.commandline.HL_NORMAL, liberator.commandline.FORCE_MULTILINE);

		}, {}, true
	);

	return {

	getRule: function (filter, num) {
		filter = filter.toLowerCase();
		var ss = liberator.tabs.getTab().linkedBrowser.contentDocument.styleSheets;

		if (num >= 0) {

			if (num <= ss.length) {
				var rules = ss[num].cssRules;
				for (var i = 0, len = rules.length; i < len; i++) {
					if (rules[i].selectorText == filter) {
						return rules[i];
					}
				}
			}

		} else {

			for (var j = 0, lenj = ss.length; j < lenj; j++) {
				for (var i = 0, len = ss[j].cssRules.length; i < len; i++) {
					if (ss[j].cssRules[i].selectorText == filter) {
						return ss[j].cssRules[i];
					}
				}
			}
		}
		return null;
	},

	setRule: function (rule, ruleValue) {
		var rulesList = ruleValue.split("; ");
		for (var i = 0; i < rulesList.length; i++) {
			var data = rulesList[i].match(/^\s*([a-zA-Z-]+)\s*:\s*(.*?)\s*;?$/);
			if (data) {
				var important = data[2].match(/!\s*important$/);
				if (important) data[2] = data[2].substring(0, data[2].length - important.length);
				rule.style.setProperty(data[1], data[2], important? "important": "");
			}
		}
	},

	addRule: function (name, num, place) {
		var ss = liberator.tabs.getTab().linkedBrowser.contentDocument.styleSheets;
		var newPlace;

		if (num >= ss.length) return null;
		if (num < 0) num = 0;

		if (!place) place = ss[num].cssRules.length;

		try {
			var newPlace = ss[num].insertRule(name + "{}", place);
		}
		catch (e) {
			return null;
		}

		return ss[num].cssRules[newPlace];
	},

	rmRule: function (rule) {
		var ss = rule.parentStyleSheet;
		var num = -1;
		for (var i = 0; i < ss.cssRules.length; i++) {
			if (ss.cssRules[i] == rule) {
				num = i;
				break;
			}
		}
		if (num < 0) return false;

		try {
			ss.deleteRule(num);
		}
		catch (e) {
			return false;
		}

		return true;
	}

	};

} ();

