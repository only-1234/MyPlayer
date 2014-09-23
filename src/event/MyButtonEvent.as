package event
{
	public class MyButtonEvent extends EventBase
	{
		
		public function MyButtonEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, data, bubbles, cancelable);
		}
	}
}