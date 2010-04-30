package com.jd.remoting.examples.robotlegshttp.view
{


	import com.jd.remoting.examples.robotlegshttp.events.SearchEvent;
	import com.jd.remoting.examples.robotlegshttp.models.ISearchModel;

	import org.robotlegs.mvcs.Mediator;

	public class SearchViewMediator extends Mediator
	{
		[Inject]
		public var view:SearchView;

		[Inject]
		public var searchModel:ISearchModel;

		override public function onRegister():void
		{
			eventMap.mapListener(view, SearchEvent.SEARCH, dispatch);
			eventMap.mapListener(eventDispatcher, SearchEvent.RESULTS_UPDATED, handleSearchResults);
		}

		private function handleSearchResults(myEvent:SearchEvent):void
		{
			view.showResults(searchModel.results);
		}
	}
}