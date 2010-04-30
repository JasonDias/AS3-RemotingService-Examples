package com.jd.remoting.examples.robotlegshttp
{
	import com.jd.remoting.examples.robotlegshttp.commands.AddSearchControlsCommand;
	import com.jd.remoting.examples.robotlegshttp.commands.config.StartupCommand;

	import com.jd.remoting.examples.robotlegshttp.view.SearchView;

	import flash.display.DisplayObjectContainer;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	public class RobotLegsHTTPContext extends Context
	{
		public function RobotLegsHTTPContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}

		override public function startup():void
		{
			injector.mapValue( String, "http://search.twitter.com/search.atom", "SERVICE_URL" );

			commandMap.mapEvent( ContextEvent.STARTUP, StartupCommand, ContextEvent, true );
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, AddSearchControlsCommand, ContextEvent );

			dispatchEvent( new ContextEvent( ContextEvent.STARTUP ) );
		}
	}
}