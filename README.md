# Platformer Game Attempt with GODOT
 an attempt was made
<br/><br/>
Exploring more on what godot has to offer, first thing I do here is exploring my options with animated sprite. Controlling sprite on script is very (and I mean very very) messy and we should totally learn animation tree instead. However, here since the whole thing is new I want to see to what extent animating on script can go.
<br/><br/><br/>
Well turns out not very far, controlling when to change animation on script is very weird since the entire player object must abide by physics process which is checked every tick(?) which causes a lot of problem with animation looping (especially on jumping loop stop, maybe even falling animation and landing).
