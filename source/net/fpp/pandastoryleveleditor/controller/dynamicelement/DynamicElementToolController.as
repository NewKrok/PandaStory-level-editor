/**
 * Created by newkrok on 09/06/16.
 */
package net.fpp.pandastoryleveleditor.controller.dynamicelement
{
	import net.fpp.pandastoryleveleditor.controller.baselibrary.BaseLibraryToolController;

	public class DynamicElementToolController extends BaseLibraryToolController
	{
		public function DynamicElementToolController()
		{
			super();

			this.setLibraryElementList(
					new <String>[
						'bush',
						'tree',
						'building'
					]
			);

			this.setLevelDataId( 'dynamicElementData' );
		}
	}
}