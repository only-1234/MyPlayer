package component
{
	import event.MyButtonEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import spark.components.Image;
	import spark.components.supportClasses.ButtonBase;
	import spark.components.supportClasses.Skin;
	
	[Exclude(kind="style", name="cornerRadius")]
	
	public class MyButton extends ButtonBase
	{
		public function MyButton()
		{
			//TODO: implement function
			super();
		}
		
		[SkinPart(required="false")]
		public var image:Image;
		
		private var __upImage:Class;

		[Bindable(event="upImageChange")]
		public function get upImage():Class
		{
			return __upImage;
		}

		public function set upImage(value:Class):void
		{
			if( __upImage !== value)
			{
				__upImage = value;
				dispatchEvent(new Event("upImageChange"));
			}
		}

		
		private var __downImage:Class;

		[Bindable(event="downImageChange")]
		public function get downImage():Class
		{
			if(__downImage ==null)
				return __upImage;
			return __downImage;
		}

		public function set downImage(value:Class):void
		{
			if( __downImage !== value)
			{
				__downImage = value;
				dispatchEvent(new Event("downImageChange"));
			}
		}
		
		private var __disabledImage:Class;

		[Bindable(event="disabledImageChange")]
		public function get disabledImage():Class
		{
			if(__disabledImage ==null)
				return __upImage;
			return __disabledImage;
		}

		public function set disabledImage(value:Class):void
		{
			if( __disabledImage !== value)
			{
				__disabledImage = value;
				dispatchEvent(new Event("disabledImageChange"));
			}
		}
		
		private var __overImage:Class;

		[Bindable(event="overImageChange")]
		public function get overImage():Class
		{
			if(__overImage ==null)
				return __upImage;
			return __overImage;
		}

		public function set overImage(value:Class):void
		{
			if( __overImage !== value)
			{
				__overImage = value;
				dispatchEvent(new Event("overImageChange"));
			}
		}
		
		override protected function commitProperties():void
		{
			// TODO Auto Generated method stub
			super.commitProperties();
		}
		
		override protected function createChildren():void
		{
			// TODO Auto Generated method stub
			super.createChildren();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// TODO Auto Generated method stub
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
		
		
		protected override function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName,instance);
		}
		
		protected override function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName,instance);
		}
	}
}