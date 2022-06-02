select * from  beneficiario
where numero_cedula in (
SELECT numero_cedula FROM beneficiario
GROUP BY numero_cedula
having COUNT(*) >1)
order by numero_cedula;
select count(*) from beneficiario;

SELECT * FROM stage_00;

select * from stage_00 where dato_23 in (
SELECT dato_23 FROM stage_00 GROUP BY dato_23
having COUNT(dato_23) >1);

SELECT dato_23 FROM stage_00
GROUP BY dato_23
having COUNT(*) >1;
