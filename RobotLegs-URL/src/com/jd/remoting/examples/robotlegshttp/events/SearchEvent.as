package com.jd.remoting.examples.robotlegshttp.events
{
	import flash.events.Event;

	public class SearchEvent extends Event
	{

		public static const SEARCH:String = "SearchEvent.SEARCH";
		public static const RESULTS_RECEIVED:String = "SearchEvent.RESULTS_RECEIVED";
		public static const RESULTS_UPDATED:String = "SearchEvent.RESULTS_UPDATED";

		public var criteria:String;
		public var results:Array;

		public function SearchEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}

		public override function clone():Event
		{
			var myCloneEvent:SearchEvent = new SearchEvent( type, bubbles, cancelable );
			myCloneEvent.criteria = criteria;
			myCloneEvent.results = results;
			return myCloneEvent;
		}

		public override function toString():String
		{
			return formatToString( "SearchEvent", "type", "bubbles", "cancelable", "eventPhase" );
		}
	}
}