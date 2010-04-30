package com.jd.remoting.examples.robotlegshttp.remote.requests.search
{
	import com.jd.remoting.examples.robotlegshttp.events.SearchEvent;
	import com.jd.remoting.examples.robotlegshttp.remote.requests.IRobotLegsRequest;
	import com.jd.remoting.examples.robotlegshttp.remote.requests.RobotLegsAbstractRequest;

	public class SearchRequest extends RobotLegsAbstractRequest implements IRobotLegsRequest
	{
		private var ourSearchCriteria:String;

		public function SearchRequest( mySearchCriteria:String )
		{
			ourSearchCriteria = mySearchCriteria;
			requestVars.push( ourSearchCriteria );
		}

		public function onResponse( myResponseObject:Object ):void
		{
			var myXML:XML = removeNS(new XML( myResponseObject ));
			var myResults:XMLList = myXML.entry;
			var myArray:Array = [];
			for each ( var myNode:XML in myResults )
			{
				myArray.push(myNode.title);
			}
			var mySearchEvent:SearchEvent = new SearchEvent( SearchEvent.RESULTS_RECEIVED );
			mySearchEvent.results = myArray;
			dispatch( mySearchEvent );
		}

		// remove namespace cause don't feel like dealing with namespaces...
		private function removeNS( anXML:XML ):XML
		{
			var xmlString:String = anXML.toXMLString();
			var xmlnsPattern:RegExp = new RegExp( "xmlns[^\"]*\"[^\"]*\"", "gi" );
			var namespaceRemovedXML:String = xmlString.replace( xmlnsPattern, "" );

			var aaaPattern:RegExp = new RegExp( "aaa:lang[^\"]*\"[^\"]*\"", "gi" );
			var aaaRemovedXML:String = namespaceRemovedXML.replace( aaaPattern, "" );

			var twitterPattern:RegExp = new RegExp( "twitter:", "gi" );
			var twitterRemovedXML:String = aaaRemovedXML.replace( twitterPattern, "" );

			var openSearchPattern:RegExp = new RegExp( "openSearch:", "gi" );
			var openSearchRemovedXML:String = twitterRemovedXML.replace( openSearchPattern, "" );

			return new XML( openSearchRemovedXML );
		}

		public function onFault( myFault:String ):void
		{
			trace( "[SearchRequest] FAULT:" + myFault );
		}

		public function get remoteServiceName():String
		{
			return null;
		}

		public function get remoteCallName():String
		{
			return null;
		}
	}
}