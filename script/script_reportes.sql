drop table if exists total_beneficiarios ;
CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarios AS 
(SELECT numero_identificacion, region_beneficiario, genero, F_AGE(fecha_nacimiento) as edad,
CASE WHEN F_AGE(fecha_nacimiento) > 17 and F_AGE(fecha_nacimiento) < 25 THEN 1
WHEN F_AGE(fecha_nacimiento) > 24 and F_AGE(fecha_nacimiento) < 50 THEN 2
WHEN F_AGE(fecha_nacimiento) > 49 THEN 3
ELSE 0
END AS rango_edad
FROM bd_bha_sci.beneficiario 
);

select region_beneficiario, genero, count(rango_edad) 
from total_beneficiarios group by region_beneficiario, genero
order by region_beneficiario, genero;
