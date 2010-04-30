package com.jd.remoting.examples.robotlegshttp.commands.config
{
	import com.jd.remoting.examples.robotlegshttp.commands.UpdateSearchModelCommand;
	import com.jd.remoting.examples.robotlegshttp.events.ApplicationConfigurationEvent;
	import com.jd.remoting.examples.robotlegshttp.events.SearchEvent;

	import org.robotlegs.mvcs.Command;

	public class ConfigureControllerCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent( SearchEvent.RESULTS_RECEIVED, UpdateSearchModelCommand, SearchEvent );

			dispatch( new ApplicationConfigurationEvent( ApplicationConfigurationEvent.CONFIGURE_REQUEST ) );
		}
	}
}