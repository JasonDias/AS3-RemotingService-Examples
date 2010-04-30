package com.jd.remoting.examples.robotlegshttp.remote.requests
{
	import flash.events.Event;

	import org.robotlegs.mvcs.Actor;

	public class RobotLegsAbstractRequest extends Actor
	{
		private var ourRequestVars:Array;

		public function RobotLegsAbstractRequest()
		{
			ourRequestVars = new Array();
		}

		public function set requestVars( myVars:Array ):void
		{
			ourRequestVars = myVars;
		}

		public function get requestVars():Array
		{
			return ourRequestVars;
		}

		public function dispatchEvent( event:Event ):Boolean
		{
			return dispatch(event);
		}

		public function hasEventListener( type:String ):Boolean
		{
			return eventDispatcher.hasEventListener(type);
		}

		public function willTrigger( type:String ):Boolean
		{
			return eventDispatcher.willTrigger(type);
		}

		public function removeEventListener( type:String, listener:Function, useCapture:Boolean = false ):void
		{
			eventMap.unmapListener(eventDispatcher, type, listener);
		}

		public function addEventListener( type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void
		{
			eventMap.mapListener(eventDispatcher, type, listener);
		}
	}
}