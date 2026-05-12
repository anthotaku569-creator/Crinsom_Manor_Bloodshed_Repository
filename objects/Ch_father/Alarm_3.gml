/// @description Burst parry
image_index = 0;
_hbox.master.image_index = 0;
_hbox.master.image_xscale = image_xscale*-1;
self.velx = 12* _hbox.master.image_xscale;
_hbox.master.velx = -18* _hbox.master.image_xscale;
self.vely = 0;
_hbox.master.vely = 0;
self.sprite_index = self.animations.landing.heavy;
_hbox.master.sprite_index = _hbox.master.animations.landing.heavy;
self.state = states.kdown_recovery;
_hbox.master.state = states.kdown_recovery;
bars.Humanity.actual += 25;

instance_destroy(hitbox_obj);