import tutorial

predicate aThief(Person t)
{
	t.getHeight() > 150 and
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
}

predicate isSouthern(Person p)
{
    p.getLocation() = "south"
}

predicate isBald(Person p)
{
    not exists (string c | p.getHairColor() = c)
}

class Southerner extends Person {
    Southerner()
    {
        isSouthern(this)
    }
}

class Child extends Person {
    /* the characteristic predicate */
    Child() { this.getAge() < 10 }

    /* a member predicate */
    override predicate isAllowedIn(string region) {
        region = this.getLocation()
    }
}

predicate aFireStarter(Person s)
{
  	isSouthern(s) and
	s.isAllowedIn("north") and
    isBald(s)
}

predicate hasCriminalRecord(Person p)
{
	aFireStarter(p) or aThief(p)
}

Person childOf(Person p) {
	p = parentOf(result)
}

Person ancestorOf(Person p) {
  	result = parentOf(p) or
  	result = parentOf(ancestorOf(p))
}

Person relativeOf(Person p) {
  	parentOf*(result) = parentOf*(p)
}

from Person p
where p = relativeOf("King Basil") and
  	  not (p.isDeceased()) and
	  not (hasCriminalRecord(p))
select p

