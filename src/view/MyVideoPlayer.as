package view
{
	import spark.components.Button;
	import spark.components.SkinnableContainer;
	import spark.components.VideoDisplay;
	import spark.components.VideoPlayer;

	public class MyVideoPlayer extends SkinnableContainer
	{
		public function MyVideoPlayer()
		{
		}
		
		
		[SkinPart(required="true")]
		private var videoDisplay:VideoDisplay;
		
		[SkinPart(required="false")]
		private var play:Button
	}
}