list
===
select d.*,(select name from yb_course_tree  where id=d.pid) PNAME from yb_course_tree d 