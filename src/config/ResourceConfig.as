package config
{
	public class ResourceConfig
	{
		public function ResourceConfig()
		{
		}
		
		[Embed(source="/image/button/down.png")]
		[Bindable]
		public static var MyBtn_Play_Down:Class;
		
		[Embed(source="/image/button/up.png")]
		[Bindable]
		public static var MyBtn_Play_Up:Class;
	}
}