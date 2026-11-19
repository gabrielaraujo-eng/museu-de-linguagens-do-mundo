// Snippet AS3 de listener; requer uma instância Sprite/DisplayObject e runtime Flash/AIR.
package {
  import flash.display.Sprite;
  import flash.events.Event;

  public class FrameExample extends Sprite {
    public function FrameExample() {
      addEventListener(Event.ENTER_FRAME, onFrame);
    }

    private function onFrame(event:Event):void {
    }
  }
}
