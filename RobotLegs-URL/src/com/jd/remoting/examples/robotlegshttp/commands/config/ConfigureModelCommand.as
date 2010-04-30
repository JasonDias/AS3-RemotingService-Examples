package com.jd.remoting.examples.robotlegshttp.commands.config
{
	import com.jd.remoting.examples.robotlegshttp.events.ApplicationConfigurationEvent;
	import com.jd.remoting.examples.robotlegshttp.models.ISearchModel;
	import com.jd.remoting.examples.robotlegshttp.models.SearchModel;

	import org.robotlegs.mvcs.Command;

	public class ConfigureModelCommand extends Command
	{
		override public function execute():void
		{
			injector.mapSingletonOf( ISearchModel, SearchModel );

			dispatch(new ApplicationConfigurationEvent(ApplicationConfigurationEvent.CONFIGURE_VIEW));
		}
	}
}