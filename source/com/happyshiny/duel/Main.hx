package com.happyshiny.duel;

import nme.Lib;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.display.Sprite;
import nme.events.Event;
import nme.display.FPS;
import nme.Lib;
import org.flixel.FlxGame;
import org.flixel.system.FlxDebugger;
import org.flixel.FlxG;
import org.flixel.FlxAssets;

import com.happyshiny.duel.states.MenuState;
import com.happyshiny.util.SoundManager;

class Main extends Sprite
{
    public function new()
    {
        super();
        
        if (stage != null) 
            init();
        else 
            addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(?e:Event = null):Void 
    {
        if (hasEventListener(Event.ADDED_TO_STAGE))
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        initialize();

        addChild(new Game());

        // Frame rate display
        // var fps = new FPS(FlxG.camera.width-50, 0, 0xff0000);
        // Lib.current.stage.addChild(fps);

        // FlxG.debug = true;
        // FlxG.log("Game starting");
        // FlxG._game._debugger.visible = true;
        // FlxG._game._debuggerUp = true;
    }

    private function initialize():Void 
    {
        Lib.current.stage.align = StageAlign.TOP_LEFT;
        Lib.current.stage.scaleMode = StageScaleMode.SHOW_ALL;

        // Load sounds
        SoundManager.add("hit", "hit");
        SoundManager.add("missile-hit", "missile-hit");
        SoundManager.add("launch", "launch");
        SoundManager.add("button", "button");
    }

    public static function main()
    {
        Lib.current.addChild(new Main());
    }
}

class Game extends FlxGame
{   
    public function new()
    {
        var stageWidth:Int = Lib.current.stage.stageWidth;
        var stageHeight:Int = Lib.current.stage.stageHeight;
        var ratioX:Float = stageWidth / 400;
        var ratioY:Float = stageHeight / 608;
        var ratio:Float = Math.min(ratioX, ratioY);
        var cameraWidth = Math.ceil(stageWidth / ratio);
        var cameraHeight = Math.ceil(stageHeight / ratio);
        var gameFPS = 30;
        var flashFPS = 30;

        super(cameraWidth, cameraHeight, MenuState, ratio, gameFPS, flashFPS);
    }
}
