﻿package loth.starlings {	import starling.utils.deg2rad;	import starling.display.Image;	import starling.display.Sprite;	import starling.events.Event;	import starling.events.Touch;	import starling.events.TouchEvent;	import starling.events.TouchPhase;	import starling.textures.Texture;		import flash.display.BitmapData;	import flash.geom.Point;		public class Knob extends Sprite {		private var _container:Sprite;		private static var _draggers:Vector.<Image> = new Vector.<Image>();				public function Knob(content:Sprite, name:String, x:int = 0, y:int = 0) {			_container = content;			addKnob(name, x, y);		}				public function setPosition(_x:Number, _y:Number):void {			x = _x;			y = _y;		}				public function addKnob(name:String, x:int = 0, y:int = 0):void {			var kbit:BitmapData = new BitmapData(100, 100, true, 0x000000);			var f:flash.display.Sprite = new flash.display.Sprite();			f.graphics.beginFill(0xff0000, 0.2);			f.graphics.drawCircle(50, 50, 50);			f.graphics.endFill();			f.graphics.beginFill(0xff0000, 0.5);			f.graphics.drawCircle(50, 20, 10);			f.graphics.endFill();			kbit.draw(f);						var dragger:Image = new Image(Texture.fromBitmapData(kbit));			dragger.name = name;			dragger.pivotX = 50;			dragger.pivotY = 50;			addChild(dragger);						dragger.addEventListener(TouchEvent.TOUCH, touchHandler);			_draggers.push(dragger);		}				private function touchHandler(event:TouchEvent):void {			var dragger:Image = event.currentTarget as Image;			var touch:Touch = event.getTouch(_container);			if (touch == null) return;			var position:Point = touch.getLocation(_container);			if (touch.phase == TouchPhase.BEGAN) {				var posBegan:Number = Math.atan2(position.y - y, position.x - x);				var angleBegan:Number = (posBegan / Math.PI) * 180;				var a2rBegan:Number = deg2rad(angleBegan + 90);				dragger.rotation = a2rBegan;			}						if (touch.phase == TouchPhase.MOVED) {				var posMoved:Number = Math.atan2(position.y - y, position.x - x);				var angleMoved:Number = (posMoved / Math.PI) * 180;				var a2rMoved:Number = deg2rad(angleMoved + 90);				dragger.rotation = a2rMoved;			}		}	}}