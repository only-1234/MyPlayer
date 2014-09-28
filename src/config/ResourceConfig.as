package config
{
	public class ResourceConfig
	{
		public function ResourceConfig()
		{
		}
		
		[Embed(source="/image/buttonStyle1/btn_play_down.png")]
		[Bindable]
		public static var MyBtn_Play_Down:Class;
		
		[Embed(source="/image/buttonStyle1/btn_play_up.png")]
		[Bindable]
		public static var MyBtn_Play_Up:Class;
		
		[Embed(source="/image/buttonStyle1/btn_pause_down.png")]
		[Bindable]
		public static var MyBtn_Pause_Down:Class;
		
		[Embed(source="/image/buttonStyle1/btn_pause_up.png")]
		[Bindable]
		public static var MyBtn_Pause_Up:Class;
		
		[Embed(source="/image/buttonStyle1/btn_stop_down.png")]
		[Bindable]
		public static var MyBtn_Stop_Down:Class;
		
		[Embed(source="/image/buttonStyle1/btn_stop_up.png")]
		[Bindable]
		public static var MyBtn_Stop_Up:Class;
		
		[Embed(source="/image/buttonStyle1/btn_cfg_up.png")]
		[Bindable]
		public static var MyBtn_Open_Up:Class;
		
		[Embed(source="/image/buttonStyle1/btn_cfg_down.png")]
		[Bindable]
		public static var MyBtn_Open_Down:Class;
		
		[Embed(source="/image/buttonStyle1/btn_ss_up.png")]
		[Bindable]
		public static var MyBtn_Full_Up:Class;
		
		[Embed(source="/image/buttonStyle1/btn_ss_down.png")]
		[Bindable]
		public static var MyBtn_Full_Down:Class;
		
		[Embed(source="/image/buttonStyle1/btn_sound_up.png")]
		[Bindable]
		public static var MyBtn_Sound_Up:Class;
		
		[Embed(source="/image/buttonStyle1/btn_sound_down.png")]
		[Bindable]
		public static var MyBtn_Sound_Down:Class;
	}
}