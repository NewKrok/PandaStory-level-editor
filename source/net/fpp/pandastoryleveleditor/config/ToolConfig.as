/**
 * Created by newkrok on 17/05/16.
 */
package net.fpp.pandastoryleveleditor.config
{
	import net.fpp.pandastoryleveleditor.config.vo.ToolConfigVO;
	import net.fpp.pandastoryleveleditor.constant.CToolId;
	import net.fpp.pandastoryleveleditor.constant.CToolType;
	import net.fpp.pandastoryleveleditor.controller.common.AToolController;
	import net.fpp.pandastoryleveleditor.controller.dynamicelement.DynamicElementToolController;
	import net.fpp.pandastoryleveleditor.controller.enemypath.EnemyPathToolController;
	import net.fpp.pandastoryleveleditor.controller.exportlevel.ExportToolController;
	import net.fpp.pandastoryleveleditor.controller.importlevel.ImportToolController;
	import net.fpp.pandastoryleveleditor.controller.polygonbackground.PolygonBackgroundToolController;
	import net.fpp.pandastoryleveleditor.controller.rectanglebackground.RectangleBackgroundToolController;
	import net.fpp.pandastoryleveleditor.controller.staticelement.StaticElementToolController;
	import net.fpp.pandastoryleveleditor.controller.units.UnitsToolController;
	import net.fpp.pandastoryleveleditor.controller.zoomin.ZoomInToolController;
	import net.fpp.pandastoryleveleditor.controller.zoomout.ZoomOutToolController;

	public class ToolConfig
	{
		public const configs:Vector.<ToolConfigVO> = new <ToolConfigVO>
						[
							new ToolConfigVO
							(
									CToolId.IMPORT,
									'Import',
									'ImportButtonIcon',
									ImportToolController,
									CToolType.IS_NOT_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.EXPORT,
									'Export',
									'ExportButtonIcon',
									ExportToolController,
									CToolType.IS_NOT_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.ZOOM_IN,
									'Zoom In',
									'ZoomInButtonIcon',
									ZoomInToolController,
									CToolType.IS_NOT_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.ZOOM_OUT,
									'Zoom Out',
									'ZoomOutButtonIcon',
									ZoomOutToolController,
									CToolType.IS_NOT_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.DRAG,
									'Drag',
									'DragButtonIcon',
									AToolController,
									CToolType.IS_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.RECTANGLE_BACKGROUND,
									'Rectangle Background',
									'RectangleBackgroundButtonIcon',
									RectangleBackgroundToolController,
									CToolType.IS_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.POLYGON_BACKGROUND,
									'Polygon Background',
									'PolygonBackgroundButtonIcon',
									PolygonBackgroundToolController,
									CToolType.IS_SELECTABLE
							)/*,

							new ToolConfigVO
							(
									CToolId.STATIC_ELEMENT,
									'Static Element',
									'StaticElementButtonIcon',
									StaticElementToolController,
									CToolType.IS_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.DYNAMIC_ELEMENT,
									'Dynamic Element',
									'DynamicElementButtonIcon',
									DynamicElementToolController,
									CToolType.IS_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.UNITS,
									'Units',
									'UnitsButtonIcon',
									UnitsToolController,
									CToolType.IS_SELECTABLE
							),

							new ToolConfigVO
							(
									CToolId.ENEMY_PATH,
									'Enemy Path',
									'EnemyPathIcon',
									EnemyPathToolController,
									CToolType.IS_SELECTABLE
							)*/
						]
				;
	}
}