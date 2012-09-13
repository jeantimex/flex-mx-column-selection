package com.ext.component {
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.Button;
	import mx.controls.DataGrid;
	
	/**
	 * Use a sprk button to easily customize the skin
	 */
	public class ExtColumnHeaderMenuButton extends Button {
		
		public var grid:ExtDataGrid;
		
		/**
		 * Constructor
		 */
		public function ExtColumnHeaderMenuButton()
		{
			this.buttonMode = true;
			this.setStyle("styleName", "columnHeaderMenuButton");
			hide();
		}
		
		override protected function mouseDownHandler(e:MouseEvent):void {
			e.stopImmediatePropagation();
		}
		
		override protected function clickHandler(e:MouseEvent):void {
			// Toggle the drop down menu
			grid.toggleColumnHeaderMenu(e);
		}
		
		public function show():void {
			this.visible = true;
			this.includeInLayout = true;
		}
		
		public function hide():void {
			this.visible = false;
			this.includeInLayout = false;
		}
	}
}