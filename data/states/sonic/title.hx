import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import funkin.backend.scripting.events.MenuChangeEvent;
import funkin.backend.scripting.events.NameEvent;
import funkin.backend.scripting.EventManager;
import funkin.menus.credits.CreditsMain;
import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import flixel.effects.FlxFlicker;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.CoolUtil;
static var initialized:Bool = false;

var titleText = new FlxSprite();
var logoBl = new FlxSprite();
var bg = new FlxSprite();

function create(){

    if (!initialized)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
			FlxG.sound.music.fadeIn(5, 0, 0.7);
            Conductor.changeBPM(120);
            initialized = true;
		}

        bg.frames = Paths.getSparrowAtlas('menus/titlescreen/gfDanceTitle');
        bg.animation.addByPrefix('dance', 'gfDance', 24, false);
        bg.updateHitbox();
        bg.screenCenter();
        add(bg);

        logoBl.frames = Paths.getSparrowAtlas('menus/titlescreen/logoBumpin');
        logoBl.animation.addByPrefix('bump', 'logo bumpin', 24, true);
        logoBl.updateHitbox();
        logoBl.screenCenter();
        add(logoBl);
        
        titleText.frames = Paths.getSparrowAtlas('menus/titlescreen/titleEnter');
        titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
        titleText.animation.addByPrefix('press', "ENTER PRESSED", 24, false);
        titleText.antialiasing = true;
        titleText.animation.play('idle');
        titleText.x = 400;
        titleText.y = 600;
        add(titleText);
}
function beatHit()
	{
		logoBl.animation.play('bump');
        bg.animation.play('dance');
    }
function update(elapsed:Float)
	{   
        if (controls.ACCEPT) go();
    }
function go(){
    FlxG.sound.play(Paths.sound('confirmMenu'));
    titleText.animation.play('press');
    new FlxTimer().start(1, function(tmr:FlxTimer)
        {
            FlxG.switchState(new MainMenuState());
        });
    }