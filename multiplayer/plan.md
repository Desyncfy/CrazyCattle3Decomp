## MULTIPLAYER PLAN
- server needs to send a json (? or dict) of all sheep positions:
  * handle collision
  * style: {\[x, y, z, rotx, roty, rotz], \[...], ...} (npcs, for players also send decal number)
  * also send remaining sheep as int 
  * send winning user
  * send packet on player death
  * send packet on server connect, server start
- write in python with
