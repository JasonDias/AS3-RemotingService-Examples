package com.jd.remoting.examples.robotlegshttp.models
{
	import com.jd.remoting.examples.robotlegshttp.events.SearchEvent;

	import org.robotlegs.mvcs.Actor;

	public class SearchModel extends Actor implements ISearchModel
	{
		private var ourResults:Array;

		public function get results():Array
		{
			return ourResults;
		}

		public function set results( myValues:Array ):void
		{
			ourResults = myValues;
			dispatch(new SearchEvent(SearchEvent.RESULTS_UPDATED));
		}
	}
}