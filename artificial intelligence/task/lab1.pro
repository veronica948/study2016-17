domains
point = point(real, real)
predicates
inside(point,point,point,point,boolean)
lineSide(point, point, point, k)

clauses
inside((x1,y1),(x2,y2),(x3,y3),(x1,y1),result) :- result=true.
inside((x1,y1),(x2,y2),(x3,y3),(x2,y2),result) :- result=true.
inside((x1,y1),(x2,y2),(x3,y3),(x3,y3),result) :- result=true.

inside((x1,y1),(x2,y2),(x3,y3),(x,y),result) :- lineSide((x2,y2),(x3,y3),(x1,y1), k1), 
lineSide((x2,y2),(x3,y3),(x,y), k2), k1*k2 >= 0 

(x - x1)/(x2-x1) - (y - y1)/(y2 - y1) = k.