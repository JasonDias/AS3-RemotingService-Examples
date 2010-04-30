package com.jd.remoting.examples.robotlegshttp
{

	import flash.display.Sprite;

	[SWF(0xFFFFFF, width=400, height=300, frameRate=30)]
	public class RobotLegsHTTPSample extends Sprite
	{
		private var ourRobotLegsHTTPContext:RobotLegsHTTPContext;

		public function RobotLegsHTTPSample()
		{
			ourRobotLegsHTTPContext = new RobotLegsHTTPContext(this);
		}
	}
}
