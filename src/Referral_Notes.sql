--GET NOTES
SELECT 
HNO.NOTE_ID,
ZC_NOTE.NAME as HNO_NOTE_TYPE,
REFERRAL.REFERRAL_ID,
DEP.DEPARTMENT_NAME

FROM 
HNO_INFO HNO
Inner Join HNO_ENC_INFO HNO_ENC on HNO.NOTE_ID=HNO_ENC.NOTE_ID
Inner Join ZC_NOTE_TYPE ZC_NOTE on ZC_NOTE.NOTE_TYPE_C=HNO_ENC.NOTE_TYPE_C
Inner Join NOTES_MC_RFL NOTE_RFL on NOTE_RFL.NOTE_ID=HNO.NOTE_ID
Inner Join REFERRAL on REFERRAL.REFERRAL_ID=NOTE_RFL.RECORD_ID
Inner Join CLARITY_DEP DEP on REFERRAL.REFD_TO_DEPT_ID=DEP.DEPARTMENT_ID

WHERE
(DEP.DEPARTMENT_NAME like '%Nutr%'
	or DEP.DEPARTMENT_NAME like '%Diet%')
and REFERRAL.RFL_STATUS_C in (4,6)
and HNO.NOTE_ID in ('140221064359','140220637140');

------COUNT NOTE TYPE
SELECT 
Count(HNO.NOTE_ID) as NOTE_COUNT,
ZC_NOTE.NAME as HNO_NOTE_TYPE

FROM 
HNO_INFO HNO
Inner Join HNO_ENC_INFO HNO_ENC on HNO.NOTE_ID=HNO_ENC.NOTE_ID
Inner Join ZC_NOTE_TYPE ZC_NOTE on ZC_NOTE.NOTE_TYPE_C=HNO_ENC.NOTE_TYPE_C
Inner Join NOTES_MC_RFL NOTE_RFL on NOTE_RFL.NOTE_ID=HNO.NOTE_ID
Inner Join REFERRAL on REFERRAL.REFERRAL_ID=NOTE_RFL.RECORD_ID
Inner Join CLARITY_DEP DEP on REFERRAL.REFD_TO_DEPT_ID=DEP.DEPARTMENT_ID

WHERE
(DEP.DEPARTMENT_NAME like '%Nutr%'
	or DEP.DEPARTMENT_NAME like '%Diet%')
and REFERRAL.RFL_STATUS_C in (4,6)

GROUP BY
ZC_NOTE.NAME;
