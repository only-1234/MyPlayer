package config
{
	public class ResourceConfig
	{
		public function ResourceConfig()
		{
		}
		
		[Embed(source="/image/button/play_down.png")]
		[Bindable]
		public static var MyBtn_Play_Down:Class;
		
		[Embed(source="/image/button/play_up.png")]
		[Bindable]
		public static var MyBtn_Play_Up:Class;
		
		[Embed(source="/image/button/pause_down.png")]
		[Bindable]
		public static var MyBtn_Pause_Down:Class;
		
		[Embed(source="/image/button/pause_up.png")]
		[Bindable]
		public static var MyBtn_Pause_Up:Class;
	}
}