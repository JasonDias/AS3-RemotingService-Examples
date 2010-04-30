package com.jd.remoting.examples.robotlegshttp.commands.config
{
	import com.jd.remoting.core.IRemotingService;
	import com.jd.remoting.examples.robotlegshttp.events.ApplicationConfigurationEvent;

	import com.jd.remoting.examples.robotlegshttp.remote.RobotLegsService;

	import org.robotlegs.mvcs.Command;

	public class ConfigureServiceCommand extends Command
	{
		override public function execute():void
		{
			injector.mapSingletonOf( IRemotingService, RobotLegsService );

			dispatch( new ApplicationConfigurationEvent( ApplicationConfigurationEvent.CONFIGURE_MODEL ) );
		}
	}
}