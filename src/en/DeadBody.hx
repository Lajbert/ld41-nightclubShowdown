package en;

import mt.MLib;

class DeadBody extends Entity {
	public function new(e:Entity) {
		super(e.cx,e.cy);
		xr = e.xr;
		yr = e.yr;

		dir = e.dir;
		dx = e.lastHitDir * rnd(0.2,0.2);
		gravity*=0.25;
		frict = 0.97;
		dy = -0.1;
		spr.anim.registerStateAnim("dummyDeathBounce",2, function() return !onGround && cd.has("hitGround"));
		spr.anim.registerStateAnim("dummyDeathFly",1, function() return !onGround);
		spr.anim.registerStateAnim("dummyDeathGround",0);
	}

	override public function dispose() {
		super.dispose();
	}

	override function onLand() {
		if( MLib.fabs(dy)<=0.1 )
			dy = 0;
		else
			dy = -dy*0.7;
		frict = 0.8;
		cd.setS("hitGround",Const.INFINITE);
	}

	override public function update() {
		super.update();
	}
}