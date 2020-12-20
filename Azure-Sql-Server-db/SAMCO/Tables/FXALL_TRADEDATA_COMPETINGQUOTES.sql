CREATE TABLE [SAMCO].[FXALL_TRADEDATA_COMPETINGQUOTES] (
    [FXALL_TRADE_ID_SOURCE] VARCHAR (50)  NULL,
    [ORDER_ID]              VARCHAR (80)  NULL,
    [ACCOUNT]               VARCHAR (121) NULL,
    [DEAL_DIRECTION]        VARCHAR (1)   NULL,
    [PROVIDER]              VARCHAR (50)  NULL,
    [BID_SPOT]              FLOAT (53)    NULL,
    [ASK_SPOT]              FLOAT (53)    NULL,
    [BID_FORWARD_PTS]       FLOAT (53)    NULL,
    [ASK_FORWARD_PTS]       FLOAT (53)    NULL,
    [BID_ALL_IN]            FLOAT (53)    NULL,
    [ASK_ALL_IN]            FLOAT (53)    NULL,
    [BBAIM_ORDER_NR]        INT           NULL,
    [BBAIM_CLIENT_ORDER_ID] VARCHAR (80)  NULL,
    [BBAIM_DEAL_SIDE]       VARCHAR (80)  NULL,
    [SCD_MANDATE]           VARCHAR (20)  NULL,
    [BBAIM_ACCOUNT]         VARCHAR (50)  NULL,
    [FXALL_TRADE_ID]        INT           NULL,
    [CONFORMED_FILE_NAME]   VARCHAR (100) NULL,
    [ORDER_ALLOCATION_ID]   AS            ((((CONVERT([varchar](80),[BBAIM_ORDER_NR])+'-')+[BBAIM_DEAL_SIDE])+'-')+[SCD_MANDATE])
);

