package com.jd.remoting.examples.robotlegshttp.commands.config
{

	import com.jd.remoting.examples.robotlegshttp.view.SearchView;

	import com.jd.remoting.examples.robotlegshttp.view.SearchViewMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;

	public class ConfigureViewCommand extends Command
	{
		override public function execute():void
		{
			mediatorMap.mapView( SearchView, SearchViewMediator );

			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}