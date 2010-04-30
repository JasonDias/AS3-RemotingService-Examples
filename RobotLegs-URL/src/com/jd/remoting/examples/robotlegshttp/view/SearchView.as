package com.jd.remoting.examples.robotlegshttp.view
{
	import com.bit101.components.HBox;
	import com.bit101.components.List;
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	import com.bit101.components.VBox;
	import com.jd.remoting.examples.robotlegshttp.events.SearchEvent;

	import flash.display.Sprite;
	import flash.events.MouseEvent;


	public class SearchView extends Sprite
	{
		private var ourInputText:Text;
		private var ourSearchButton:PushButton;
		private var ourResultsList:List;

		public function SearchView()
		{
			var myVBox:VBox = new VBox(this);
			var myHBox:HBox = new HBox(myVBox);

			ourInputText = new Text();
			ourInputText.height = 20;
			ourInputText.width = 250;
			ourInputText.text = "What to search...";
			myHBox.addChild(ourInputText);

			ourSearchButton = new PushButton();
			ourSearchButton.label = "search";
			myHBox.addChild(ourSearchButton);
			ourSearchButton.addEventListener(MouseEvent.CLICK, searchClicked);

			ourResultsList = new List();
			ourResultsList.width = 355;
			ourResultsList.height = 255;
			myVBox.addChild(ourResultsList);
		}

		private function searchClicked( event:MouseEvent ):void
		{
			var mySearchEvent:SearchEvent = new SearchEvent(SearchEvent.SEARCH);
			mySearchEvent.criteria = ourInputText.text;
			dispatchEvent(mySearchEvent);
		}

		public function showResults(myResults:Array):void
		{
			ourResultsList.items = myResults;
		}
	}
}