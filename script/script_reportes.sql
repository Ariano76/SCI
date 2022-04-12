
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

DROP PROCEDURE IF EXISTS `SP_reporte_000`;
DELIMITER ;;
CREATE PROCEDURE `SP_reporte_000`(In region VARCHAR(250))
BEGIN
	SELECT b.region_beneficiario as region, count(b.id_beneficiario) as total
FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
		where e.esta_de_acuerdo = 1 and b.region_beneficiario = region
group by b.region_beneficiario ;

END ;;
DELIMITER ;

call SP_reporte_00();
call SP_reporte_000('Lima');
call SP_reporte_01_beneficiario_x_region_01('Lambayeque');

/* QUERY PIVOT */
SELECT  region_beneficiario, genero,
  COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24',
  COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
  COUNT(IF(rango_edad = 3, 1, NULL)) AS '50+',
  COUNT(IF(rango_edad = 4, 1, NULL)) AS '<18'
FROM  total_beneficiarios p where region_beneficiario = 'Lambayeque'
GROUP BY  region_beneficiario, genero;

SELECT b.region_beneficiario, c.cuantos_tienen_ingreso_por_trabajo,  
    COUNT(c.cuantos_tienen_ingreso_por_trabajo) AS 'total'
    FROM bd_bha_sci.beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
	inner join comunicacion c on b.id_beneficiario = c.id_beneficiario 
	where e.esta_de_acuerdo = 1 and c.cuantos_tienen_ingreso_por_trabajo > 0 
	group by b.region_beneficiario, c.cuantos_tienen_ingreso_por_trabajo
    order by b.region_beneficiario, c.cuantos_tienen_ingreso_por_trabajo;
