-Start OpenIV
-Make sure you have a modified gameconfig.xml that could handle add-on vehicles with no problem, if you have a modified gameconfig installed, skip this step
-Put the "fooddelivery" folder on update/x64/dlcpacks/
-Click Edit Mode, then go to update.rpf/common/data and find dlclist.xml
-Extract and edit the dlclist.xml
-Copy this line:
		<Item>dlcpacks:/fooddelivery/</Item>
-Save it and drag and drop the dlclist.xml to update.rpf/common/data/
-After following the whole step, start the game
-Model name: - foodcar
	     - foodcar2
	     - foodcar3
	     - foodcar4
	     - foodcar5
	     - foodcar6
             - foodcar7
	     - foodbike
	     - foodbike2

-Ped model name: S_M_Y_Delivery_01

OPTIONAL
If you want to make the vehicles to spawn at various restaurants in the map, place "deliverygen" to dlcpacks and do the same step above.
