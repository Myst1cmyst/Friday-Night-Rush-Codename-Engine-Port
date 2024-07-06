function update(elapsed)
    if (FlxG.keys.justPressed.F5)
        FlxG.resetState();

static var redirectStates:Map<FlxState, String> = [
    TitleState => "sonic/title"
];

function preStateSwitch(){
		for (redirectState in redirectStates.keys())
			if (FlxG.game._requestedState is redirectState)
				FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}