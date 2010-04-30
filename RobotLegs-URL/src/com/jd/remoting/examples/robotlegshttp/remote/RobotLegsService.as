package com.jd.remoting.examples.robotlegshttp.remote
{

	import com.jd.remoting.base.URLResponder;
	import com.jd.remoting.core.IRemotingConnection;
	import com.jd.remoting.core.IRemotingService;
	import com.jd.remoting.core.IRequest;
	import com.jd.remoting.examples.robotlegshttp.remote.requests.IRobotLegsRequest;

	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Actor;

	public class RobotLegsService extends Actor implements IRemotingService
	{
		private var ourGateway:IRemotingConnection;

		[Inject(name="SERVICE_URL")]
		public var url:String;

		[Inject]
		public var injector:IInjector;

		public function RobotLegsService()
		{

		}

		public function request( myRequest:IRequest ):void
		{
			if ( ourGateway == null )
				ourGateway = new TwitterRemotingConnection( url );

			if ( myRequest as IRobotLegsRequest )
				injector.injectInto( myRequest );

			var myArgsArray:Array = new Array();
			myArgsArray.push( myRequest.remoteServiceName );
			myArgsArray.push( myRequest.remoteCallName );
			myArgsArray.push( new URLResponder( myRequest.onResponse, myRequest.onFault ) );
			myArgsArray = myArgsArray.concat( myRequest.requestVars );

			gateway.request.apply( this, myArgsArray );
		}

		public function get gateway():IRemotingConnection
		{
			return ourGateway;
		}
	}
}