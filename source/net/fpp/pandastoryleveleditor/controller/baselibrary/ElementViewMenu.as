/**
 * Created by newkrok on 22/05/16.
 */
package net.fpp.pandastoryleveleditor.controller.baselibrary
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	import net.fpp.common.display.HUIBox;

	import net.fpp.common.display.UIBox;
	import net.fpp.pandastoryleveleditor.assets.skin.CSkinAsset;
	import net.fpp.pandastoryleveleditor.assets.skin.SkinManager;
	import net.fpp.pandastoryleveleditor.component.Button;
	import net.fpp.pandastoryleveleditor.controller.baselibrary.events.BaseLibraryToolMenuEvent;

	public class ElementViewMenu extends Sprite
	{
		private var _background:DisplayObject;
		private var _container:UIBox;

		private var _deleteButton:Button;
		private var _bringForwardButton:Button;
		private var _sendBackwardButton:Button;
		private var _closeButton:Button;

		public function ElementViewMenu()
		{
			this._background = SkinManager.getSkin( CSkinAsset.TRANSPARENT_BACKGROUND );
			this.addChild( this._background );

			this._container = new UIBox();
			this._container.gap = 5;
			this.addChild( this._container );

			var arrangeButtonContainer:HUIBox = new HUIBox();
			arrangeButtonContainer.gap = 5;
			this._container.addChild( arrangeButtonContainer );

			arrangeButtonContainer.addChild( this.createBringForwardButton() );
			arrangeButtonContainer.addChild( this.createSendBackwardButton() );

			this._bringForwardButton.width = 75;
			this._sendBackwardButton.width = 75;

			arrangeButtonContainer.draw();

			this.createCloseButton();
			this.createDeleteButton();

			this._closeButton.width = this.width;
			this._deleteButton.width = this.width;

			var padding:Number = 5;
			this._background.width = this.width + padding * 2;
			this._background.height = this.height + padding * 2;

			this._container.x = padding;
			this._container.y = padding;
		}

		private function createBringForwardButton():Button
		{
			this._bringForwardButton = new Button(
					SkinManager.getSkin( CSkinAsset.BUTTON_NORMAL_STATE ),
					SkinManager.getSkin( CSkinAsset.BUTTON_OVER_STATE ),
					'Forward'
			);
			this._bringForwardButton.disable();

			return this._bringForwardButton;
		}

		private function createSendBackwardButton():Button
		{
			this._sendBackwardButton = new Button(
					SkinManager.getSkin( CSkinAsset.BUTTON_NORMAL_STATE ),
					SkinManager.getSkin( CSkinAsset.BUTTON_OVER_STATE ),
					'Backward'
			);
			this._sendBackwardButton.disable();

			return this._sendBackwardButton;
		}

		private function createCloseButton():void
		{
			this._closeButton = new Button(
					SkinManager.getSkin( CSkinAsset.BUTTON_NORMAL_STATE ),
					SkinManager.getSkin( CSkinAsset.BUTTON_OVER_STATE ),
					'Close'
			);
			this._closeButton.disable();
			this._container.addChild( this._closeButton );
		}

		private function createDeleteButton():void
		{
			this._deleteButton = new Button(
					SkinManager.getSkin( CSkinAsset.BUTTON_NORMAL_STATE ),
					SkinManager.getSkin( CSkinAsset.BUTTON_OVER_STATE ),
					'Delete'
			);
			this._deleteButton.disable();
			this._container.addChild( this._deleteButton );
		}

		public function enable():void
		{
			this._sendBackwardButton.enable();
			this._sendBackwardButton.addEventListener( MouseEvent.CLICK, this.onSendBackwardRequest );

			this._bringForwardButton.enable();
			this._bringForwardButton.addEventListener( MouseEvent.CLICK, this.onBringForwardRequest );

			this._closeButton.enable();
			this._closeButton.addEventListener( MouseEvent.CLICK, this.onCloseRequest );

			this._deleteButton.enable();
			this._deleteButton.addEventListener( MouseEvent.CLICK, this.onDeleteRequest );
		}

		public function disable():void
		{
			this._sendBackwardButton.disable();
			this._sendBackwardButton.removeEventListener( MouseEvent.CLICK, this.onSendBackwardRequest );

			this._bringForwardButton.disable();
			this._bringForwardButton.removeEventListener( MouseEvent.CLICK, this.onBringForwardRequest );

			this._closeButton.disable();
			this._closeButton.removeEventListener( MouseEvent.CLICK, this.onCloseRequest );

			this._deleteButton.disable();
			this._deleteButton.removeEventListener( MouseEvent.CLICK, this.onDeleteRequest );
		}

		private function onSendBackwardRequest( e:MouseEvent ):void
		{
			this.dispatchEvent( new BaseLibraryToolMenuEvent( BaseLibraryToolMenuEvent.SEND_BACKWARD ) );

			e.stopPropagation();
		}

		private function onBringForwardRequest( e:MouseEvent ):void
		{
			this.dispatchEvent( new BaseLibraryToolMenuEvent( BaseLibraryToolMenuEvent.BRING_FORWARD ) );

			e.stopPropagation();
		}

		private function onCloseRequest( e:MouseEvent ):void
		{
			this.dispatchEvent( new BaseLibraryToolMenuEvent( BaseLibraryToolMenuEvent.CLOSE_REQUEST ) );

			e.stopPropagation();
		}

		private function onDeleteRequest( e:MouseEvent ):void
		{
			this.dispatchEvent( new BaseLibraryToolMenuEvent( BaseLibraryToolMenuEvent.DELETE_REQUEST ) );

			e.stopPropagation();
		}
	}
}