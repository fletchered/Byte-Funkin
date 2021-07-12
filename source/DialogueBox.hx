package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitRightAlien:FlxSprite;
	var portraitLeftPaddle:FlxSprite;
	var portraitLeftSkate:FlxSprite;
	var portraitLeftBox:FlxSprite;
	var portraitLeftPunch:FlxSprite;
	var portraitLeftShuffle:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'rally tally':
				FlxG.sound.playMusic(Paths.music('PerfectLanding'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'topspin tussle':
				FlxG.sound.playMusic(Paths.music('PerfectLanding'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'skater skirmish':
				FlxG.sound.playMusic(Paths.music('RivalledConnections'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'rocky road':
				FlxG.sound.playMusic(Paths.music('RivalledConnections'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'boxbanned':
				FlxG.sound.playMusic(Paths.music('Boxcrowd'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'roundhouse knockout':
				FlxG.sound.playMusic(Paths.music('Boxcrowd'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'outlets':
				FlxG.sound.playMusic(Paths.music('LostSparks'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.6);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'rally tally':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'topspin tussle':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'skater skirmish':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'rocky road':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'boxbanned':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roundhouse knockout':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'outlets':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitLeft = new FlxSprite(-20, 40);
		portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
		portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitLeftPaddle = new FlxSprite(-120, 40);
		portraitLeftPaddle.frames = Paths.getSparrowAtlas('weeb/paddlebytePortrait');
		portraitLeftPaddle.animation.addByPrefix('enter', 'Paddlebyte Portrait Enter', 30, false);
		portraitLeftPaddle.setGraphicSize(Std.int(portraitLeftPaddle.width * PlayState.daPixelZoom * 0.9));
		portraitLeftPaddle.updateHitbox();
		portraitLeftPaddle.scrollFactor.set();
		add(portraitLeftPaddle);
		portraitLeftPaddle.visible = false;

		portraitLeftSkate = new FlxSprite(-120, 40);
		portraitLeftSkate.frames = Paths.getSparrowAtlas('weeb/skatebytePortrait');
		portraitLeftSkate.animation.addByPrefix('enter', 'Skatebyte Portrait Enter', 30, false);
		portraitLeftSkate.setGraphicSize(Std.int(portraitLeftSkate.width * PlayState.daPixelZoom * 0.9));
		portraitLeftSkate.updateHitbox();
		portraitLeftSkate.scrollFactor.set();
		add(portraitLeftSkate);
		portraitLeftSkate.visible = false;

		portraitLeftBox = new FlxSprite(-120, 40);
		portraitLeftBox.frames = Paths.getSparrowAtlas('weeb/boxbytePortrait');
		portraitLeftBox.animation.addByPrefix('enter', 'Boxbyte Portrait Enter', 30, false);
		portraitLeftBox.setGraphicSize(Std.int(portraitLeftBox.width * PlayState.daPixelZoom * 0.9));
		portraitLeftBox.updateHitbox();
		portraitLeftBox.scrollFactor.set();
		add(portraitLeftBox);
		portraitLeftBox.visible = false;

		portraitLeftPunch = new FlxSprite(-120, 40);
		portraitLeftPunch.frames = Paths.getSparrowAtlas('weeb/boxbytePunch');
		portraitLeftPunch.animation.addByPrefix('enter', 'Boxbyte Punch', 30, false);
		portraitLeftPunch.setGraphicSize(Std.int(portraitLeftPunch.width * PlayState.daPixelZoom * 0.9));
		portraitLeftPunch.updateHitbox();
		portraitLeftPunch.scrollFactor.set();
		add(portraitLeftPunch);
		portraitLeftPunch.visible = false;

		portraitLeftShuffle = new FlxSprite(-120, 40);
		portraitLeftShuffle.frames = Paths.getSparrowAtlas('weeb/shufflebytePortrait');
		portraitLeftShuffle.animation.addByPrefix('enter', 'Shufflebyte Portrait Enter', 30, false);
		portraitLeftShuffle.setGraphicSize(Std.int(portraitLeftShuffle.width * PlayState.daPixelZoom * 0.9));
		portraitLeftShuffle.updateHitbox();
		portraitLeftShuffle.scrollFactor.set();
		add(portraitLeftShuffle);
		portraitLeftShuffle.visible = false;

		portraitRight = new FlxSprite(500, 40);
		portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Bytefriend Portrait Enter', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		portraitRightAlien = new FlxSprite(500, 40);
		portraitRightAlien.frames = Paths.getSparrowAtlas('weeb/alienPortrait');
		portraitRightAlien.animation.addByPrefix('enter', 'Bytefriend Portrait Enter copy', 24, false);
		portraitRightAlien.setGraphicSize(Std.int(portraitRightAlien.width * PlayState.daPixelZoom * 0.9));
		portraitRightAlien.updateHitbox();
		portraitRightAlien.scrollFactor.set();
		add(portraitRightAlien);
		portraitRightAlien.visible = false;
		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 552, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFF00008B;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 550, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFFFFFFFF;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'rally tally' || PlayState.SONG.song.toLowerCase() == 'topspin tussle' || PlayState.SONG.song.toLowerCase() == 'skater skirmish' || PlayState.SONG.song.toLowerCase() == 'rocky road' || PlayState.SONG.song.toLowerCase() == 'boxbanned' || PlayState.SONG.song.toLowerCase() == 'roundhouse knockout' || PlayState.SONG.song.toLowerCase() == 'outlets')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						portraitRightAlien.visible = false;
						portraitLeftPaddle.visible = false;
						portraitLeftSkate.visible = false;
						portraitLeftBox.visible = false;
						portraitLeftPunch.visible = false;
						portraitLeftShuffle.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				portraitRightAlien.visible = false;
				portraitLeftPaddle.visible = false;
				portraitLeftSkate.visible = false;
				portraitLeftBox.visible = false;
				portraitLeftPunch.visible = false;
				portraitLeftShuffle.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'paddle':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitRightAlien.visible = false;
				portraitLeftSkate.visible = false;
				portraitLeftBox.visible = false;
				portraitLeftPunch.visible = false;
				portraitLeftShuffle.visible = false;
				if (!portraitLeftPaddle.visible)
				{
					portraitLeftPaddle.visible = true;
					portraitLeftPaddle.animation.play('enter');
				}
			case 'skate':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitRightAlien.visible = false;
				portraitLeftPaddle.visible = false;
				portraitLeftBox.visible = false;
				portraitLeftPunch.visible = false;
				portraitLeftShuffle.visible = false;
				if (!portraitLeftSkate.visible)
				{
					portraitLeftSkate.visible = true;
					portraitLeftSkate.animation.play('enter');
				}
			case 'box':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitRightAlien.visible = false;
				portraitLeftPaddle.visible = false;
				portraitLeftSkate.visible = false;
				portraitLeftPunch.visible = false;
				portraitLeftShuffle.visible = false;
				if (!portraitLeftBox.visible)
				{
					portraitLeftBox.visible = true;
					portraitLeftBox.animation.play('enter');
				}
			case 'boxpunching':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitRightAlien.visible = false;
				portraitLeftPaddle.visible = false;
				portraitLeftSkate.visible = false;
				portraitLeftBox.visible = false;
				portraitLeftShuffle.visible = false;
				if (!portraitLeftPunch.visible)
				{
					portraitLeftPunch.visible = true;
					portraitLeftPunch.animation.play('enter');
				}
			case 'shuffle':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitRightAlien.visible = false;
				portraitLeftPaddle.visible = false;
				portraitLeftSkate.visible = false;
				portraitLeftBox.visible = false;
				portraitLeftPunch.visible = false;
				if (!portraitLeftShuffle.visible)
				{
					portraitLeftShuffle.visible = true;
					portraitLeftShuffle.animation.play('enter');
				}
			case 'bf':
				portraitRight.visible = false;
				portraitRightAlien.visible = false;
				portraitLeftPaddle.visible = false;
				portraitLeftSkate.visible = false;
				portraitLeftBox.visible = false;
				portraitLeftPunch.visible = false;
				portraitLeftShuffle.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'bogos':
				portraitRight.visible = false;
				portraitLeftPaddle.visible = false;
				portraitLeftSkate.visible = false;
				portraitLeftBox.visible = false;
				portraitLeftPunch.visible = false;
				portraitLeftShuffle.visible = false;
				if (!portraitRightAlien.visible)
				{
					portraitRightAlien.visible = true;
					portraitRightAlien.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
