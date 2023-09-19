# Location_Project

This is a PHP,SQL,HTML,CSS,JAVASCRIPT, Leaflet project that contains opening pages having forms that users can register =
![image](https://github.com/garouuuu/Location_Project/assets/127393684/e017644b-cec5-4dd7-8798-c19025472fd0)

and log in with their respective information that is saved in database =
![image](https://github.com/garouuuu/Location_Project/assets/127393684/68297d27-7ffc-45fd-9111-638100c5cf13)

then the main website is open (index.php)=
![image](https://github.com/garouuuu/Location_Project/assets/127393684/4f89f44f-5785-4c35-94c5-a35e34d8c505)


the main page contains users info and location that is pointed also in a leaflet map , that also contains supermarkets in the users city and the user can search through them =
![image](https://github.com/garouuuu/Location_Project/assets/127393684/89a694af-83dd-41ab-b147-9b04fc51d06e)

These markets info are contained through an overpass api , the pointers only show markets in my city because thats what i got with the overpass api , other users can get info about markets in their location in various ways .

also the user can logout to the intro pages .

to work : 
1) Open xampp control panel and start the apache and the mysql server
2) open pages using localhost for example = http://localhost/insert-data/index.php ( insert-data is the file i keep all my files )
3) search through the data in the localhost: http://localhost/phpmyadmin/
4) for the leaflet map to contain the supermarkets in My city i need to be allowed through a link that is on top of my javascript code https://cors-anywhere.herokuapp.com/
   These markets info are contained through an overpass api
5) You can logout with the first button in the menu bar
