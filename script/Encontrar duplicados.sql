select * from  beneficiario where numero_cedula in (
SELECT numero_cedula FROM beneficiario where region_beneficiario='Lima' GROUP BY numero_cedula 
having COUNT(*) >1)
order by numero_cedula;

select id_stage, nom_01, nom_02, cedula, relacion from stage_find where cedula in 
(SELECT cedula FROM stage_find where nom_01 <> '' and nom_02 <> '' 
GROUP BY cedula having COUNT(cedula) >1) ;

SELECT cedula FROM stage_find where nom_01<>'' and nom_02<>'' GROUP BY cedula having COUNT(cedula) >1;

select dato_16, dato_23 from stage_00 where dato_23 in (SELECT dato_23 FROM stage_00 GROUP BY dato_23
having COUNT(dato_23) >1);

SELECT dato_23 FROM stage_00 GROUP BY dato_23
having COUNT(*) >1;

SELECT id_stage, dato_16 as nom1, dato_17 as nom2, dato_18 as ape1, dato_19 as ape2, dato_23 as cedula, 
'Principal' as Relacion, '' as Otro, dato_145 FROM stage_00 ;

select * from stage_find;
delete from stage_find;
truncate table stage_find;
select count(*) from stage_find;
SELECT * FROM stage_00;
SELECT * FROM stage_find where nom_01<>'' and nom_02<>'' order by nom_01;

insert into stage_find
SELECT id_stage, dato_16, dato_17, dato_18, dato_19, dato_23, 'Principal', '', dato_145 FROM stage_00 
union all
SELECT id_stage, dato_65, dato_66, dato_67, dato_68, dato_74, dato_71, dato_72, dato_145 FROM stage_00 
union all
SELECT id_stage, dato_75, dato_76, dato_77, dato_78, dato_84, dato_81, dato_82, dato_145 FROM stage_00 
union all
SELECT id_stage, dato_85, dato_86, dato_87, dato_88, dato_94, dato_91, dato_92, dato_145 FROM stage_00 
union all
SELECT id_stage, dato_95, dato_96, dato_97, dato_98, dato_104, dato_101, dato_102, dato_145 FROM stage_00 
union all
SELECT id_stage, dato_105, dato_106, dato_107, dato_108, dato_114, dato_111, dato_112, dato_145 FROM stage_00 
union all
SELECT id_stage, dato_115, dato_116, dato_117, dato_118, dato_124, dato_121, dato_122, dato_145 FROM stage_00 
union all
SELECT id_stage, dato_125, dato_126, dato_127, dato_128, dato_134, dato_131, dato_132, dato_145 FROM stage_00 ;

SELECT id_stage, dato_16, dato_17, dato_18, dato_19, dato_23, dato_145, 
dato_65, dato_66, dato_67, dato_68, dato_74, dato_71, dato_72, dato_145,
dato_75, dato_76, dato_77, dato_78, dato_84, dato_81, dato_82, dato_145, 
dato_85, dato_86, dato_87, dato_88, dato_94, dato_91, dato_92, dato_145, 
dato_95, dato_96, dato_97, dato_98, dato_104, dato_101, dato_102, dato_145, 
dato_105, dato_106, dato_107, dato_108, dato_114, dato_111, dato_112, dato_145, 
dato_115, dato_116, dato_117, dato_118, dato_124, dato_121, dato_122, dato_145, 
dato_125, dato_126, dato_127, dato_128, dato_134, dato_131, dato_132, dato_145
from stage_00 where id_stage in (93505,93705) ;

SELECT id_stage, dato_16, dato_17, dato_18, dato_19, dato_23, dato_145, 
dato_65, dato_66, dato_67, dato_68, dato_74, dato_71, dato_72, dato_145,
dato_75, dato_76, dato_77, dato_78, dato_84, dato_81, dato_82, dato_145, 
dato_85, dato_86, dato_87, dato_88, dato_94, dato_91, dato_92, dato_145, 
dato_95, dato_96, dato_97, dato_98, dato_104, dato_101, dato_102, dato_145, 
dato_105, dato_106, dato_107, dato_108, dato_114, dato_111, dato_112, dato_145, 
dato_115, dato_116, dato_117, dato_118, dato_124, dato_121, dato_122, dato_145, 
dato_125, dato_126, dato_127, dato_128, dato_134, dato_131, dato_132, dato_145
from stage_00 where dato_23 = 1759218728 or dato_74 = 1759218728 or dato_84 = 1759218728 or dato_94 = 1759218728 
or dato_104 = 1759218728 or dato_114 = 1759218728 or dato_124 = 1759218728 or dato_134 = 1759218728 ;

