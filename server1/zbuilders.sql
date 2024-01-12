UPDATE permissions_inheritance AS b INNER JOIN (
        SELECT SUM(TIMESTAMPDIFF(MINUTE,login,IFNULL(logout,NOW()))) AS time, name FROM player_session GROUP BY name
) a ON b.child = a.name SET b.parent = 'zbuilder' WHERE a.time > 21900 AND b.parent = 'Builder';
