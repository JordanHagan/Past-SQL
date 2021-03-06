Select PL.PREFERENCE_ID as EPD_CID,
PL_NAME.PREFERENCE_NAME as EPD_DOT_TWO,
PL.LINE,
PL.DIAGNOSIS_ID as EDG_CID, 
EDG.DX_NAME
From PREF_LIST_DX  PL
Inner Join CLARITY_EDG EDG on PL.DIAGNOSIS_ID=EDG.DX_ID
Inner Join EDITOR_PREF_LISTS PL_NAME on PL.PREFERENCE_ID=PL_NAME.PREFERENCE_ID
Where PL.PREFERENCE_ID='14014001904' -- Family Medicine
Order By PL.LINE ASC;

Select PL.PREFERENCE_ID as EPD_CID,
PL_NAME.PREFERENCE_NAME as EPD_DOT_TWO,
PL.LINE,
PL.DIAGNOSIS_ID as EDG_CID, 
EDG.DX_NAME
From PREF_LIST_DX  PL
Inner Join CLARITY_EDG EDG on PL.DIAGNOSIS_ID=EDG.DX_ID
Inner Join EDITOR_PREF_LISTS PL_NAME on PL.PREFERENCE_ID=PL_NAME.PREFERENCE_ID
Where PL.PREFERENCE_ID='14014002904' -- Internal Medicine
Order By PL.LINE ASC;