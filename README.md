
Instructions
--------

1. open FaceOSC, and turn on `raw` and `syphon`, turn off `pose` and `gesture`. Then you can press ‘m’ to toggle the face mesh, and press ‘g’ to toggle the GUI.

2. Install Syphon library in Processing.

3.open the processing sketch. run it, you should be able to see a face with a bunch of points on it.

4. each point has a id number.

5. there is a `ArrayList` called `points`,   use `points.get(id)` to get the `PVector` which is the point’s position.



OSC Key Controls
-------------

* r - reset the face tracker
* m - toggle face mesh drawing
* g - toggle gui's visibility
* p - pause/unpause (only works with movie source)
* up/down - increase/decrease movie playback speed (only works with movie source)


OSC Information
---------------

 * Pose
  * **center position**: /pose/position
  * **scale**: /pose/scale
  * **orientation** (which direction you're facing): /pose/orientation
 * Gestures
  * **mouth width**: /gesture/mouth/width
  * **mouth height**: /gesture/mouth/height
  * **left eyebrow height**: /gesture/eyebrow/left
  * **right eyebrow height**: /gesture/eyebrow/right
  * **left eye openness**: /gesture/eye/left
  * **right eye openness**: /gesture/eye/right
  * **jaw openness**: /gesture/jaw
  * **nostril flate**: /gesture/nostrils
 * Raw
  * **raw points** (66 xy-pairs): /raw
