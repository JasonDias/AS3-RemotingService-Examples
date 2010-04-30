package com.jd.remoting.examples.robotlegshttp.commands.config
{

	import com.jd.remoting.examples.robotlegshttp.events.ApplicationConfigurationEvent;
	import com.jd.remoting.examples.robotlegshttp.events.SearchEvent;

	import com.jd.remoting.examples.robotlegshttp.remote.requests.search.SearchCommand;

	import org.robotlegs.mvcs.Command;

	public class ConfigureRequestCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(SearchEvent.SEARCH, SearchCommand, SearchEvent);

			dispatch(new ApplicationConfigurationEvent(ApplicationConfigurationEvent.CONFIGURE_SERVICE));
		}
	}
}