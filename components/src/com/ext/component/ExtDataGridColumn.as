//////////////////////////////////////////////////////
//
// ExtDataGridColumn
// Works with ExtDataGrid
//
//////////////////////////////////////////////////////
package com.ext.component
{
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.controls.Label;
	import mx.core.ClassFactory;
	
	/**
	 * Enhanced version of DataGridColumn. Adds suppor for:
	 * 
	 * <ul>
	 * <li> A "headerTooltip" property that sets the tooltip text for the column header.
	 * </ul>
	 */
	public class ExtDataGridColumn extends DataGridColumn
	{
		public var allowColumnSelection:Boolean = true;
		
		public function ExtDataGridColumn( columnName:String = null )
		{
			super( columnName );
		}
		
		/**
		 * Sets a tooltip for the column header.
		 */
		private var _headerTooltip:String;
		
		public function get headerTooltip(): String {
			return _headerTooltip;	
		}
		
		public function set headerTooltip( tooltip:String ): void {
			if (tooltip != _headerTooltip) {
				_headerTooltip = tooltip;
				updateHeaderRenderer();
			}
		}
		
		override public function set headerText( value:String ): void {
			if (headerText != value) {
				super.headerText = value;
				updateHeaderRenderer();
			}
		}
		
		protected function updateHeaderRenderer(): void {
			var hdrFactory:ClassFactory = new ClassFactory( Label );
			hdrFactory.properties = {
				text: headerText,
				toolTip: headerTooltip
			};
			headerRenderer = hdrFactory;
		}
	}
}