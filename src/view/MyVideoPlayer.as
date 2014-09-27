package view
{
	import component.MyButton;
	
	import event.EventBase;
	
	import flash.display.DisplayObject;
	import flash.display.StageDisplayState;
	import flash.events.FullScreenEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import mx.core.FlexGlobals;
	import mx.core.IVisualElementContainer;
	import mx.core.mx_internal;
	import mx.managers.PopUpManager;
	
	import spark.components.Button;
	import spark.components.SkinnableContainer;
	import spark.components.VideoDisplay;
	import spark.components.VideoPlayer;

	[SkinState("FullScreen")]
	
	[SkinState("uninitialized")]
	
	/**
	 *  Loading state of the VideoPlayer.
	 *  The VideoPlayer is loading or connecting to the source. 
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("loading")]
	
	/**
	 *  Ready state of the VideoPlayer.
	 *  The video is ready to be played.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("ready")]
	
	/**
	 *  Playing state of the VideoPlayer
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("playing")]
	
	/**
	 *  Paused state of the VideoPlayer
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("paused")]
	
	/**
	 *  Buffering state of the VideoPlayer
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("buffering")]
	
	/**
	 *  Playback Error state of the VideoPlayer. 
	 *  An error was encountered while trying to play the video.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("playbackError")]
	
	/**
	 *  Disabled state of the VideoPlayer
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("disabled")]
	
	use namespace mx_internal;
	
	public class MyVideoPlayer extends SkinnableContainer
	{
		public function MyVideoPlayer()
		{
		}
		
		[SkinPart(required="true")]
		public var videoDisplay:VideoDisplay;
		
		[SkinPart(required="false")]
		public var playBtn:MyButton;
		
		[SkinPart(required="false")]
		public var pauseBtn:MyButton;
		
		[SkinPart(required="false")]
		public var openBtn:MyButton;
		
		[SkinPart(required="false")]
		public var volumeBtn:MyButton;
		
		[SkinPart(required="false")]
		public var stopBtn:MyButton;
		
		private var __sourceChange:Boolean = false;
		
		private var __playing:Boolean;

		public function get playing():Boolean
		{
			return videoDisplay.playing
			//return __playing;
		}

		private var __source:Object;

		public function get source():Object
		{
			return __source;
		}

		public function set source(value:Object):void
		{
			if(__source != value)
			{
				__source = value;
				invalidateProperties();
				__sourceChange = true;
			}
		}

		private var __fullScreen:Boolean = false;
		
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			// TODO Auto Generated method stub
			super.partAdded(partName, instance);
			if(instance == videoDisplay)
			{
				videoDisplay.addEventListener(MouseEvent.DOUBLE_CLICK,videoDoubleClickHandler);
			}
			
			if(instance == playBtn)
			{
				playBtn.addEventListener(MouseEvent.CLICK,playClickHandler);
			}
			
			if(instance == pauseBtn)
			{
				pauseBtn.addEventListener(MouseEvent.CLICK,pauseClickHandler);
			}
			
			if(instance == openBtn)
			{
				openBtn.addEventListener(MouseEvent.CLICK,openClickHandler);
			}
			
			if(instance == volumeBtn)
			{
				volumeBtn.addEventListener(MouseEvent.CLICK,volumeClickHandler);
			}
			
			if(instance == stopBtn)
			{
				stopBtn.addEventListener(MouseEvent.CLICK,stopClickHandler);
			}
			
		}
		
		private var beforeFullScreenInfo:Object;
		
		protected function videoDoubleClickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			if(__fullScreen ==true)
			{
				__fullScreen =false;
				exitFullScreen();
			}
			else
			{
				__fullScreen = true;
				entryFullScreen();
			}
			invalidateSkinState();
			
		}
		
		private function entryFullScreen():void
		{
			beforeFullScreenInfo = new Object();
			beforeFullScreenInfo.x = this.x;
			beforeFullScreenInfo.y = this.y;
			beforeFullScreenInfo.height = this.height;
			beforeFullScreenInfo.width = this.width;
			beforeFullScreenInfo.percentHeight = this.percentHeight;
			beforeFullScreenInfo.percentWidth = this.percentWidth;
			beforeFullScreenInfo.isPop = true;
			beforeFullScreenInfo.parent = parent;
			beforeFullScreenInfo.explicitWidth = this.explicitWidth;
			beforeFullScreenInfo.explicitHeight = this.explicitHeight;
			
			var screenBounds:Rectangle = getScreenBounds();
			if (parent is IVisualElementContainer)
			{
				var ivec:IVisualElementContainer = IVisualElementContainer(parent);
				beforeFullScreenInfo.childIndex = ivec.getElementIndex(this);
				ivec.removeElement(this);
			}
			else
			{
				beforeFullScreenInfo.childIndex = parent.getChildIndex(this);
				parent.removeChild(this);
			}
			PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject, false, null, moduleFactory);
			
			
			this.width =screenBounds.width;
			this.height =screenBounds.height; 
			setLayoutBoundsSize(screenBounds.width, screenBounds.height, true);
			setLayoutBoundsPosition(0, 0, true);
			
			if (videoDisplay.videoObject)
			{
				beforeFullScreenInfo.smoothing = videoDisplay.videoObject.smoothing;
				beforeFullScreenInfo.deblocking = videoDisplay.videoObject.deblocking;
				videoDisplay.videoObject.smoothing = false;
				videoDisplay.videoObject.deblocking = 0;
			}
			
			this.validateNow();
			
			systemManager.stage.addEventListener(FullScreenEvent.FULL_SCREEN, fullScreenEventHandler);
			systemManager.stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		
		private function exitFullScreen():void
		{
			systemManager.stage.removeEventListener(FullScreenEvent.FULL_SCREEN, fullScreenEventHandler);
			systemManager.stage.displayState = StageDisplayState.NORMAL;
			PopUpManager.removePopUp(this);
			
			if (videoDisplay.videoObject)
			{
				videoDisplay.videoObject.smoothing = beforeFullScreenInfo.smoothing;
				videoDisplay.videoObject.deblocking = beforeFullScreenInfo.deblocking;
			}
			
			this.x = beforeFullScreenInfo.x;
			this.y = beforeFullScreenInfo.y;
			this.height = beforeFullScreenInfo.height;
			this.width = beforeFullScreenInfo.width;
			this.percentHeight = beforeFullScreenInfo.percentHeight;
			this.percentWidth = beforeFullScreenInfo.percentWidth;
			this.explicitWidth = beforeFullScreenInfo.explicitWidth;
			this.explicitHeight = beforeFullScreenInfo.explicitHeight;
			
			if (beforeFullScreenInfo.parent is IVisualElementContainer)
			{
				var ivec:IVisualElementContainer = IVisualElementContainer(beforeFullScreenInfo.parent);
				beforeFullScreenInfo.parent.addElementAt(this,beforeFullScreenInfo.childIndex);
			}
			else
			{
				beforeFullScreenInfo.parent.addChildAt(this,beforeFullScreenInfo.childIndex);
			}
			beforeFullScreenInfo =null;
			
			invalidateProperties();
			invalidateSkinState();
			invalidateSize();
			invalidateDisplayList();
			
		}
		
		protected function fullScreenEventHandler(evt:FullScreenEvent):void
		{
			if (evt.fullScreen)
				return;
			videoDoubleClickHandler(null);
		}
		
		mx_internal function getScreenBounds():Rectangle
		{       
			var resultRect:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			
			return resultRect;
		}
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			if(instance == playBtn)
			{
				playBtn.removeEventListener(MouseEvent.CLICK,playClickHandler);
			}
			
			if(instance == pauseBtn)
			{
				pauseBtn.removeEventListener(MouseEvent.CLICK,pauseClickHandler);
			}
			
			if(instance == openBtn)
			{
				openBtn.removeEventListener(MouseEvent.CLICK,openClickHandler);
			}
			
			if(instance == volumeBtn)
			{
				volumeBtn.removeEventListener(MouseEvent.CLICK,volumeClickHandler);
			}
			
			if(instance == stopBtn)
			{
				stopBtn.removeEventListener(MouseEvent.CLICK,stopClickHandler);
			}
		}
		
		override protected function getCurrentSkinState():String
		{   
			if (!videoDisplay || !videoDisplay.videoPlayer)
				return null;
			
			var state:String = videoDisplay.videoPlayer.state;
			
			if (!enabled)
				state="disabled"
			
			if (__fullScreen)
				return "FullScreen";
			
			return state;
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			if(__sourceChange)
			{
				videoDisplay.autoPlay =true;
				videoDisplay.source = this.__source;
				__sourceChange = false;
			}
		}
		
		
		protected function stopClickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			videoDisplay.stop();
		}
		
		protected function volumeClickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
		}
		
		protected function openClickHandler(event:MouseEvent):void
		{
			
		}
		protected function playClickHandler(event:MouseEvent):void
		{
			videoDisplay.play();
		}
		protected function pauseClickHandler(event:MouseEvent):void
		{
			videoDisplay.pause();
		}
		
		public function play():void
		{
			videoDisplay.play();
		}
		public function stop():void
		{
			videoDisplay.stop();
		}
		public function pasue():void
		{
			videoDisplay.pause();
		}
	}
}