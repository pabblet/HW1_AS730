SELECT
i.specObjID as ID, i.z as z, e.lgm_tot_p50 as stellarM, e.sfr_tot_p50 as SFR, (p.r-5*LOG10(dbo.fCosmoDl(i.z, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT))-25) as absMagR, (p.g-5*LOG10(dbo.fCosmoDl(i.z, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT))-25) as absMagG, p.r as r, p.g as g
FROM galSpecInfo AS i
JOIN galSpecExtra AS e ON i.specObjID = e.specObjID
JOIN PhotoObj AS p ON i.specObjID = p.specObjID
WHERE i.z > 0.01 AND i.z < 0.1
AND e.lgm_tot_p50 != -9999
AND e.sfr_tot_p50 != -9999
AND p.r > -2000 AND p.r < 17.77
AND p.g > -2000 AND p.g < 18.77