/**
 * Created by newkrok on 15/05/16.
 */
package net.fpp.pandastoryleveleditor.controller.polygonbackground
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	import net.fpp.common.display.UIBox;
	import net.fpp.common.display.UIGrid;
	import net.fpp.common.geom.SimplePoint;
	import net.fpp.pandastory.config.terraintexture.PolygonBackgroundTerrainTextureConfig;
	import net.fpp.pandastory.game.module.background.polygonbackground.vo.PolygonBackgroundTerrainTextureVO;
	import net.fpp.pandastoryleveleditor.controller.polygonbackground.events.PolygonBackgroundToolMenuEvent;

	public class PolygonBackgroundTerrainTextureGrid extends Sprite
	{
		private var _elementContainer:UIGrid;

		public function PolygonBackgroundTerrainTextureGrid()
		{
			this._elementContainer = new UIGrid( 4, new SimplePoint( 32, 32 ) );
			this._elementContainer.gap = 5;

			this.addChild( this._elementContainer );

			this.createTerrainTextures();
		}

		private function createTerrainTextures():void
		{
			var terrainTextures:Vector.<PolygonBackgroundTerrainTextureVO> = PolygonBackgroundTerrainTextureConfig.instance.getTerrainTextureList();

			for( var i:int = 0; i < terrainTextures.length; i++ )
			{
				var container:UIBox = new UIBox();

				var terrainTextureView:PolygonBackgroundTerrainTextureView = new PolygonBackgroundTerrainTextureView( terrainTextures[ i ] )
				terrainTextureView.width = this._elementContainer.gridSize.x;
				terrainTextureView.height = this._elementContainer.gridSize.y;

				container.addChild( terrainTextureView );

				this._elementContainer.addChild( container );
			}
		}

		public function enable():void
		{
			this.mouseEnabled = true;
			this.mouseChildren = true;

			this.addEventListener( MouseEvent.CLICK, this.onMouseDownHandler );
		}

		public function disable():void
		{
			this.mouseEnabled = false;
			this.mouseChildren = false;

			this.removeEventListener( MouseEvent.CLICK, this.onMouseDownHandler );
		}

		private function onMouseDownHandler( e:MouseEvent ):void
		{
			if( e.target is PolygonBackgroundTerrainTextureView )
			{
				this.dispatchEvent( new PolygonBackgroundToolMenuEvent( PolygonBackgroundToolMenuEvent.CHANGE_TERRAIN_TEXTURE_REQUEST, ( e.target as PolygonBackgroundTerrainTextureView ).getTerrainTextureVO() ) );
			}
		}
	}
}