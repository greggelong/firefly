# firefly
a place to hold some code for firefly models

https://www.instagram.com/p/CjSzsKoB26l/


I have been thinking of fireflies all week. Here is a very simple start to a firefly model. The firefly is a class that has three states. A firefly can be charging its light organs, have completely charged light organs, or be flashing. each firefly has varying charging time, flash disposition (how they are too flash once charged), and flash length. They do not yet react to each others flashes but there is still some interesting behavior. #processing4 #creativecode #p5js #lightningbug #firefly 


## firefli2

https://www.instagram.com/p/CjXXUQVObyy/

I have added another condition that will make fully charged fireflies flash if any neighbor is flashing.

I have had to add a second array like the game of life, so as not to overwrite the current array.

The fireflies are still have different charge times, flash dispositions and and flash lengths, but you can definitely see some syncing 

behavior and and it really looks more biological/organic than firefli1. if you do make all the fire flyies have the same charge times, flash dispositions and flash lengths 

the whole block quickly falls into a steady on off pattern.


The condition that has fully charged firefly flash when a neighbor flashes most impacts the firefly's flash disposition.

The fireflies do not have an internal clock other than their charge time and that is not affected by neighbors as it is in other models

## lightningbug1

https://www.instagram.com/p/CjXrlkmN3lq/


I have liberated the lightning bugs from their 2d grid. In this different model. They are free to move they have location, velocity and acceleration, using PVectors. They still have 3 states, charging, charged and flashing.  They will flash if they are charged and any other bug is flashing at a distance of 1/4 of the screen.  You can interact with them they will follow your mouse the blue ball. #creativecode #processing4 #python #p5js #fireflies #lightningbugs


## lightningbug2conform

In liighningbub2conform I have added some code to make the lightning bugs exchange their traits, charge time, flash disposition and flash length.  They will exchange if they are charged and any neighbor is flashing with a radius of 5 times their radius.

This has an conforming synchronizing effect, as if  an idea has taken hold of the group. 

If you press a key their charge times , flash dispositions and flash lengths are randomly reset. 
 
A firefly only takes the trate of a neighboring flashing firefly if it is fully.
 

[] put in references to other models and journal articles


## lightningbug3conform

In this the fireflies have an additional flash color trait that is randomly assigned but exchanged like the other traits in the last version.   

With this trait you can more clearly see the synchronization.  

In the next version perhaps the color trait can affect the agents differently, perhaps there movement (speed, direction, etc)  

