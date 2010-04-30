package com.jd.remoting.examples.robotlegshttp.remote.requests.search
{

	import com.jd.remoting.core.IRemotingService;
	import com.jd.remoting.examples.robotlegshttp.events.SearchEvent;

	import org.robotlegs.mvcs.Command;

	public class SearchCommand extends Command
	{
		[Inject]
		public var event:SearchEvent;

		[Inject]
		public var service:IRemotingService;

		override public function execute():void
		{
			service.request(new SearchRequest(event.criteria));
		}
	}
}