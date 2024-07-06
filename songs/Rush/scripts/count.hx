//imports
import openfl.text.TextFormat;
import openfl.text.TextField;
import flixel.text.FlxTextBorderStyle;

//vars
var IntroTextSize = 25;
var IntroSubTextSize = 120;
var IntroSubText2Size = 60;
var camOther = new FlxCamera();

function postCreate(){

    FlxG.cameras.add(camOther, false);
	camOther.bgColor = 0x88000000;
}
function create(){
    JukeBoxSubText = new FlxText(0, 160, 400, "RUSH", IntroSubTextSize);
    JukeBoxSubText.setFormat(Paths.font("rush.ttf"),IntroSubTextSize, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    JukeBoxSubText.cameras = [camOther];
    JukeBoxSubText.borderSize = 10;

    bg = new FlxSprite(-100, 0).loadGraphic(Paths.image("count/songtitlebg"));
    bg.cameras = [camOther];

    side = new FlxSprite(-5, 0).loadGraphic(Paths.image("count/songtitlesidething"));
    side.cameras = [camOther];


    white = new FlxSprite(0, 0).loadGraphic(Paths.image("count/songtitlewhite"));
    white.cameras = [camOther];

    white2 = new FlxSprite(0, 0).loadGraphic(Paths.image("count/songtitlewhite"));
    white2.cameras = [camOther];

    icons = new FlxSprite(1300, 0).loadGraphic(Paths.image("count/songtitleiconls"));
    icons.cameras = [camOther];


    name = new FlxSprite(0, 570).loadGraphic(Paths.image("count/songtitlecharname"));
    name.cameras = [camOther];

    dots = new FlxSprite(1150, 200);
    dots.frames = Paths.getSparrowAtlas('count/songtitledots');
    dots.animation.addByPrefix('color', "colordots", 24, true);
    dots.animation.play('color');
    dots.cameras = [camOther];

    sonic2 = new FlxSprite(200, 180);
    sonic2.frames = Paths.getSparrowAtlas('characters/sonic');
    sonic2.animation.addByPrefix('sonidle', "sonic idle", 18, true);
    sonic2.animation.play('sonidle');
    sonic2.scale.set(0.7,0.7);
    sonic2.cameras = [camOther];
    sonic2.color = FlxColor.BLACk;

    bf2 = new FlxSprite(800, 300);
    bf2.frames = Paths.getSparrowAtlas('characters/boyfriend');
    bf2.animation.addByPrefix('bfidle', "BF idle dance", 18, true);
    bf2.animation.play('bfidle');
    bf2.scale.set(0.7,0.7);
    bf2.cameras = [camOther];
    bf2.color = FlxColor.BLACk;

    JukeBoxSubText2 = new FlxText(600, -185, 100, "JON SPEEDARTS", IntroSubText2Size);
    JukeBoxSubText2.setFormat(Paths.font("rush.ttf"),20, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    JukeBoxSubText2.cameras = [camOther];
    JukeBoxSubText2.scale.set(3,3);
    JukeBoxSubText2.borderSize = 0;
    JukeBoxSubText2.x = 1300;

    JukeBoxSubText3 = new FlxText(600, -185, 100, PlayState.difficulty, IntroSubText2Size);
    JukeBoxSubText3.setFormat(Paths.font("rush.ttf"),20, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    JukeBoxSubText3.cameras = [camOther];
    JukeBoxSubText3.borderSize = 1;
    JukeBoxSubText3.scale.set(3,3);
    JukeBoxSubText3.x = 1300;
    JukeBoxSubText3.y = 300;

    mark = new FlxSprite(300, 100);
    mark.frames = Paths.getSparrowAtlas('count/rushmark');
    mark.animation.addByPrefix('2', "countdown2", 24, true);
    mark.cameras = [camOther];

    ready = new FlxSprite(360, 200);
    ready.frames = Paths.getSparrowAtlas('count/rushready');
    ready.animation.addByPrefix('1', "countdown1", 24, true);
    ready.cameras = [camOther];

    go = new FlxSprite(480, 300);
    go.frames = Paths.getSparrowAtlas('count/rushgo');
    go.animation.addByPrefix('go', "countdowngo", 24, true);
    go.cameras = [camOther];

    add(white);
    add(bg);
    add(JukeBoxSubText2);
    add(JukeBoxSubText3);
    add(JukeBoxSubText);
    add(side);
    add(dots);
    add(name);
    add(icons);
    add(white2);
    add(sonic2);
    add(bf2);
}
function onSongStart(){
    FlxTween.tween(white2, {alpha: 0},0.85,{ease: FlxEase.SineIn});
    FlxTween.tween(bf2, {alpha: 0},0.85,{ease: FlxEase.SineIn});
    FlxTween.tween(go, {alpha: 0},0.85,{ease: FlxEase.SineIn});
    FlxTween.tween(ready, {alpha: 0},0.85,{ease: FlxEase.SineIn});
    FlxTween.tween(mark, {alpha: 0},0.85,{ease: FlxEase.SineIn});
    FlxTween.tween(sonic2, {alpha: 0},0.85,{ease: FlxEase.SineIn});
    FlxTween.tween(JukeBoxSubText, {x: 400},1,{ease: FlxEase.SineInOut});
    FlxTween.tween(side, {y: -400},5,{ease: FlxEase.SineInOut});
    FlxTween.tween(JukeBoxSubText2, {x: 500},1,{ease: FlxEase.SineInOut});
    FlxTween.tween(JukeBoxSubText3, {x: 400},1,{ease: FlxEase.SineInOut});

    FlxTween.tween(icons, {x: 995},.85,{ease: FlxEase.SineInOut});
    FlxTween.tween(icons, {y: 300},.85,{ease: FlxEase.SineInOut});
    FlxTween.tween(name, {x: -2550},5,{ease: FlxEase.SineInOut});

    new FlxTimer().start(3, function(tmr:FlxTimer)
        {
            FlxTween.tween(camOther, {alpha: 0},.85,{ease: FlxEase.SineInOut});
        });

}
function onCountdown(event) {
        switch(event.swagCounter) {
            case 1:
                add(mark);
                mark.animation.play('2');
            case 2:
                add(ready);
                ready.animation.play('1');
            case 3:
                add(go);
                go.animation.play('go');

        }
    }