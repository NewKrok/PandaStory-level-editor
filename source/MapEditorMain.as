package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import net.fpp.common.bitmap.StaticBitmapAssetManager;
	import net.fpp.common.static.FPPContextMenu;
	import net.fpp.pandastory.asset.TerrainTextures;

	import net.fpp.pandastoryleveleditor.EditorWorld;
	import net.fpp.pandastoryleveleditor.Menu;
	import net.fpp.pandastoryleveleditor.config.ToolConfig;
	import net.fpp.pandastoryleveleditor.config.vo.ToolConfigVO;
	import net.fpp.pandastoryleveleditor.constant.CToolId;
	import net.fpp.pandastoryleveleditor.controller.common.AToolController;
	import net.fpp.pandastoryleveleditor.events.MenuEvent;

	public class MapEditorMain extends Sprite
	{
		private var _editorMain:EditorWorld;

		private var _menu:Menu;

		public function MapEditorMain()
		{
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;

			StaticBitmapAssetManager.scaleFactor = 2;
			StaticBitmapAssetManager.instance.loadFromJSONAtlas( TerrainTextures.AtlasImage, TerrainTextures.AtlasDescription );
			//StaticBitmapAssetManager.instance.loadFromStarlingAtlas( GameAssets.game_atlas, GameAssets.game_atlas_xml );

			this.addEventListener( Event.ADDED_TO_STAGE, this.onAddedToStageHandler );

			FPPContextMenu.create( this );
		}

		private function onAddedToStageHandler( e:Event ):void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, onAddedToStageHandler );

			this.addChild( this._editorMain = new EditorWorld );
			this.addChild( this._menu = new Menu );

			this.createTools();

			this._menu.selectMenuElement( CToolId.DRAG );
		}

		private function createTools():void
		{
			var toolConfig:ToolConfig = new ToolConfig();

			for( var i:int = 0; i < toolConfig.configs.length; i++ )
			{
				var config:ToolConfigVO = toolConfig.configs[ i ];

				this._menu.addElement( config.id, config.name, config.iconImageSrc, config.isSelectable );
				this._menu.addEventListener( MenuEvent.CHANGE_CONTROLLER, onChangeControllerHandler );

				var toolController:AToolController = new config.toolControllerClass();
				toolController.id = config.id;
				toolController.isSelectable = config.isSelectable;

				this._editorMain.registerToolController( config.id, toolController );
			}
		}

		private function onChangeControllerHandler( e:MenuEvent ):void
		{
			this._editorMain.selectToolController( e.id );
		}
	}
}