package view
{
	import component.MyButton;
	
	import flash.events.MouseEvent;
	
	import mx.core.mx_internal;
	
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
			__source = value;
			if(videoDisplay!=null)
			{
				videoDisplay.source = value;
			}
		}

		private var __fullScreen:Boolean = false;
		
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			// TODO Auto Generated method stub
			super.partAdded(partName, instance);
			if(instance == videoDisplay)
			{
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
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			// TODO Auto Generated method stub
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
		
		protected function stopClickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			
		}
		
		protected function volumeClickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			
		}
		
		protected function openClickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			
		}
		protected function playClickHandler(event:MouseEvent):void
		{
			
		}
		protected function pauseClickHandler(event:MouseEvent):void
		{
			
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