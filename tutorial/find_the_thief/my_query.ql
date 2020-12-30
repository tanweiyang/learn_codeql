import tutorial

from Person t
where t.getHeight() > 150 and
	  t.getHairColor() != "blond" and
	  exists(string c | t.getHairColor() = c) and
	  not t.getAge() < 30 and
	  t.getLocation() = "east" and
	  (t.getHairColor() = "brown" or t.getHairColor() = "black") and
      not (t.getHeight() > 180 and t.getHeight() < 190) and 
	  exists(Person q | q.getAge() > t.getAge()) and
	  not (t = max(Person p | | p order by p.getAge())) and
      t.getHeight() < avg(float i | exists(Person p | p.getHeight() = i) | i) and
	  t = max(Person p | p.getLocation() = "east" | p order by p.getAge())
select "The thief is " + t + "!"
