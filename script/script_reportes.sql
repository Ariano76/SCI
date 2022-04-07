drop table if exists total_beneficiarios ;
CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarios AS 
(SELECT b.numero_identificacion, b.region_beneficiario, b.genero, F_AGE(b.fecha_nacimiento) as edad,
CASE WHEN F_AGE(b.fecha_nacimiento) > 17 and F_AGE(b.fecha_nacimiento) < 25 THEN 1
WHEN F_AGE(b.fecha_nacimiento) > 24 and F_AGE(b.fecha_nacimiento) < 50 THEN 2
WHEN F_AGE(b.fecha_nacimiento) > 49 THEN 3
ELSE 0
END AS rango_edad
FROM bd_bha_sci.beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
where e.esta_de_acuerdo = 1
);

select region_beneficiario, genero, count(rango_edad) as total
from total_beneficiarios 
group by region_beneficiario, genero
order by region_beneficiario, genero;


SELECT b.region_beneficiario as region, count(b.id_beneficiario) as total
FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
		where e.esta_de_acuerdo = 1
group by b.region_beneficiario ;


DROP PROCEDURE IF EXISTS `SP_reporte_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_reporte_00`()
BEGIN
	SELECT b.region_beneficiario as region, count(b.id_beneficiario) as total
FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
		where e.esta_de_acuerdo = 1
group by b.region_beneficiario ;

END ;;
DELIMITER ;

call SP_reporte_01;

/* QUERY PIVOT */
SELECT
  region_beneficiario,genero,
  COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24',
  COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
  COUNT(IF(rango_edad = 3, 1, NULL)) AS '+50'
FROM
  total_beneficiarios p
GROUP BY
  region_beneficiario,genero;

