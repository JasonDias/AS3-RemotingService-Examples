package com.jd.remoting.examples.robotlegshttp.commands.config
{
	import com.jd.remoting.examples.robotlegshttp.events.ApplicationConfigurationEvent;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;

	public class StartupCommand extends Command
	{
		[Inject]
		public var event:ContextEvent;

		override public function execute():void
		{
			commandMap.mapEvent( ApplicationConfigurationEvent.CONFIGURE_CONTROLLER, ConfigureControllerCommand );
			commandMap.mapEvent( ApplicationConfigurationEvent.CONFIGURE_REQUEST, ConfigureRequestCommand );
			commandMap.mapEvent( ApplicationConfigurationEvent.CONFIGURE_SERVICE, ConfigureServiceCommand );
			commandMap.mapEvent( ApplicationConfigurationEvent.CONFIGURE_MODEL, ConfigureModelCommand );
			commandMap.mapEvent( ApplicationConfigurationEvent.CONFIGURE_VIEW, ConfigureViewCommand );

			dispatch( new ApplicationConfigurationEvent( ApplicationConfigurationEvent.CONFIGURE_CONTROLLER ) );
		}
	}
}