SELECT @name:=plot, @x:=x, @y:=y, @z:=z, @pitch:=pitch, @yaw:=yaw
FROM (
        SELECT plot, SUM(CASE rank WHEN 'Admin' THEN 30 WHEN 'Moderator' THEN 20 WHEN 'Superuser' THEN 10 WHEN 'Builder' THEN 1 END) AS score
        FROM creative_plot_vote
        JOIN creativetoolbox_plot_approval ON (creative_plot_vote.plot = creativetoolbox_plot_approval.name)
        WHERE plot NOT IN (SELECT name FROM creative_week_plot)
        GROUP BY plot
) AS i
LEFT JOIN creativetoolbox_plot_entrance ON (i.plot = creativetoolbox_plot_entrance.name)
ORDER BY score DESC
LIMIT 1;

INSERT INTO creative_week_plot (`name`,`starting`) VALUES (@name, NOW());

UPDATE warpdrive_portals SET destX=@x, destY=@y, destZ=@z, destYaw=@yaw, destPitch=@pitch
WHERE ID='potw_portal';

UPDATE warpdrive_locations SET x=@x, y=@y, z=@z, yaw=@yaw, pitch=@pitch
WHERE name='potw';
