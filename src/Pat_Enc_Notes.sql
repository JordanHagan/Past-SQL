SELECT 
PAT.PAT_ID,
PATIENT.PAT_MRN_ID,
PAT.CONTACT_DATE,
ZCTYPE.NAME as ENC_TYPE, 
ZCSTAT.NAME as APPT_STATUS, 
DEP.DEPARTMENT_NAME,
VISITPROV.PROV_NAME as VISIT_PROV_NAME,
CLARITY_EMP.NAME as NOTE_AUTHOR_NAME, 
NOTE.NOTE_AUTHORING_INST,
ZC_NOTE_STATUS.NAME as NOTE_STATUS, 
ZC_NOTE_TYPE.NAME as NOTE_TYPE

FROM
PAT_ENC PAT
Inner Join ZC_DISP_ENC_TYPE ZCTYPE on PAT.ENC_TYPE_C=ZCTYPE.DISP_ENC_TYPE_C --ENCOUNTER TYPE
Left Join CLARITY_SER VISITPROV on PAT.VISIT_PROV_ID=VISITPROV.PROV_ID --VISIT PROVIDER
Inner Join ZC_APPT_STATUS ZCSTAT on PAT.APPT_STATUS_C=ZCSTAT.APPT_STATUS_C --APPOINTMENT STATUS
Left Join ENC_NOTE_INFO NOTE on PAT.PAT_ENC_CSN_ID=NOTE.PAT_ENC_CSN_ID --NOTE INFO
Left Join CLARITY_EMP on CLARITY_EMP.USER_ID=NOTE.ENC_NOTE_AUTHOR_ID --NOTE AUTHOR
Left Join ZC_NOTE_STATUS on NOTE.NOTE_STATUS_C=ZC_NOTE_STATUS.NOTE_STATUS_C --NOTE STATUS
Left Join ZC_NOTE_TYPE on NOTE.NOTE_TYPE_C=ZC_NOTE_TYPE.NOTE_TYPE_C --NOTE TYPE
Inner Join CLARITY_DEP DEP on PAT.DEPARTMENT_ID=DEP.DEPARTMENT_ID --ENCOUNTER DEPT
Inner Join PATIENT on PAT.PAT_ID=PATIENT.PAT_ID


WHERE
DEP.DEPARTMENT_NAME like '%DM DIABETES%'
And PAT.CONTACT_DATE = '08/12/2013'