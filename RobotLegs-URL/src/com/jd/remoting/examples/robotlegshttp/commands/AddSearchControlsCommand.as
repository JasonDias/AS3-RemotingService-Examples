package com.jd.remoting.examples.robotlegshttp.commands
{
	import com.jd.remoting.examples.robotlegshttp.view.SearchView;

	import org.robotlegs.mvcs.Command;

	public class AddSearchControlsCommand extends Command
	{
		override public function execute():void
		{
			contextView.addChild(new SearchView());
		}
	}
}