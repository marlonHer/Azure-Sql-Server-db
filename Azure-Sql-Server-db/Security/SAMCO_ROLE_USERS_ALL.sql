﻿CREATE ROLE [SAMCO_ROLE_USERS_ALL]
    AUTHORIZATION [db_owner];


GO
ALTER ROLE [SAMCO_ROLE_USERS_ALL] ADD MEMBER [SAMCO_ROLE_USERS_AS];


GO
ALTER ROLE [SAMCO_ROLE_USERS_ALL] ADD MEMBER [SAMCO_ROLE_USERS_AD];


GO
ALTER ROLE [SAMCO_ROLE_USERS_ALL] ADD MEMBER [SAMCO_ROLE_USERS_TT];


GO
ALTER ROLE [SAMCO_ROLE_USERS_ALL] ADD MEMBER [SAMCO_ROLE_USERS_FI];


GO
ALTER ROLE [SAMCO_ROLE_USERS_ALL] ADD MEMBER [SAMCO_ROLE_USERS_EQ];


GO
ALTER ROLE [SAMCO_ROLE_USERS_ALL] ADD MEMBER [SAMCO_ROLE_USERS_AI];

