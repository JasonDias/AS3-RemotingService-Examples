package com.jd.remoting.examples.robotlegshttp.commands
{
	import com.jd.remoting.examples.robotlegshttp.events.SearchEvent;
	import com.jd.remoting.examples.robotlegshttp.models.ISearchModel;

	import org.robotlegs.mvcs.Command;

	public class UpdateSearchModelCommand extends Command
	{
		[Inject]
		public var event:SearchEvent;

		[Inject]
		public var searchModel:ISearchModel;

		override public function execute():void
		{
			searchModel.results = event.results;
		}
	}
}