package com.jd.remoting.examples.robotlegshttp.remote
{
	import com.jd.remoting.core.IRemotingConnection;
	import com.jd.remoting.core.IResponder;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	public class TwitterRemotingConnection implements IRemotingConnection
	{
		private var ourURL:String;

		public function TwitterRemotingConnection( myURL:String )
		{
			ourURL = myURL;
		}

		public function request( myService:String, myCommand:String, myResponder:IResponder, ... myParams ):void
		{
			var myLoader:URLLoader = new URLLoader();
			myLoader.addEventListener( Event.COMPLETE, function( e:Event ):void
			{
				myResponder.result( e.target.data );
			} );

			myLoader.addEventListener( IOErrorEvent.IO_ERROR, function( e:IOErrorEvent ):void
			{
				myResponder.fault( e.text );
			} );

			var ur:URLRequest = new URLRequest( ourURL );
			var uv:URLVariables = new URLVariables();
			uv.q = myParams;
			ur.data = uv;
			myLoader.load( ur );
		}

		public function connectTo( myCommand:String, ... myParams ):void
		{
		}
	}
}
