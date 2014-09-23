package event
{
	import flash.events.Event;
	
	public class EventBase extends Event
	{
		public function EventBase(type:String,data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			__data = data;
		}
		
		private var __data:*;

		public function get data():*
		{
			return __data;
		}

		public function set data(value:*):void
		{
			__data = value;
		}

	}
}